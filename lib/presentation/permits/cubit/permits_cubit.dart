import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import '../../../../core/states/base_state.dart';
import '../../../../core/use_cases/base_use_case.dart';
import '../../../../domain/permits/entities/visitor_permit.dart';
import '../../../../domain/permits/use_cases/get_active_permits_use_case.dart';
import '../../../../domain/permits/use_cases/delete_visitor_permit_use_case.dart';

class PermitsCubit extends Cubit<BaseState<List<VisitorPermit>>> {
  final GetActivePermitsUseCase _getUseCase;
  final DeleteVisitorPermitUseCase _deleteUseCase;

  List<VisitorPermit> _permits = [];
  List<VisitorPermit> _localPermits = []; // Track locally added permits

  PermitsCubit(this._getUseCase, this._deleteUseCase)
      : super(const BaseState.initial());

  Future<void> getActivePermits() async {
    if (kDebugMode) {
      print('🔄 PermitsCubit: Getting active permits...');
    }
    
    // Only show full loading if we have no data
    if (_permits.isEmpty && _localPermits.isEmpty) {
      emit(const BaseState.loading());
    }

    final result = await _getUseCase.call(params: const NoParams());
    result.fold(
      (failure) {
        if (kDebugMode) {
          print('❌ PermitsCubit: Failed to get permits: ${failure.message}');
        }
        emit(BaseState.failure(failure: failure));
      },
      (data) {
        if (kDebugMode) {
          print('✅ PermitsCubit: Got ${data.length} permits from server');
        }
        
        _permits = data;
        
        // Combine API permits with local permits (for backward compatibility)
        final allPermits = [...data, ..._localPermits];
        
        if (kDebugMode) {
          print('📋 PermitsCubit: Total permits (Server + Local): ${allPermits.length}');
        }
        
        if (allPermits.isEmpty) {
          emit(const BaseState.empty());
        } else {
          emit(BaseState.success(data: allPermits));
        }
      },
    );
  }

  Future<void> deleteVisitorPermit(String id) async {
    if (id.isEmpty) {
      if (kDebugMode) {
        print('⚠️ PermitsCubit: Cannot delete permit with empty ID');
      }
      return;
    }

    if (kDebugMode) {
      print('🗑️ PermitsCubit: Deleting permit $id');
    }
    
    // Check if this is a local permit (starts with 'local_') - for backward compatibility
    final isLocalPermit = id.startsWith('local_');
    
    if (isLocalPermit) {
      if (kDebugMode) {
        print('🗑️ PermitsCubit: Deleting local permit $id');
      }
      // Remove from local permits only
      _localPermits.removeWhere((permit) => permit.id == id);
      _emitUpdatedState();
      return;
    }
    
    // Optimistic UI Update: Remove from list immediately
    final removedPermitIndex = _permits.indexWhere((p) => p.id == id);
    VisitorPermit? removedPermit;
    
    if (removedPermitIndex != -1) {
      removedPermit = _permits.removeAt(removedPermitIndex);
      if (kDebugMode) {
        print('🚀 PermitsCubit: Optimistic delete for server permit $id');
      }
      _emitUpdatedState();
    }

    // For server permits, delete from server
    final result = await _deleteUseCase.call(params: id);
    result.fold(
      (failure) {
        if (kDebugMode) {
          print('❌ PermitsCubit: Failed to delete server permit: ${failure.message}');
        }
        
        // Rollback optimistic update if failed
        if (removedPermit != null) {
          _permits.insert(removedPermitIndex, removedPermit);
          _emitUpdatedState();
        }
        
        emit(BaseState.failure(failure: failure));
      },
      (_) {
        if (kDebugMode) {
          print('✅ PermitsCubit: Server permit deleted successfully');
        }
        // No need to refresh with getActivePermits() as we already updated the list optimistically
        // Unless we want to be 100% sure about the server state
      },
    );
  }

  void _emitUpdatedState() {
    final allPermits = [..._permits, ..._localPermits];
    if (allPermits.isEmpty) {
      emit(const BaseState.empty());
    } else {
      emit(BaseState.success(data: allPermits));
    }
  }

  // Add a method to add a permit (now all permits are server permits)
  void addPermitLocally(VisitorPermit permit) {
    if (kDebugMode) {
      print('➕ PermitsCubit: Adding server permit: ${permit.name} (ID: ${permit.id})');
    }
    _permits.add(permit);
    
    if (kDebugMode) {
      print('📋 PermitsCubit: Emitting ${_permits.length} total permits');
    }
    emit(BaseState.success(data: List.from(_permits)));
  }

  // Force refresh method
  Future<void> forceRefresh() async {
    if (kDebugMode) {
      print('🔄 PermitsCubit: Force refreshing...');
    }
    emit(const BaseState.loading());
    await getActivePermits();
  }
}
