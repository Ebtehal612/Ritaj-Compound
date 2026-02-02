import 'package:dio/dio.dart';
import 'package:ritaj_compound/core/enums/enums.dart';
import '../../../core/network/failure/failure.dart';
import '../../../domain/auth/use_cases/login_use_case/login_use_case.dart';
import '../models/user_model.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio _dio;
  AuthRemoteDataSourceImpl(this._dio);
  
  @override
  Future<UserModel> login({required LoginParams params}) async {
    // Temporary bypass for testing: allow any 4-digit OTP
    if (params.otp != null && params.otp!.length == 4) {
      return const UserModel(
        id: 'mock_id',
        name: 'Test Resident',
        email: 'resident@test.com',
        role: UserType.resident,
        profilePictureUrl: null,
      );
    }

    try {
      final response = await _dio.post('/auth/login', data: params.toJson());
      return UserModel.fromJson(response.data);
    } on DioException catch (e) {
      throw e.error as Failure;
    }
  }

  @override
  Future<void> sendOtp({required String phone}) async {
    try {
      await _dio.post('/auth/login', data: {
        'strategy': 'phone',
        'credentials': phone,
      });
    } on DioException catch (e) {
      throw e.error as Failure;
    }
  }
}

abstract class AuthRemoteDataSource {
  Future<UserModel> login({required LoginParams params});
  Future<void> sendOtp({required String phone});
}
