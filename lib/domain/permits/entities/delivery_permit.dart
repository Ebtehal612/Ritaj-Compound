import 'package:freezed_annotation/freezed_annotation.dart';

part 'delivery_permit.freezed.dart';

@freezed
class DeliveryPermit with _$DeliveryPermit {
  const factory DeliveryPermit({
    required String id,
    required String name,
    required String phone,
    required DateTime date,
    required String expectedArrival,
    required String gate,
    String? notes,
  }) = _DeliveryPermit;
}
