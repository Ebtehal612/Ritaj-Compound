import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/states/base_state.dart';
import '../../../../domain/auth/entities/user.dart';
import '../../../../domain/auth/use_cases/login_use_case/login_use_case.dart';
import '../../../../domain/auth/repo/auth_repo.dart';


class LoginCubit extends Cubit<BaseState<User>> {
  LoginCubit(this._useCase, this._authRepo) : super(const BaseState.initial());
  final LoginUseCase _useCase;
  final AuthRepo _authRepo;

  Future<void> login({required LoginParams params}) async {
    emit(const BaseState.loading());
    final result = await _useCase.call(params: params);
    result.fold((failure) {
      emit(BaseState.failure(failure: failure));
    }, (data) async {
      emit(BaseState.success(data: data));
    });
  }

  Future<void> sendOtp({required String phone}) async {
    emit(const BaseState.loading());
    final result = await _authRepo.sendOtp(phone: phone);
    result.fold((failure) {
      emit(BaseState.failure(failure: failure));
    }, (_) async {
      // Use empty state to signal "Ready for OTP" to navigation listeners
      emit(const BaseState.empty());
    });
  }
}
