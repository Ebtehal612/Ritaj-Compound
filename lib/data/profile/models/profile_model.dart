import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:ritaj_compound/domain/profile/entities/profile.dart';

part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

@freezed
class ProfileModel with _$ProfileModel {
  const ProfileModel._();

  const factory ProfileModel({
    required String id,
    @JsonKey(name: 'username') required String name,
    required String phone,
    required String email,
    @JsonKey(name: 'gov_id') required String nationalId,
    @JsonKey(name: 'birthdate') DateTime? birthDate,
    @JsonKey(name: 'unit_number', defaultValue: 'A-402') required String unitNumber,
    @JsonKey(name: 'owned_apartments_count', defaultValue: 0) required int ownedApartments,
    @JsonKey(name: 'issues_count', defaultValue: 0) required int issues,
    @JsonKey(name: 'service_requests_count', defaultValue: 0) required int serviceRequests,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'floor_data', defaultValue: '') String? floorDate,
    @JsonKey(name: 'area', defaultValue: '') String? area,
    @JsonKey(name: 'location', defaultValue: '') String? location,
  }) = _ProfileModel;

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    if (kDebugMode) {
      print('🔍 ProfileModel.fromJson: Raw server response');
      print('🔍 JSON: $json');
    }
    
    // Preprocess JSON to handle type mismatches
    final processedJson = <String, dynamic>{};
    
    // Handle string fields - ensure they are strings
    processedJson['id'] = json['id']?.toString() ?? '';
    processedJson['username'] = json['username']?.toString() ?? '';
    processedJson['phone'] = json['phone']?.toString() ?? '';
    processedJson['email'] = json['email']?.toString() ?? '';
    processedJson['gov_id'] = json['gov_id']?.toString() ?? '';
    processedJson['unit_number'] = json['unit_number']?.toString() ?? 'A-402';
    processedJson['floor_data'] = json['floor_data']?.toString() ?? '';
    processedJson['area'] = json['area']?.toString() ?? '';
    processedJson['location'] = json['location']?.toString() ?? '';
    
    // Handle optional string fields
    if (json['image_url'] != null) {
      processedJson['image_url'] = json['image_url'].toString();
    }
    
    // Handle integer fields - ensure they are integers
    processedJson['owned_apartments_count'] = _parseIntSafely(json['owned_apartments_count'], 0);
    processedJson['issues_count'] = _parseIntSafely(json['issues_count'], 0);
    processedJson['service_requests_count'] = _parseIntSafely(json['service_requests_count'], 0);
    
    // Handle birthdate
    if (json['birthdate'] != null && json['birthdate'].toString().isNotEmpty) {
      try {
        processedJson['birthdate'] = DateTime.parse(json['birthdate'].toString()).toIso8601String();
      } catch (e) {
        if (kDebugMode) {
          print('⚠️ ProfileModel: Invalid birthdate format: ${json['birthdate']}');
        }
        // Don't include birthdate if it's invalid
      }
    }
    
    if (kDebugMode) {
      print('🔍 ProfileModel.fromJson: Processed JSON');
      processedJson.forEach((key, value) {
        print('  📋 "$key": ${value.runtimeType} = "$value"');
      });
    }
    
    try {
      return _$ProfileModelFromJson(processedJson);
    } catch (e) {
      if (kDebugMode) {
        print('❌ ProfileModel.fromJson: Error parsing JSON: $e');
      }
      rethrow;
    }
  }

  static int _parseIntSafely(dynamic value, int defaultValue) {
    if (value == null) return defaultValue;
    if (value is int) return value;
    if (value is String) {
      return int.tryParse(value) ?? defaultValue;
    }
    if (value is double) return value.toInt();
    return defaultValue;
  }

  Profile toEntity() => Profile(
        id: id,
        name: name,
        phone: phone,
        email: email,
        nationalId: nationalId,
        birthDate: birthDate,
        unitNumber: unitNumber,
        ownedApartments: ownedApartments,
        issues: issues,
        serviceRequests: serviceRequests,
        imageUrl: imageUrl,
        floorDate: floorDate ?? '',
        area: area ?? '',
        location: location ?? '',
      );
}
