import 'package:fpdart/fpdart.dart';
import '../../../app/di/injection_container.dart';
import '../../../core/cubits/user_cubit.dart';
import '../../../core/network/failure/failure.dart';
import '../../../core/result/result.dart';
import '../../../core/shared_preferences/prefs_keys.dart';
import '../../../core/shared_preferences/shared_prefs.dart';
import '../../../domain/auth/entities/user.dart';
import '../../../domain/auth/repo/auth_repo.dart';
import '../../../domain/auth/use_cases/login_use_case/login_use_case.dart';
import '../models/user_model.dart';
import '../../../core/enums/enums.dart';

class AuthRepoImpl implements AuthRepo {
  const AuthRepoImpl();

  @override
  Future<Result<User>> login({required LoginParams params}) async {
    try {
      // Mock login success
      final mockUser = UserModel(
        id: 'mock_id',
        name: 'Mock User',
        email: 'mock@example.com',
        role: UserType.teacher,
        gender: Gender.male,
        profilePictureUrl: null,
      );

      sl<SharedPrefs>()
        ..saveBool(key: PrefsKeys.isLogged, value: true)
        ..saveSecuredValue(
          key: PrefsKeys.userDetails,
          value: mockUser.toJson(),
        );
      
      if (sl.isRegistered<UserCubit>()) {
         sl<UserCubit>().setUser(mockUser.toEntity());
      }
      
      return Right(mockUser.toEntity());
    } catch (e) {
      return Left(Failure.server(message: e.toString()));
    }
  }

  @override
  Future<Result<void>> sendOtp({required String phone}) async {
    try {
      // Mock OTP success
      return const Right(null);
    } catch (e) {
      return Left(Failure.server(message: e.toString()));
    }
  }
}
