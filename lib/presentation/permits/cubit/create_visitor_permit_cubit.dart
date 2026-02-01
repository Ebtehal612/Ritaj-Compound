import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import '../../../../core/states/base_state.dart';
import '../../../../domain/permits/entities/visitor_permit.dart';
import '../../../../domain/permits/use_cases/create_visitor_permit_use_case.dart';

class CreateVisitorPermitCubit extends Cubit<BaseState<VisitorPermit>> {
  final CreateVisitorPermitUseCase _useCase;

  CreateVisitorPermitCubit(this._useCase) : super(const BaseState.initial());

  Future<void> createVisitorPermit(VisitorPermit permit) async {
    if (kDebugMode) {
      print('🚀 CreateVisitorPermitCubit: Creating permit for ${permit.name}');
    }
    
    emit(const BaseState.loading());
    final result = await _useCase.call(params: permit);
    result.fold(
      (failure) {
        if (kDebugMode) {
          print('❌ CreateVisitorPermitCubit: Failed to create permit: ${failure.message}');
        }
        emit(BaseState.failure(failure: failure));
      },
      (createdPermit) {
        if (kDebugMode) {
          print('✅ CreateVisitorPermitCubit: Permit created successfully with ID: ${createdPermit.id}');
        }
        emit(BaseState.success(data: createdPermit));
      },
    );
  }
}
