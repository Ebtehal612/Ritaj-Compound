// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileModelImpl _$$ProfileModelImplFromJson(Map<String, dynamic> json) =>
    _$ProfileModelImpl(
      id: json['id'] as String,
      name: json['username'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      nationalId: json['gov_id'] as String,
      birthDate: json['birthdate'] == null
          ? null
          : DateTime.parse(json['birthdate'] as String),
      unitNumber: json['unit_number'] as String? ?? 'A-402',
      ownedApartments: (json['owned_apartments_count'] as num?)?.toInt() ?? 0,
      issues: (json['issues_count'] as num?)?.toInt() ?? 0,
      serviceRequests: (json['service_requests_count'] as num?)?.toInt() ?? 0,
      imageUrl: json['image_url'] as String?,
      floorDate: json['floor_data'] as String? ?? '',
      area: json['area'] as String? ?? '',
      location: json['location'] as String? ?? '',
    );

Map<String, dynamic> _$$ProfileModelImplToJson(_$ProfileModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.name,
      'phone': instance.phone,
      'email': instance.email,
      'gov_id': instance.nationalId,
      'birthdate': instance.birthDate?.toIso8601String(),
      'unit_number': instance.unitNumber,
      'owned_apartments_count': instance.ownedApartments,
      'issues_count': instance.issues,
      'service_requests_count': instance.serviceRequests,
      'image_url': instance.imageUrl,
      'floor_data': instance.floorDate,
      'area': instance.area,
      'location': instance.location,
    };
