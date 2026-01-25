import 'package:dio/dio.dart';
import '../../../core/network/failure/failure.dart';
import '../../../domain/auth/use_cases/login_use_case/login_use_case.dart';
import '../models/user_model.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio _dio;
  AuthRemoteDataSourceImpl(this._dio);
  @override
  Future<UserModel> login({required LoginParams params}) async {
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
      await _dio.post('/auth/send-otp', data: {'phone': phone});
    } on DioException catch (e) {
      throw e.error as Failure;
    }
  }
}

abstract class AuthRemoteDataSource {
  Future<UserModel> login({required LoginParams params});
  Future<void> sendOtp({required String phone});
}
