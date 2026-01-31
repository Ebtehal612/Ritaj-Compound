import 'package:fpdart/fpdart.dart';
import '../remote/auth_remote_data_source.dart';
import '../../../app/di/injection_container.dart';
import '../../../core/cubits/user_cubit.dart';
import '../../../core/network/failure/failure.dart';
import '../../../core/result/result.dart';
import '../../../core/shared_preferences/prefs_keys.dart';
import '../../../core/shared_preferences/shared_prefs.dart';
import '../../../domain/auth/entities/user.dart';
import '../../../domain/auth/repo/auth_repo.dart';
import '../../../domain/auth/use_cases/login_use_case/login_use_case.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource _remoteDataSource;
  const AuthRepoImpl(this._remoteDataSource);

  @override
  Future<Result<User>> login({required LoginParams params}) async {
    try {
      final userModel = await _remoteDataSource.login(params: params);

      sl<SharedPrefs>()
        ..saveBool(key: PrefsKeys.isLogged, value: true)
        ..saveSecuredValue(
          key: PrefsKeys.userDetails,
          value: userModel.toJson(),
        );
      
      if (sl.isRegistered<UserCubit>()) {
         sl<UserCubit>().setUser(userModel.toEntity());
      }
      
      return Right(userModel.toEntity());
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(Failure.server(message: e.toString()));
    }
  }

  @override
  Future<Result<void>> sendOtp({required String phone}) async {
    try {
      await _remoteDataSource.sendOtp(phone: phone);
      return const Right(null);
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(Failure.server(message: e.toString()));
    }
  }
}
