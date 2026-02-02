import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../../core/network/exceptions.dart';
import '../models/profile_model.dart';

abstract class ProfileRemoteDataSource {
  Future<ProfileModel> getProfile();
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final Dio dio;

  ProfileRemoteDataSourceImpl(this.dio);

  @override
  Future<ProfileModel> getProfile() async {
    try {
      if (kDebugMode) {
        print('🔍 ProfileRemoteDataSource: Fetching profile from server...');
      }
      
      final response = await dio.get('/profile');
      
      if (kDebugMode) {
        print('✅ ProfileRemoteDataSource: Server response status: ${response.statusCode}');
        print('✅ ProfileRemoteDataSource: Server response data type: ${response.data.runtimeType}');
        print('✅ ProfileRemoteDataSource: Server response: ${response.data}');
      }
      
      if (response.statusCode == 200) {
        var responseData = response.data;
        
        // Handle different response formats
        Map<String, dynamic> profileData;
        
        if (responseData is Map<String, dynamic>) {
          // Check if response has the expected format with status and data
          if (responseData.containsKey('status') && responseData.containsKey('data')) {
            if (responseData['status'] == true && responseData['data'] != null) {
              profileData = responseData['data'] as Map<String, dynamic>;
            } else {
              throw ServerException(message: responseData['message'] ?? 'Profile data not found');
            }
          } 
          // Check if response has data field directly
          else if (responseData.containsKey('data')) {
            profileData = responseData['data'] as Map<String, dynamic>;
          }
          // Use the response data directly if it contains profile fields
          else if (responseData.containsKey('username') || responseData.containsKey('name') || responseData.containsKey('id')) {
            profileData = responseData;
          }
          else {
            if (kDebugMode) {
              print('❌ ProfileRemoteDataSource: Unexpected response format. Keys: ${responseData.keys.toList()}');
            }
            throw ServerException(message: 'Unexpected response format');
          }
        } else {
          throw ServerException(message: 'Expected JSON object, got ${responseData.runtimeType}');
        }
        
        if (kDebugMode) {
          print('🎯 ProfileRemoteDataSource: Profile data to parse: $profileData');
        }
        
        return ProfileModel.fromJson(profileData);
      } else {
        throw ServerException(message: 'Server error: ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (kDebugMode) {
        print('❌ ProfileRemoteDataSource: DioException: ${e.message}');
        print('❌ ProfileRemoteDataSource: Response: ${e.response?.data}');
        print('❌ ProfileRemoteDataSource: Status: ${e.response?.statusCode}');
      }
      throw ServerException(message: e.response?.data?['message'] ?? e.message ?? 'Network error');
    } catch (e) {
      if (kDebugMode) {
        print('❌ ProfileRemoteDataSource: General error: $e');
      }
      throw ServerException(message: e.toString());
    }
  }
}
