// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delivery_permit_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DeliveryPermitModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String get expectedArrival => throw _privateConstructorUsedError;
  String get gate => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  /// Create a copy of DeliveryPermitModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeliveryPermitModelCopyWith<DeliveryPermitModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryPermitModelCopyWith<$Res> {
  factory $DeliveryPermitModelCopyWith(
          DeliveryPermitModel value, $Res Function(DeliveryPermitModel) then) =
      _$DeliveryPermitModelCopyWithImpl<$Res, DeliveryPermitModel>;
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
class _$DeliveryPermitModelCopyWithImpl<$Res, $Val extends DeliveryPermitModel>
    implements $DeliveryPermitModelCopyWith<$Res> {
  _$DeliveryPermitModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeliveryPermitModel
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
abstract class _$$DeliveryPermitModelImplCopyWith<$Res>
    implements $DeliveryPermitModelCopyWith<$Res> {
  factory _$$DeliveryPermitModelImplCopyWith(_$DeliveryPermitModelImpl value,
          $Res Function(_$DeliveryPermitModelImpl) then) =
      __$$DeliveryPermitModelImplCopyWithImpl<$Res>;
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
class __$$DeliveryPermitModelImplCopyWithImpl<$Res>
    extends _$DeliveryPermitModelCopyWithImpl<$Res, _$DeliveryPermitModelImpl>
    implements _$$DeliveryPermitModelImplCopyWith<$Res> {
  __$$DeliveryPermitModelImplCopyWithImpl(_$DeliveryPermitModelImpl _value,
      $Res Function(_$DeliveryPermitModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeliveryPermitModel
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
    return _then(_$DeliveryPermitModelImpl(
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

class _$DeliveryPermitModelImpl extends _DeliveryPermitModel
    with DiagnosticableTreeMixin {
  const _$DeliveryPermitModelImpl(
      {required this.id,
      required this.name,
      required this.phone,
      required this.date,
      required this.expectedArrival,
      required this.gate,
      this.notes})
      : super._();

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
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DeliveryPermitModel(id: $id, name: $name, phone: $phone, date: $date, expectedArrival: $expectedArrival, gate: $gate, notes: $notes)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DeliveryPermitModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('phone', phone))
      ..add(DiagnosticsProperty('date', date))
      ..add(DiagnosticsProperty('expectedArrival', expectedArrival))
      ..add(DiagnosticsProperty('gate', gate))
      ..add(DiagnosticsProperty('notes', notes));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeliveryPermitModelImpl &&
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

  /// Create a copy of DeliveryPermitModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeliveryPermitModelImplCopyWith<_$DeliveryPermitModelImpl> get copyWith =>
      __$$DeliveryPermitModelImplCopyWithImpl<_$DeliveryPermitModelImpl>(
          this, _$identity);
}

abstract class _DeliveryPermitModel extends DeliveryPermitModel {
  const factory _DeliveryPermitModel(
      {required final String id,
      required final String name,
      required final String phone,
      required final DateTime date,
      required final String expectedArrival,
      required final String gate,
      final String? notes}) = _$DeliveryPermitModelImpl;
  const _DeliveryPermitModel._() : super._();

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

  /// Create a copy of DeliveryPermitModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeliveryPermitModelImplCopyWith<_$DeliveryPermitModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
