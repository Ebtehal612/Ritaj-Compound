import '../../../core/result/result.dart';
import '../entities/user.dart';
import '../use_cases/login_use_case/login_use_case.dart';


abstract class AuthRepo {
  Future<Result<User>> login({required LoginParams params});
  Future<Result<void>> sendOtp({required String phone});
}
