import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../../core/network/failure/failure.dart';
import '../models/visitor_permit_model.dart';
import '../models/delivery_permit_model.dart';


abstract class PermitsRemoteDataSource {
  Future<VisitorPermitModel> createVisitorPermit({required VisitorPermitModel permit});
  Future<List<VisitorPermitModel>> getActivePermits();
  Future<void> deleteVisitorPermit({required String id});

  Future<DeliveryPermitModel> createDeliveryPermit({required DeliveryPermitModel permit});
  Future<List<DeliveryPermitModel>> getActiveDeliveries();
  Future<void> deleteDeliveryPermit({required String id});
}

class PermitsRemoteDataSourceImpl implements PermitsRemoteDataSource {
  final Dio _dio;
  PermitsRemoteDataSourceImpl(this._dio);

  Failure _handleError(dynamic e) {
    if (kDebugMode) {
      print('🔍 Handling error: ${e.runtimeType} - $e');
    }
    
    if (e is DioException) {
      if (kDebugMode) {
        print('🔍 DioException details:');
        print('  - Type: ${e.type}');
        print('  - Message: ${e.message}');
        print('  - Response: ${e.response?.data}');
        print('  - Status Code: ${e.response?.statusCode}');
      }
      
      if (e.error is Failure) {
        return e.error as Failure;
      }
      
      // Handle specific HTTP status codes
      if (e.response != null) {
        final statusCode = e.response!.statusCode;
        final responseData = e.response!.data;
        
        switch (statusCode) {
          case 400:
            return Failure.server(message: 'Bad Request: ${responseData ?? e.message}');
          case 401:
            return Failure.server(message: 'Unauthorized: Please check your credentials');
          case 403:
            return Failure.server(message: 'Forbidden: Access denied');
          case 404:
            return Failure.server(message: 'Not Found: ${responseData ?? e.message}');
          case 500:
            return Failure.server(message: 'Server Error: ${responseData ?? e.message}');
          default:
            return Failure.server(message: 'HTTP $statusCode: ${responseData ?? e.message}');
        }
      }
      
      return Failure.server(message: e.message ?? 'Network Error');
    }
    
    if (e is Failure) return e;
    
    return Failure.unknown(message: e.toString());
  }

  @override
  Future<VisitorPermitModel> createVisitorPermit({required VisitorPermitModel permit}) async {
    try {
      if (kDebugMode) {
        print('🚀 Creating visitor permit: ${permit.toJson()}');
      }
      
      // Make actual API call to create permit
      final response = await _dio.post('/visitors', data: permit.toJson());
      
      if (kDebugMode) {
        print('✅ CREATE PERMIT - Server response status: ${response.statusCode}');
        print('✅ CREATE PERMIT - Server response: ${response.data}');
      }
      
      var responseData = response.data;
      
      // If response is a String, try to decode it
      if (responseData is String) {
        try {
          responseData = jsonDecode(responseData);
        } catch (_) {
          // If not valid JSON string, keep it as is
        }
      }
      
      // Ensure we have a Map
      if (responseData is! Map<String, dynamic>) {
        throw Failure.server(message: 'Expected JSON object, got ${responseData.runtimeType}');
      }
      
      // Check if the response contains an error
      if (responseData.containsKey('error')) {
        throw Failure.server(message: responseData['error'].toString());
      }
      
      // Server returns: {message: "Visitor created", visitorId: 48}
      // We need to combine this with the original permit data
      String serverId = '';
      if (responseData.containsKey('visitorId')) {
        serverId = responseData['visitorId'].toString();
      } else if (responseData.containsKey('id')) {
        serverId = responseData['id'].toString();
      }
      
      if (serverId.isEmpty) {
        throw Failure.server(message: 'Server did not return visitor ID');
      }
      
      // Create the complete permit object with server ID and original data
      final createdPermit = VisitorPermitModel(
        id: serverId,
        name: permit.name,
        phone: permit.phone,
        date: permit.date,
        time: permit.time,
        gate: permit.gate,
        multipleEntry: permit.multipleEntry,
        allowVehicle: permit.allowVehicle,
        notes: permit.notes,
      );
      
      if (kDebugMode) {
        print('🎯 ===== VISITOR PERMIT CREATED SUCCESSFULLY =====');
        print('🆔 Server-generated ID: ${createdPermit.id}');
        print('👤 Visitor Name: ${createdPermit.name}');
        print('📱 Phone: ${createdPermit.phone}');
        print('📅 Date: ${createdPermit.date}');
        print('⏰ Time: ${createdPermit.time}');
        print('🚪 Gate: ${createdPermit.gate}');
        print('===============================================');
      }
      
      return createdPermit;
    } catch (e) {
      if (kDebugMode) {
        print('❌ Error creating permit: $e');
      }
      throw _handleError(e);
    }
  }

  @override
  Future<List<VisitorPermitModel>> getActivePermits() async {
    try {
      if (kDebugMode) {
        print('🔍 Fetching active permits from server...');
      }
      
      final response = await _dio.get('/visitors');
      
      if (kDebugMode) {
        print('✅ Server response status: ${response.statusCode}');
        print('✅ Server response data type: ${response.data.runtimeType}');
        print('✅ Server response: ${response.data}');
      }
      
      // The interceptor now preserves the original response for /visitors endpoints
      final responseData = response.data;
      if (kDebugMode) {
        print('🔍 getActivePermits full response: $responseData');
      }

      List _findList(dynamic json) {
        if (json is List) return json;
        if (json is Map<String, dynamic>) {
          // Check common list keys
          for (var k in ['data', 'visitors', 'permits', 'items', 'results', 'message']) {
            if (json.containsKey(k)) {
              var val = json[k];
              if (val is List) return val;
              if (val is Map<String, dynamic>) {
                var found = _findList(val);
                if (found.isNotEmpty) return found;
              }
            }
          }
          // Fallback: search all values for a list
          for (var v in json.values) {
            if (v is List) return v;
            if (v is Map<String, dynamic>) {
              var found = _findList(v);
              if (found.isNotEmpty) return found;
            }
          }
        }
        return [];
      }

      final List data = _findList(responseData);
      
      if (kDebugMode) {
        print('🎯 getActivePermits: FULL SERVER RESPONSE: $responseData');
        if (responseData is Map) {
          print('🎯 getActivePermits: Server response keys: ${responseData.keys.toList()}');
        }
        print('🎯 getActivePermits: Found list with ${data.length} elements');
        if (data.isNotEmpty) {
          print('🎯 getActivePermits: First element type: ${data.first.runtimeType}');
          print('🎯 getActivePermits: First element content: ${data.first}');
        }
      }

      final permits = data.map((e) {
        if (e is! Map<String, dynamic>) {
          throw Failure.server(message: 'Expected JSON object in array, got ${e.runtimeType}');
        }
        return VisitorPermitModel.fromJson(e);
      }).toList();
      
      if (kDebugMode) {
        print('✅ Parsed ${permits.length} permits from server');
      }
      
      return permits;
    } catch (e) {
      if (kDebugMode) {
        print('❌ Error fetching permits: $e');
      }
      throw _handleError(e);
    }
  }

  @override
  Future<void> deleteVisitorPermit({required String id}) async {
    try {
      await _dio.delete('/visitors/$id');
    } catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<DeliveryPermitModel> createDeliveryPermit({required DeliveryPermitModel permit}) async {
    try {
      if (kDebugMode) {
        print('🚀 Creating delivery permit: ${permit.toJson()}');
      }
      
      final response = await _dio.post('/deliveries', data: permit.toJson());
      
      if (kDebugMode) {
        print('✅ CREATE DELIVERY - Server response: ${response.data}');
      }
      
      var responseData = response.data;
      
      // If response is a String, try to decode it
      if (responseData is String) {
        try {
          responseData = jsonDecode(responseData);
        } catch (_) {
          // If not valid JSON string, keep it as is
        }
      }
      
      if (responseData is! Map<String, dynamic>) {
        throw Failure.server(message: 'Expected JSON object, got ${responseData.runtimeType}');
      }
      
      if (responseData.containsKey('error')) {
        throw Failure.server(message: responseData['error'].toString());
      }
      
      // Server returns: {message: "Delivery created", deliveryId: 48}
      // We need to combine this with the original permit data
      String serverId = '';
      if (responseData.containsKey('deliveryId')) {
        serverId = responseData['deliveryId'].toString();
      } else if (responseData.containsKey('id')) {
        serverId = responseData['id'].toString();
      }
      
      if (serverId.isEmpty) {
        throw Failure.server(message: 'Server did not return delivery ID');
      }
      
      // Create the complete permit object with server ID and original data
      final createdPermit = DeliveryPermitModel(
        id: serverId,
        name: permit.name,
        phone: permit.phone,
        date: permit.date,
        expectedArrival: permit.expectedArrival,
        gate: permit.gate,
        notes: permit.notes,
      );
      
      if (kDebugMode) {
        print('🎯 ===== DELIVERY PERMIT CREATED SUCCESSFULLY =====');
        print('🆔 Server-generated ID: ${createdPermit.id}');
        print('👤 Delivery Name: ${createdPermit.name}');
        print('📱 Phone: ${createdPermit.phone}');
        print('📅 Date: ${createdPermit.date}');
        print('⏰ Expected Arrival: ${createdPermit.expectedArrival}');
        print('🚪 Gate: ${createdPermit.gate}');
        print('===============================================');
      }
      
      return createdPermit;
    } catch (e) {
      if (kDebugMode) {
        print('❌ Error creating delivery permit: $e');
      }
      throw _handleError(e);
    }
  }

  @override
  Future<List<DeliveryPermitModel>> getActiveDeliveries() async {
    try {
      if (kDebugMode) {
        print('🔍 Fetching active deliveries from server...');
      }
      
      final response = await _dio.get('/deliveries');
      
      if (kDebugMode) {
        print('✅ Server response status: ${response.statusCode}');
        print('✅ Server response: ${response.data}');
      }
      
      final responseData = response.data;
      
      List _findList(dynamic json) {
        if (json is List) return json;
        if (json is Map<String, dynamic>) {
          for (var k in ['data', 'deliveries', 'permits', 'items', 'results', 'message']) {
            if (json.containsKey(k)) {
              var val = json[k];
              if (val is List) return val;
              if (val is Map<String, dynamic>) {
                var found = _findList(val);
                if (found.isNotEmpty) return found;
              }
            }
          }
        }
        return [];
      }

      final List data = _findList(responseData);
      
      return data.map((e) {
        if (e is! Map<String, dynamic>) {
          throw Failure.server(message: 'Expected JSON object in array, got ${e.runtimeType}');
        }
        return DeliveryPermitModel.fromJson(e);
      }).toList();
    } catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<void> deleteDeliveryPermit({required String id}) async {
    try {
      await _dio.delete('/deliveries/$id');
    } catch (e) {
      throw _handleError(e);
    }
  }
}
