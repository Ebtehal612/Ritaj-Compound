// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) {
  return _ProfileModel.fromJson(json);
}

/// @nodoc
mixin _$ProfileModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'username')
  String get name => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'gov_id')
  String get nationalId => throw _privateConstructorUsedError;
  @JsonKey(name: 'birthdate')
  DateTime? get birthDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'unit_number', defaultValue: 'A-402')
  String get unitNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'owned_apartments_count', defaultValue: 0)
  int get ownedApartments => throw _privateConstructorUsedError;
  @JsonKey(name: 'issues_count', defaultValue: 0)
  int get issues => throw _privateConstructorUsedError;
  @JsonKey(name: 'service_requests_count', defaultValue: 0)
  int get serviceRequests => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'floor_data', defaultValue: '')
  String? get floorDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'area', defaultValue: '')
  String? get area => throw _privateConstructorUsedError;
  @JsonKey(name: 'location', defaultValue: '')
  String? get location => throw _privateConstructorUsedError;

  /// Serializes this ProfileModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfileModelCopyWith<ProfileModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileModelCopyWith<$Res> {
  factory $ProfileModelCopyWith(
          ProfileModel value, $Res Function(ProfileModel) then) =
      _$ProfileModelCopyWithImpl<$Res, ProfileModel>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'username') String name,
      String phone,
      String email,
      @JsonKey(name: 'gov_id') String nationalId,
      @JsonKey(name: 'birthdate') DateTime? birthDate,
      @JsonKey(name: 'unit_number', defaultValue: 'A-402') String unitNumber,
      @JsonKey(name: 'owned_apartments_count', defaultValue: 0)
      int ownedApartments,
      @JsonKey(name: 'issues_count', defaultValue: 0) int issues,
      @JsonKey(name: 'service_requests_count', defaultValue: 0)
      int serviceRequests,
      @JsonKey(name: 'image_url') String? imageUrl,
      @JsonKey(name: 'floor_data', defaultValue: '') String? floorDate,
      @JsonKey(name: 'area', defaultValue: '') String? area,
      @JsonKey(name: 'location', defaultValue: '') String? location});
}

/// @nodoc
class _$ProfileModelCopyWithImpl<$Res, $Val extends ProfileModel>
    implements $ProfileModelCopyWith<$Res> {
  _$ProfileModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? phone = null,
    Object? email = null,
    Object? nationalId = null,
    Object? birthDate = freezed,
    Object? unitNumber = null,
    Object? ownedApartments = null,
    Object? issues = null,
    Object? serviceRequests = null,
    Object? imageUrl = freezed,
    Object? floorDate = freezed,
    Object? area = freezed,
    Object? location = freezed,
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
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      nationalId: null == nationalId
          ? _value.nationalId
          : nationalId // ignore: cast_nullable_to_non_nullable
              as String,
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      unitNumber: null == unitNumber
          ? _value.unitNumber
          : unitNumber // ignore: cast_nullable_to_non_nullable
              as String,
      ownedApartments: null == ownedApartments
          ? _value.ownedApartments
          : ownedApartments // ignore: cast_nullable_to_non_nullable
              as int,
      issues: null == issues
          ? _value.issues
          : issues // ignore: cast_nullable_to_non_nullable
              as int,
      serviceRequests: null == serviceRequests
          ? _value.serviceRequests
          : serviceRequests // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      floorDate: freezed == floorDate
          ? _value.floorDate
          : floorDate // ignore: cast_nullable_to_non_nullable
              as String?,
      area: freezed == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfileModelImplCopyWith<$Res>
    implements $ProfileModelCopyWith<$Res> {
  factory _$$ProfileModelImplCopyWith(
          _$ProfileModelImpl value, $Res Function(_$ProfileModelImpl) then) =
      __$$ProfileModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'username') String name,
      String phone,
      String email,
      @JsonKey(name: 'gov_id') String nationalId,
      @JsonKey(name: 'birthdate') DateTime? birthDate,
      @JsonKey(name: 'unit_number', defaultValue: 'A-402') String unitNumber,
      @JsonKey(name: 'owned_apartments_count', defaultValue: 0)
      int ownedApartments,
      @JsonKey(name: 'issues_count', defaultValue: 0) int issues,
      @JsonKey(name: 'service_requests_count', defaultValue: 0)
      int serviceRequests,
      @JsonKey(name: 'image_url') String? imageUrl,
      @JsonKey(name: 'floor_data', defaultValue: '') String? floorDate,
      @JsonKey(name: 'area', defaultValue: '') String? area,
      @JsonKey(name: 'location', defaultValue: '') String? location});
}

/// @nodoc
class __$$ProfileModelImplCopyWithImpl<$Res>
    extends _$ProfileModelCopyWithImpl<$Res, _$ProfileModelImpl>
    implements _$$ProfileModelImplCopyWith<$Res> {
  __$$ProfileModelImplCopyWithImpl(
      _$ProfileModelImpl _value, $Res Function(_$ProfileModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? phone = null,
    Object? email = null,
    Object? nationalId = null,
    Object? birthDate = freezed,
    Object? unitNumber = null,
    Object? ownedApartments = null,
    Object? issues = null,
    Object? serviceRequests = null,
    Object? imageUrl = freezed,
    Object? floorDate = freezed,
    Object? area = freezed,
    Object? location = freezed,
  }) {
    return _then(_$ProfileModelImpl(
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
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      nationalId: null == nationalId
          ? _value.nationalId
          : nationalId // ignore: cast_nullable_to_non_nullable
              as String,
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      unitNumber: null == unitNumber
          ? _value.unitNumber
          : unitNumber // ignore: cast_nullable_to_non_nullable
              as String,
      ownedApartments: null == ownedApartments
          ? _value.ownedApartments
          : ownedApartments // ignore: cast_nullable_to_non_nullable
              as int,
      issues: null == issues
          ? _value.issues
          : issues // ignore: cast_nullable_to_non_nullable
              as int,
      serviceRequests: null == serviceRequests
          ? _value.serviceRequests
          : serviceRequests // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      floorDate: freezed == floorDate
          ? _value.floorDate
          : floorDate // ignore: cast_nullable_to_non_nullable
              as String?,
      area: freezed == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileModelImpl extends _ProfileModel {
  const _$ProfileModelImpl(
      {required this.id,
      @JsonKey(name: 'username') required this.name,
      required this.phone,
      required this.email,
      @JsonKey(name: 'gov_id') required this.nationalId,
      @JsonKey(name: 'birthdate') this.birthDate,
      @JsonKey(name: 'unit_number', defaultValue: 'A-402')
      required this.unitNumber,
      @JsonKey(name: 'owned_apartments_count', defaultValue: 0)
      required this.ownedApartments,
      @JsonKey(name: 'issues_count', defaultValue: 0) required this.issues,
      @JsonKey(name: 'service_requests_count', defaultValue: 0)
      required this.serviceRequests,
      @JsonKey(name: 'image_url') this.imageUrl,
      @JsonKey(name: 'floor_data', defaultValue: '') this.floorDate,
      @JsonKey(name: 'area', defaultValue: '') this.area,
      @JsonKey(name: 'location', defaultValue: '') this.location})
      : super._();

  factory _$ProfileModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'username')
  final String name;
  @override
  final String phone;
  @override
  final String email;
  @override
  @JsonKey(name: 'gov_id')
  final String nationalId;
  @override
  @JsonKey(name: 'birthdate')
  final DateTime? birthDate;
  @override
  @JsonKey(name: 'unit_number', defaultValue: 'A-402')
  final String unitNumber;
  @override
  @JsonKey(name: 'owned_apartments_count', defaultValue: 0)
  final int ownedApartments;
  @override
  @JsonKey(name: 'issues_count', defaultValue: 0)
  final int issues;
  @override
  @JsonKey(name: 'service_requests_count', defaultValue: 0)
  final int serviceRequests;
  @override
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @override
  @JsonKey(name: 'floor_data', defaultValue: '')
  final String? floorDate;
  @override
  @JsonKey(name: 'area', defaultValue: '')
  final String? area;
  @override
  @JsonKey(name: 'location', defaultValue: '')
  final String? location;

  @override
  String toString() {
    return 'ProfileModel(id: $id, name: $name, phone: $phone, email: $email, nationalId: $nationalId, birthDate: $birthDate, unitNumber: $unitNumber, ownedApartments: $ownedApartments, issues: $issues, serviceRequests: $serviceRequests, imageUrl: $imageUrl, floorDate: $floorDate, area: $area, location: $location)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.nationalId, nationalId) ||
                other.nationalId == nationalId) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.unitNumber, unitNumber) ||
                other.unitNumber == unitNumber) &&
            (identical(other.ownedApartments, ownedApartments) ||
                other.ownedApartments == ownedApartments) &&
            (identical(other.issues, issues) || other.issues == issues) &&
            (identical(other.serviceRequests, serviceRequests) ||
                other.serviceRequests == serviceRequests) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.floorDate, floorDate) ||
                other.floorDate == floorDate) &&
            (identical(other.area, area) || other.area == area) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      phone,
      email,
      nationalId,
      birthDate,
      unitNumber,
      ownedApartments,
      issues,
      serviceRequests,
      imageUrl,
      floorDate,
      area,
      location);

  /// Create a copy of ProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileModelImplCopyWith<_$ProfileModelImpl> get copyWith =>
      __$$ProfileModelImplCopyWithImpl<_$ProfileModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileModelImplToJson(
      this,
    );
  }
}

abstract class _ProfileModel extends ProfileModel {
  const factory _ProfileModel(
      {required final String id,
      @JsonKey(name: 'username') required final String name,
      required final String phone,
      required final String email,
      @JsonKey(name: 'gov_id') required final String nationalId,
      @JsonKey(name: 'birthdate') final DateTime? birthDate,
      @JsonKey(name: 'unit_number', defaultValue: 'A-402')
      required final String unitNumber,
      @JsonKey(name: 'owned_apartments_count', defaultValue: 0)
      required final int ownedApartments,
      @JsonKey(name: 'issues_count', defaultValue: 0) required final int issues,
      @JsonKey(name: 'service_requests_count', defaultValue: 0)
      required final int serviceRequests,
      @JsonKey(name: 'image_url') final String? imageUrl,
      @JsonKey(name: 'floor_data', defaultValue: '') final String? floorDate,
      @JsonKey(name: 'area', defaultValue: '') final String? area,
      @JsonKey(name: 'location', defaultValue: '')
      final String? location}) = _$ProfileModelImpl;
  const _ProfileModel._() : super._();

  factory _ProfileModel.fromJson(Map<String, dynamic> json) =
      _$ProfileModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'username')
  String get name;
  @override
  String get phone;
  @override
  String get email;
  @override
  @JsonKey(name: 'gov_id')
  String get nationalId;
  @override
  @JsonKey(name: 'birthdate')
  DateTime? get birthDate;
  @override
  @JsonKey(name: 'unit_number', defaultValue: 'A-402')
  String get unitNumber;
  @override
  @JsonKey(name: 'owned_apartments_count', defaultValue: 0)
  int get ownedApartments;
  @override
  @JsonKey(name: 'issues_count', defaultValue: 0)
  int get issues;
  @override
  @JsonKey(name: 'service_requests_count', defaultValue: 0)
  int get serviceRequests;
  @override
  @JsonKey(name: 'image_url')
  String? get imageUrl;
  @override
  @JsonKey(name: 'floor_data', defaultValue: '')
  String? get floorDate;
  @override
  @JsonKey(name: 'area', defaultValue: '')
  String? get area;
  @override
  @JsonKey(name: 'location', defaultValue: '')
  String? get location;

  /// Create a copy of ProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileModelImplCopyWith<_$ProfileModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
