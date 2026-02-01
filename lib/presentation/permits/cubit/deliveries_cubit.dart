import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import '../../../../core/states/base_state.dart';
import '../../../../core/use_cases/base_use_case.dart';
import '../../../../domain/permits/entities/delivery_permit.dart';
import '../../../../domain/permits/use_cases/get_active_deliveries_use_case.dart';
import '../../../../domain/permits/use_cases/delete_delivery_permit_use_case.dart';
import '../../../../domain/permits/use_cases/get_cached_deliveries_use_case.dart';

class DeliveriesCubit extends Cubit<BaseState<List<DeliveryPermit>>> {
  final GetActiveDeliveriesUseCase _getUseCase;
  final GetCachedDeliveriesUseCase _getCachedUseCase;
  final DeleteDeliveryPermitUseCase _deleteUseCase;

  List<DeliveryPermit> _allDeliveries = []; // All deliveries from server
  List<DeliveryPermit> _activeDeliveries = []; // Today's deliveries
  List<DeliveryPermit> _previousDeliveries = []; // Older deliveries

  DeliveriesCubit(this._getUseCase, this._getCachedUseCase, this._deleteUseCase)
      : super(const BaseState.initial());

  void reset() {
    _allDeliveries = [];
    _activeDeliveries = [];
    _previousDeliveries = [];
    emit(const BaseState.initial());
  }

  // Getters for accessing categorized deliveries
  List<DeliveryPermit> get activeDeliveries => _activeDeliveries;
  List<DeliveryPermit> get previousDeliveries => _previousDeliveries;

  Future<void> getActiveDeliveries() async {
    if (kDebugMode) {
      print('🔄 DeliveriesCubit: Getting all deliveries...');
    }

    // 1. Try to load from cache first
    final cachedResult = await _getCachedUseCase.call(params: const NoParams());
    cachedResult.fold(
      (_) => null,
      (cachedData) {
        if (cachedData.isNotEmpty) {
          if (kDebugMode) {
            print('📦 DeliveriesCubit: Loaded ${cachedData.length} deliveries from cache');
          }
          _allDeliveries = cachedData;
          _categorizeDeliveriesByDate();
          _emitUpdatedState();
        }
      },
    );
    
    // 2. Only show full loading if we have no data
    if (_allDeliveries.isEmpty) {
      emit(const BaseState.loading());
    }

    final result = await _getUseCase.call(params: const NoParams());
    result.fold(
      (failure) {
        if (kDebugMode) {
          print('❌ DeliveriesCubit: Failed to get deliveries: ${failure.message}');
        }
        emit(BaseState.failure(failure: failure));
      },
      (data) {
        if (kDebugMode) {
          print('✅ DeliveriesCubit: Got ${data.length} deliveries from server');
        }

        // Merge incoming data with existing data to preserve fields like expectedArrival
        // which might be missing from the list endpoint
        _allDeliveries = data.map((newDelivery) {
          final oldDelivery = _allDeliveries.firstWhere(
            (old) => old.id == newDelivery.id,
            orElse: () => newDelivery,
          );
          
          // If newDelivery has empty arrival time but old one has it, keep the old one
          if ((newDelivery.expectedArrival.isEmpty) && 
              oldDelivery.expectedArrival.isNotEmpty) {
            if (kDebugMode) {
              print('🩹 Preserving expectedArrival for delivery ${newDelivery.id}');
            }
            return newDelivery.copyWith(expectedArrival: oldDelivery.expectedArrival);
          }
          return newDelivery;
        }).toList();
        _categorizeDeliveriesByDate();
        
        if (kDebugMode) {
          print('📋 DeliveriesCubit: Active deliveries (today): ${_activeDeliveries.length}');
          print('📋 DeliveriesCubit: Previous deliveries (older): ${_previousDeliveries.length}');
        }
        
        // Emit active deliveries for the main UI
        if (_activeDeliveries.isEmpty) {
          emit(const BaseState.empty());
        } else {
          emit(BaseState.success(data: _activeDeliveries));
        }
      },
    );
  }

  void _categorizeDeliveriesByDate() {
    final today = DateTime.now();
    final todayStart = DateTime(today.year, today.month, today.day);
    final todayEnd = todayStart.add(const Duration(days: 1));

    // Active: Today and Future
    _activeDeliveries = _allDeliveries.where((delivery) {
      final deliveryDate = DateTime(delivery.date.year, delivery.date.month, delivery.date.day);
      return !deliveryDate.isBefore(todayStart);
    }).toList();

    // Previous: Strictly before today
    _previousDeliveries = _allDeliveries.where((delivery) {
      final deliveryDate = DateTime(delivery.date.year, delivery.date.month, delivery.date.day);
      return deliveryDate.isBefore(todayStart);
    }).toList();

    // Sort previous deliveries by date (newest first)
    _previousDeliveries.sort((a, b) => b.date.compareTo(a.date));

    if (kDebugMode) {
      print('🗓️ Delivery date categorization:');
      print('  Today range: $todayStart to $todayEnd');
      print('  Active deliveries: ${_activeDeliveries.length}');
      for (var delivery in _activeDeliveries) {
        print('    - ${delivery.name}: ${delivery.date}');
      }
      print('  Previous deliveries: ${_previousDeliveries.length}');
      for (var delivery in _previousDeliveries.take(3)) { // Show first 3
        print('    - ${delivery.name}: ${delivery.date}');
      }
    }
  }

  Future<void> deleteDeliveryPermit(String id) async {
    if (id.isEmpty) {
      if (kDebugMode) {
        print('⚠️ DeliveriesCubit: Cannot delete delivery with empty ID');
      }
      return;
    }

    if (kDebugMode) {
      print('🗑️ DeliveriesCubit: Deleting delivery $id');
    }
    
    // Optimistic UI Update: Remove from all lists immediately
    final removedFromActive = _activeDeliveries.indexWhere((p) => p.id == id);
    final removedFromPrevious = _previousDeliveries.indexWhere((p) => p.id == id);
    final removedFromAll = _allDeliveries.indexWhere((p) => p.id == id);
    
    DeliveryPermit? removedDelivery;
    
    if (removedFromActive != -1) {
      removedDelivery = _activeDeliveries.removeAt(removedFromActive);
      if (kDebugMode) {
        print('🚀 DeliveriesCubit: Optimistic delete from active deliveries');
      }
    }
    
    if (removedFromPrevious != -1) {
      if (removedDelivery == null) {
        removedDelivery = _previousDeliveries.removeAt(removedFromPrevious);
      } else {
        _previousDeliveries.removeAt(removedFromPrevious);
      }
      if (kDebugMode) {
        print('🚀 DeliveriesCubit: Optimistic delete from previous deliveries');
      }
    }
    
    if (removedFromAll != -1) {
      if (removedDelivery == null) {
        removedDelivery = _allDeliveries.removeAt(removedFromAll);
      } else {
        _allDeliveries.removeAt(removedFromAll);
      }
    }
    
    _emitUpdatedState();

    final result = await _deleteUseCase.call(params: id);
    result.fold(
      (failure) {
        if (kDebugMode) {
          print('❌ DeliveriesCubit: Failed to delete delivery: ${failure.message}');
        }
        
        // Rollback optimistic update if failed
        if (removedDelivery != null) {
          _allDeliveries.insert(removedFromAll, removedDelivery);
          _categorizeDeliveriesByDate(); // Re-categorize after rollback
          _emitUpdatedState();
        }
        
        emit(BaseState.failure(failure: failure));
      },
      (_) {
        if (kDebugMode) {
          print('✅ DeliveriesCubit: Delivery deleted successfully');
        }
      },
    );
  }

  void _emitUpdatedState() {
    if (_activeDeliveries.isEmpty) {
      emit(const BaseState.empty());
    } else {
      emit(BaseState.success(data: List.from(_activeDeliveries)));
    }
  }

  void addServerPermit(DeliveryPermit permit) {
    if (kDebugMode) {
      print('➕ DeliveriesCubit: Adding server delivery: ${permit.name} (ID: ${permit.id})');
    }
    
    _allDeliveries.add(permit);
    _categorizeDeliveriesByDate(); // Re-categorize after adding
    _emitUpdatedState();
  }

  void addDeliveryLocally(DeliveryPermit permit) {
    if (kDebugMode) {
      print('➕ DeliveriesCubit: Adding delivery: ${permit.name} (ID: ${permit.id})');
    }
    _allDeliveries.add(permit);
    _categorizeDeliveriesByDate();
    _emitUpdatedState();
  }

  // Force refresh method
  Future<void> forceRefresh() async {
    if (kDebugMode) {
      print('🔄 DeliveriesCubit: Force refreshing...');
    }
    emit(const BaseState.loading());
    await getActiveDeliveries();
  }
}