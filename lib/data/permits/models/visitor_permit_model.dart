import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import '../../../domain/permits/entities/visitor_permit.dart';

part 'visitor_permit_model.freezed.dart';

@freezed
class VisitorPermitModel with _$VisitorPermitModel {
  const VisitorPermitModel._();

  const factory VisitorPermitModel({
    required String id,
    required String name,
    required String phone,
    required DateTime date,
    required String time,
    required String gate,
    @Default(false) bool multipleEntry,
    @Default(false) bool allowVehicle,
    String? notes,
  }) = _VisitorPermitModel;

  factory VisitorPermitModel.fromJson(Map<String, dynamic> json) {
    if (kDebugMode) {
      print('🔍 VisitorPermitModel.fromJson: Raw server response');
      print('🔍 JSON: $json');
      json.forEach((key, value) {
        print('  📋 "$key": ${value.runtimeType} = "$value"');
      });
    }
    
    // Handle server response format: {message: "Visitor created", visitorId: 48}
    // The server doesn't return the full visitor data, only the ID
    String id = '';
    if (json['visitorId'] != null) {
      id = json['visitorId'].toString();
    } else if (json['id'] != null) {
      id = json['id'].toString();
    } else if (json['visitor_id'] != null) {
      id = json['visitor_id'].toString();
    }
    
    final name = json['name']?.toString() ?? json['visitor_name']?.toString() ?? '';
    final phone = json['phone']?.toString() ?? json['visitor_phone']?.toString() ?? json['phone_number']?.toString() ?? '';
    final gate = json['gate']?.toString() ?? json['gate_name']?.toString() ?? json['entrance_gate']?.toString() ?? '';
    final time = json['time']?.toString() ?? json['visit_time']?.toString() ?? '';
    
    final result = VisitorPermitModel(
      id: id,
      name: name,
      phone: phone,
      date: json['date'] != null 
          ? DateTime.tryParse(json['date'].toString()) ?? DateTime.now()
          : DateTime.now(),
      time: time,
      gate: gate,
      multipleEntry: json['multipleEntry'] == true || json['multiple_entry'] == true,
      allowVehicle: json['allowVehicle'] == true || json['allow_vehicle'] == true,
      notes: json['notes']?.toString(),
    );
    
    if (kDebugMode) {
      print('🔍 VisitorPermitModel.fromJson: Parsed values');
      print('  📋 ID: "${result.id}" (empty: ${result.id.isEmpty})');
      print('  📋 Name: "${result.name}" (empty: ${result.name.isEmpty})');
      print('  📋 Phone: "${result.phone}" (empty: ${result.phone.isEmpty})');
      print('  📋 Time: "${result.time}" (empty: ${result.time.isEmpty})');
      print('  📋 Gate: "${result.gate}" (empty: ${result.gate.isEmpty})');
    }
    
    return result;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'visitor_name': name,
      'phone': phone,
      'visitor_phone': phone,
      'phone_number': phone,
      'date': date.toIso8601String(),
      'time': time,
      'visit_time': time,
      'gate': gate,
      'gate_name': gate,
      'entrance_gate': gate,
      'multiple_entry': multipleEntry,
      'allow_vehicle': allowVehicle,
      'notes': notes,
    };
  }

  VisitorPermit toEntity() => VisitorPermit(
        id: id,
        name: name,
        phone: phone,
        date: date,
        time: time,
        gate: gate,
        multipleEntry: multipleEntry,
        allowVehicle: allowVehicle,
        notes: notes,
      );

  factory VisitorPermitModel.fromEntity(VisitorPermit entity) =>
      VisitorPermitModel(
        id: entity.id,
        name: entity.name,
        phone: entity.phone,
        date: entity.date,
        time: entity.time,
        gate: entity.gate,
        multipleEntry: entity.multipleEntry,
        allowVehicle: entity.allowVehicle,
        notes: entity.notes,
      );
}
