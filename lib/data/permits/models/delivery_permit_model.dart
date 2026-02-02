import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import '../../../domain/permits/entities/delivery_permit.dart';

part 'delivery_permit_model.freezed.dart';

@freezed
class DeliveryPermitModel with _$DeliveryPermitModel {
  const DeliveryPermitModel._();

  const factory DeliveryPermitModel({
    required String id,
    required String name,
    required String phone,
    required DateTime date,
    required String expectedArrival,
    required String gate,
    String? notes,
  }) = _DeliveryPermitModel;

  factory DeliveryPermitModel.fromJson(Map<String, dynamic> json) {
    if (kDebugMode) {
      print('🔍 DeliveryPermitModel.fromJson: Raw server response');
      print('🔍 JSON: $json');
      json.forEach((key, value) {
        print('  📋 "$key": ${value.runtimeType} = "$value"');
      });
    }
    
    String id = '';
    if (json['deliveryId'] != null) {
      id = json['deliveryId'].toString();
    } else if (json['id'] != null) {
      id = json['id'].toString();
    } else if (json['delivery_id'] != null) {
      id = json['delivery_id'].toString();
    }
    
    final name = json['name']?.toString() ?? 
                 json['delivery_name']?.toString() ?? 
                 json['entity_name']?.toString() ?? 
                 json['deliverer_name']?.toString() ?? 
                 json['company_name']?.toString() ?? '';
                 
    final phone = json['phone']?.toString() ?? 
                  json['delivery_phone']?.toString() ?? 
                  json['phone_number']?.toString() ?? '';
                  
    final arrival = json['expected_arrival']?.toString() ?? 
                    json['delivery_time']?.toString() ?? 
                    json['arrival_time']?.toString() ?? 
                    json['arrival_duration']?.toString() ?? '';
                    
    final gate = json['gate']?.toString() ?? 
                 json['gate_name']?.toString() ?? 
                 json['entrance_gate']?.toString() ?? '';

    final result = DeliveryPermitModel(
      id: id,
      name: name,
      phone: phone,
      date: json['delivery_date'] != null 
          ? DateTime.tryParse(json['delivery_date'].toString()) ?? DateTime.now()
          : (json['date'] != null 
              ? DateTime.tryParse(json['date'].toString()) ?? DateTime.now()
              : DateTime.now()),
      expectedArrival: arrival.contains('min') ? arrival : (arrival.isNotEmpty ? '$arrival min' : ''),
      gate: gate,
      notes: json['notes']?.toString(),
    );
    
    if (kDebugMode) {
      print('🔍 DeliveryPermitModel.fromJson: Parsed values');
      print('  📋 ID: "${result.id}" (empty: ${result.id.isEmpty})');
      print('  📋 Name: "${result.name}" (empty: ${result.name.isEmpty})');
      print('  📋 Phone: "${result.phone}" (empty: ${result.phone.isEmpty})');
      print('  📋 Expected Arrival: "${result.expectedArrival}" (empty: ${result.expectedArrival.isEmpty})');
      print('  📋 Gate: "${result.gate}" (empty: ${result.gate.isEmpty})');
    }
    
    return result;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'deliverer_name': name,
      'delivery_name': name,
      'name': name,
      'delivery_phone': phone,
      'phone': phone,
      'delivery_date': "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
      'date': date.toIso8601String(),
      'delivery_time': expectedArrival,
      'arrival_time': expectedArrival,
      'gate': gate,
      'gate_name': gate,
      'notes': notes,
    };
  }

  DeliveryPermit toEntity() => DeliveryPermit(
        id: id,
        name: name,
        phone: phone,
        date: date,
        expectedArrival: expectedArrival,
        gate: gate,
        notes: notes,
      );

  factory DeliveryPermitModel.fromEntity(DeliveryPermit entity) =>
      DeliveryPermitModel(
        id: entity.id,
        name: entity.name,
        phone: entity.phone,
        date: entity.date,
        expectedArrival: entity.expectedArrival,
        gate: entity.gate,
        notes: entity.notes,
      );
}
