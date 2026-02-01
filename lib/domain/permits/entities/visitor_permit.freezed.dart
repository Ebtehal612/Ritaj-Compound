// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'visitor_permit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$VisitorPermit {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String get time => throw _privateConstructorUsedError;
  String get gate => throw _privateConstructorUsedError;
  bool get multipleEntry => throw _privateConstructorUsedError;
  bool get allowVehicle => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  /// Create a copy of VisitorPermit
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VisitorPermitCopyWith<VisitorPermit> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VisitorPermitCopyWith<$Res> {
  factory $VisitorPermitCopyWith(
          VisitorPermit value, $Res Function(VisitorPermit) then) =
      _$VisitorPermitCopyWithImpl<$Res, VisitorPermit>;
  @useResult
  $Res call(
      {String id,
      String name,
      String phone,
      DateTime date,
      String time,
      String gate,
      bool multipleEntry,
      bool allowVehicle,
      String? notes});
}

/// @nodoc
class _$VisitorPermitCopyWithImpl<$Res, $Val extends VisitorPermit>
    implements $VisitorPermitCopyWith<$Res> {
  _$VisitorPermitCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VisitorPermit
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? phone = null,
    Object? date = null,
    Object? time = null,
    Object? gate = null,
    Object? multipleEntry = null,
    Object? allowVehicle = null,
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
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      gate: null == gate
          ? _value.gate
          : gate // ignore: cast_nullable_to_non_nullable
              as String,
      multipleEntry: null == multipleEntry
          ? _value.multipleEntry
          : multipleEntry // ignore: cast_nullable_to_non_nullable
              as bool,
      allowVehicle: null == allowVehicle
          ? _value.allowVehicle
          : allowVehicle // ignore: cast_nullable_to_non_nullable
              as bool,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VisitorPermitImplCopyWith<$Res>
    implements $VisitorPermitCopyWith<$Res> {
  factory _$$VisitorPermitImplCopyWith(
          _$VisitorPermitImpl value, $Res Function(_$VisitorPermitImpl) then) =
      __$$VisitorPermitImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String phone,
      DateTime date,
      String time,
      String gate,
      bool multipleEntry,
      bool allowVehicle,
      String? notes});
}

/// @nodoc
class __$$VisitorPermitImplCopyWithImpl<$Res>
    extends _$VisitorPermitCopyWithImpl<$Res, _$VisitorPermitImpl>
    implements _$$VisitorPermitImplCopyWith<$Res> {
  __$$VisitorPermitImplCopyWithImpl(
      _$VisitorPermitImpl _value, $Res Function(_$VisitorPermitImpl) _then)
      : super(_value, _then);

  /// Create a copy of VisitorPermit
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? phone = null,
    Object? date = null,
    Object? time = null,
    Object? gate = null,
    Object? multipleEntry = null,
    Object? allowVehicle = null,
    Object? notes = freezed,
  }) {
    return _then(_$VisitorPermitImpl(
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
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      gate: null == gate
          ? _value.gate
          : gate // ignore: cast_nullable_to_non_nullable
              as String,
      multipleEntry: null == multipleEntry
          ? _value.multipleEntry
          : multipleEntry // ignore: cast_nullable_to_non_nullable
              as bool,
      allowVehicle: null == allowVehicle
          ? _value.allowVehicle
          : allowVehicle // ignore: cast_nullable_to_non_nullable
              as bool,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$VisitorPermitImpl implements _VisitorPermit {
  const _$VisitorPermitImpl(
      {required this.id,
      required this.name,
      required this.phone,
      required this.date,
      required this.time,
      required this.gate,
      required this.multipleEntry,
      required this.allowVehicle,
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
  final String time;
  @override
  final String gate;
  @override
  final bool multipleEntry;
  @override
  final bool allowVehicle;
  @override
  final String? notes;

  @override
  String toString() {
    return 'VisitorPermit(id: $id, name: $name, phone: $phone, date: $date, time: $time, gate: $gate, multipleEntry: $multipleEntry, allowVehicle: $allowVehicle, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VisitorPermitImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.gate, gate) || other.gate == gate) &&
            (identical(other.multipleEntry, multipleEntry) ||
                other.multipleEntry == multipleEntry) &&
            (identical(other.allowVehicle, allowVehicle) ||
                other.allowVehicle == allowVehicle) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, phone, date, time,
      gate, multipleEntry, allowVehicle, notes);

  /// Create a copy of VisitorPermit
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VisitorPermitImplCopyWith<_$VisitorPermitImpl> get copyWith =>
      __$$VisitorPermitImplCopyWithImpl<_$VisitorPermitImpl>(this, _$identity);
}

abstract class _VisitorPermit implements VisitorPermit {
  const factory _VisitorPermit(
      {required final String id,
      required final String name,
      required final String phone,
      required final DateTime date,
      required final String time,
      required final String gate,
      required final bool multipleEntry,
      required final bool allowVehicle,
      final String? notes}) = _$VisitorPermitImpl;

  @override
  String get id;
  @override
  String get name;
  @override
  String get phone;
  @override
  DateTime get date;
  @override
  String get time;
  @override
  String get gate;
  @override
  bool get multipleEntry;
  @override
  bool get allowVehicle;
  @override
  String? get notes;

  /// Create a copy of VisitorPermit
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VisitorPermitImplCopyWith<_$VisitorPermitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
