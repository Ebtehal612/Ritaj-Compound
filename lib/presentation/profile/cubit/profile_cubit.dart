import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ritaj_compound/core/states/base_state.dart';
import 'package:ritaj_compound/core/use_cases/base_use_case.dart';
import 'package:ritaj_compound/domain/profile/entities/profile.dart';
import 'package:ritaj_compound/domain/profile/use_cases/get_profile_use_case.dart';

class ProfileCubit extends Cubit<BaseState<Profile>> {
  final GetProfileUseCase _getProfileUseCase;

  ProfileCubit(this._getProfileUseCase) : super(const BaseState.initial());

  Future<void> getProfile() async {
    emit(const BaseState.loading());

    final result = await _getProfileUseCase.call(params: const NoParams());

    result.fold(
      (failure) => emit(BaseState.failure(failure: failure)),
      (profile) => emit(BaseState.success(data: profile)),
    );
  }
}
