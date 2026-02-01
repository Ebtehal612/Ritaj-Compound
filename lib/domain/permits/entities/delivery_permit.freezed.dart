// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delivery_permit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DeliveryPermit {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String get expectedArrival => throw _privateConstructorUsedError;
  String get gate => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  /// Create a copy of DeliveryPermit
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeliveryPermitCopyWith<DeliveryPermit> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryPermitCopyWith<$Res> {
  factory $DeliveryPermitCopyWith(
          DeliveryPermit value, $Res Function(DeliveryPermit) then) =
      _$DeliveryPermitCopyWithImpl<$Res, DeliveryPermit>;
  @useResult
  $Res call(
      {String id,
      String name,
      String phone,
      DateTime date,
      String expectedArrival,
      String gate,
      String? notes});
}

/// @nodoc
class _$DeliveryPermitCopyWithImpl<$Res, $Val extends DeliveryPermit>
    implements $DeliveryPermitCopyWith<$Res> {
  _$DeliveryPermitCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeliveryPermit
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? phone = null,
    Object? date = null,
    Object? expectedArrival = null,
    Object? gate = null,
    Object? notes = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expectedArrival: null == expectedArrival
          ? _value.expectedArrival
          : expectedArrival // ignore: cast_nullable_to_non_nullable
              as String,
      gate: null == gate
          ? _value.gate
          : gate // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeliveryPermitImplCopyWith<$Res>
    implements $DeliveryPermitCopyWith<$Res> {
  factory _$$DeliveryPermitImplCopyWith(_$DeliveryPermitImpl value,
          $Res Function(_$DeliveryPermitImpl) then) =
      __$$DeliveryPermitImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String phone,
      DateTime date,
      String expectedArrival,
      String gate,
      String? notes});
}

/// @nodoc
class __$$DeliveryPermitImplCopyWithImpl<$Res>
    extends _$DeliveryPermitCopyWithImpl<$Res, _$DeliveryPermitImpl>
    implements _$$DeliveryPermitImplCopyWith<$Res> {
  __$$DeliveryPermitImplCopyWithImpl(
      _$DeliveryPermitImpl _value, $Res Function(_$DeliveryPermitImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeliveryPermit
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? phone = null,
    Object? date = null,
    Object? expectedArrival = null,
    Object? gate = null,
    Object? notes = freezed,
  }) {
    return _then(_$DeliveryPermitImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expectedArrival: null == expectedArrival
          ? _value.expectedArrival
          : expectedArrival // ignore: cast_nullable_to_non_nullable
              as String,
      gate: null == gate
          ? _value.gate
          : gate // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$DeliveryPermitImpl implements _DeliveryPermit {
  const _$DeliveryPermitImpl(
      {required this.id,
      required this.name,
      required this.phone,
      required this.date,
      required this.expectedArrival,
      required this.gate,
      this.notes});

  @override
  final String id;
  @override
  final String name;
  @override
  final String phone;
  @override
  final DateTime date;
  @override
  final String expectedArrival;
  @override
  final String gate;
  @override
  final String? notes;

  @override
  String toString() {
    return 'DeliveryPermit(id: $id, name: $name, phone: $phone, date: $date, expectedArrival: $expectedArrival, gate: $gate, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeliveryPermitImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.expectedArrival, expectedArrival) ||
                other.expectedArrival == expectedArrival) &&
            (identical(other.gate, gate) || other.gate == gate) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, phone, date, expectedArrival, gate, notes);

  /// Create a copy of DeliveryPermit
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeliveryPermitImplCopyWith<_$DeliveryPermitImpl> get copyWith =>
      __$$DeliveryPermitImplCopyWithImpl<_$DeliveryPermitImpl>(
          this, _$identity);
}

abstract class _DeliveryPermit implements DeliveryPermit {
  const factory _DeliveryPermit(
      {required final String id,
      required final String name,
      required final String phone,
      required final DateTime date,
      required final String expectedArrival,
      required final String gate,
      final String? notes}) = _$DeliveryPermitImpl;

  @override
  String get id;
  @override
  String get name;
  @override
  String get phone;
  @override
  DateTime get date;
  @override
  String get expectedArrival;
  @override
  String get gate;
  @override
  String? get notes;

  /// Create a copy of DeliveryPermit
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeliveryPermitImplCopyWith<_$DeliveryPermitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
