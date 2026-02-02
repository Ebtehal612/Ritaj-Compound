import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import '../../../../core/states/base_state.dart';
import '../../../../core/use_cases/base_use_case.dart';
import '../../../../domain/permits/entities/visitor_permit.dart';
import '../../../../domain/permits/use_cases/get_active_permits_use_case.dart';
import '../../../../domain/permits/use_cases/delete_visitor_permit_use_case.dart';
import '../../../../domain/permits/use_cases/get_cached_visitors_use_case.dart';

class VisitorsCubit extends Cubit<BaseState<List<VisitorPermit>>> {
  final GetActivePermitsUseCase _getUseCase;
  final GetCachedVisitorsUseCase _getCachedUseCase;
  final DeleteVisitorPermitUseCase _deleteUseCase;

  List<VisitorPermit> _allPermits = []; // All permits from server
  List<VisitorPermit> _activePermits = []; // Today's permits
  List<VisitorPermit> _previousPermits = []; // Older permits

  VisitorsCubit(this._getUseCase, this._getCachedUseCase, this._deleteUseCase)
      : super(const BaseState.initial());

  void reset() {
    _allPermits = [];
    _activePermits = [];
    _previousPermits = [];
    emit(const BaseState.initial());
  }

  // Getters for accessing categorized permits
  List<VisitorPermit> get activePermits => _activePermits;
  List<VisitorPermit> get previousPermits => _previousPermits;

  Future<void> getActivePermits() async {
    if (kDebugMode) {
      print('🔄 VisitorsCubit: Getting all permits...');
    }

    // 1. Try to load from cache first
    final cachedResult = await _getCachedUseCase.call(params: const NoParams());
    cachedResult.fold(
      (_) => null, // Ignore cache errors
      (cachedData) {
        if (cachedData.isNotEmpty) {
          if (kDebugMode) {
            print('📦 VisitorsCubit: Loaded ${cachedData.length} permits from cache');
          }
          _allPermits = cachedData;
          _categorizePermitsByDate();
          _emitUpdatedState();
        }
      },
    );

    // 2. Only show full loading if we have no data at all
    if (_allPermits.isEmpty) {
      emit(const BaseState.loading());
    }

    final result = await _getUseCase.call(params: const NoParams());
    result.fold(
      (failure) {
        if (kDebugMode) {
          print('❌ VisitorsCubit: Failed to get permits: ${failure.message}');
        }
        emit(BaseState.failure(failure: failure));
      },
      (data) {
        if (kDebugMode) {
          print('✅ VisitorsCubit: Got ${data.length} permits from server');
        }

        _allPermits = data;
        _categorizePermitsByDate();

        if (kDebugMode) {
          print(
              '📋 VisitorsCubit: Active permits (today): ${_activePermits.length}');
          print(
              '📋 VisitorsCubit: Previous permits (older): ${_previousPermits.length}');
        }

        // Emit active permits for the main UI
        if (_activePermits.isEmpty) {
          emit(const BaseState.empty());
        } else {
          emit(BaseState.success(data: _activePermits));
        }
      },
    );
  }

  void _categorizePermitsByDate() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    // final todayEnd = today.add(const Duration(days: 1)); // Not strictly needed if we just check dates

    // Active: Today and Future
    // "If the date coming from the server is today, put it in the 'Active Permissions' section."
    _activePermits = _allPermits.where((permit) {
      final localDate = permit.date.toLocal();
      final permitDate = DateTime(localDate.year, localDate.month, localDate.day);
      // If permitDate is today or after today (future)
      return !permitDate.isBefore(today);
    }).toList();

    // Previous: Strictly before today
    // "If it's older than today, put it in the 'Previous Visitors' section."
    _previousPermits = _allPermits.where((permit) {
      final localDate = permit.date.toLocal();
      final permitDate = DateTime(localDate.year, localDate.month, localDate.day);
      return permitDate.isBefore(today);
    }).toList();

    // Sort previous permits by date (newest first)
    _previousPermits.sort((a, b) => b.date.compareTo(a.date));

    if (kDebugMode) {
      print('🗓️ Date categorization:');
      print('  Today (cutoff): $today');
      print('  Active permits: ${_activePermits.length}');
      for (var permit in _activePermits) {
        print('    - ${permit.name}: ${permit.date}');
      }
      print('  Previous permits: ${_previousPermits.length}');
      for (var permit in _previousPermits.take(3)) {
        // Show first 3
        print('    - ${permit.name}: ${permit.date}');
      }
    }
  }

  Future<void> deleteVisitorPermit(String id) async {
    if (id.isEmpty) {
      if (kDebugMode) {
        print('⚠️ VisitorsCubit: Cannot delete permit with empty ID');
      }
      return;
    }

    if (kDebugMode) {
      print('🗑️ VisitorsCubit: Deleting permit "$id"');
    }

    // Optimistic UI Update: Remove from all lists immediately
    final removedFromActive = _activePermits.indexWhere((p) => p.id == id);
    final removedFromPrevious = _previousPermits.indexWhere((p) => p.id == id);
    final removedFromAll = _allPermits.indexWhere((p) => p.id == id);

    VisitorPermit? removedPermit;

    if (removedFromActive != -1) {
      removedPermit = _activePermits.removeAt(removedFromActive);
      if (kDebugMode) {
        print('🚀 VisitorsCubit: Optimistic delete from active permits');
      }
    }

    if (removedFromPrevious != -1) {
      if (removedPermit == null) {
        removedPermit = _previousPermits.removeAt(removedFromPrevious);
      } else {
        _previousPermits.removeAt(removedFromPrevious);
      }
      if (kDebugMode) {
        print('🚀 VisitorsCubit: Optimistic delete from previous permits');
      }
    }

    if (removedFromAll != -1) {
      if (removedPermit == null) {
        removedPermit = _allPermits.removeAt(removedFromAll);
      } else {
        _allPermits.removeAt(removedFromAll);
      }
    }

    _emitUpdatedState();

    // Delete from server
    final result = await _deleteUseCase.call(params: id);
    result.fold(
      (failure) {
        if (kDebugMode) {
          print(
              '❌ VisitorsCubit: Failed to delete server permit: ${failure.message}');
        }

        // Rollback optimistic update if failed
        if (removedPermit != null) {
          _allPermits.insert(removedFromAll, removedPermit);
          _categorizePermitsByDate(); // Re-categorize after rollback
          _emitUpdatedState();
        }

        emit(BaseState.failure(failure: failure));
      },
      (_) {
        if (kDebugMode) {
          print('✅ VisitorsCubit: Server permit deleted successfully');
        }
      },
    );
  }

  void _emitUpdatedState() {
    if (_activePermits.isEmpty) {
      emit(const BaseState.empty());
    } else {
      emit(BaseState.success(data: List.from(_activePermits)));
    }
  }

  // Add a method to add a permit (now all permits are server permits)
  void addServerPermit(VisitorPermit permit) {
    if (kDebugMode) {
      print(
          '➕ VisitorsCubit: Adding server permit: ${permit.name} (ID: ${permit.id})');
    }

    _allPermits.add(permit);
    _categorizePermitsByDate(); // Re-categorize after adding
    _emitUpdatedState();
  }

  // Force refresh method
  Future<void> forceRefresh() async {
    if (kDebugMode) {
      print('🔄 VisitorsCubit: Force refreshing...');
    }
    emit(const BaseState.loading());
    await getActivePermits();
  }
}
