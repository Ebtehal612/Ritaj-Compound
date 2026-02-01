import 'package:freezed_annotation/freezed_annotation.dart';

part 'visitor_permit.freezed.dart';

@freezed
class VisitorPermit with _$VisitorPermit {
  const factory VisitorPermit({
    required String id,
    required String name,
    required String phone,
    required DateTime date,
    required String time,
    required String gate,
    required bool multipleEntry,
    required bool allowVehicle,
    String? notes,
  }) = _VisitorPermit;
}
