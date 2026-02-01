import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import '../../../../core/states/base_state.dart';
import '../../../../domain/permits/entities/delivery_permit.dart';
import '../../../../domain/permits/use_cases/create_delivery_permit_use_case.dart';

class CreateDeliveryPermitCubit extends Cubit<BaseState<DeliveryPermit>> {
  final CreateDeliveryPermitUseCase _useCase;

  CreateDeliveryPermitCubit(this._useCase) : super(const BaseState.initial());

  Future<void> createDeliveryPermit(DeliveryPermit permit) async {
    if (kDebugMode) {
      print('🚀 CreateDeliveryPermitCubit: Creating delivery permit for ${permit.name}');
    }
    
    emit(const BaseState.loading());
    final result = await _useCase.call(params: permit);
    result.fold(
      (failure) {
        if (kDebugMode) {
          print('❌ CreateDeliveryPermitCubit: Failed to create delivery permit: ${failure.message}');
        }
        emit(BaseState.failure(failure: failure));
      },
      (createdPermit) {
        if (kDebugMode) {
          print('✅ CreateDeliveryPermitCubit: Delivery permit created successfully with ID: ${createdPermit.id}');
        }
        emit(BaseState.success(data: createdPermit));
      },
    );
  }
}
