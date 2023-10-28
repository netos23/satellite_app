// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'satellite_point_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SatellitePointDto _$SatellitePointDtoFromJson(Map<String, dynamic> json) {
  return _SatellitePointDto.fromJson(json);
}

/// @nodoc
mixin _$SatellitePointDto {
  int? get id => throw _privateConstructorUsedError;
  double get lat => throw _privateConstructorUsedError;
  double get lon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SatellitePointDtoCopyWith<SatellitePointDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SatellitePointDtoCopyWith<$Res> {
  factory $SatellitePointDtoCopyWith(
          SatellitePointDto value, $Res Function(SatellitePointDto) then) =
      _$SatellitePointDtoCopyWithImpl<$Res, SatellitePointDto>;
  @useResult
  $Res call({int? id, double lat, double lon});
}

/// @nodoc
class _$SatellitePointDtoCopyWithImpl<$Res, $Val extends SatellitePointDto>
    implements $SatellitePointDtoCopyWith<$Res> {
  _$SatellitePointDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? lat = null,
    Object? lon = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lon: null == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SatellitePointDtoImplCopyWith<$Res>
    implements $SatellitePointDtoCopyWith<$Res> {
  factory _$$SatellitePointDtoImplCopyWith(_$SatellitePointDtoImpl value,
          $Res Function(_$SatellitePointDtoImpl) then) =
      __$$SatellitePointDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, double lat, double lon});
}

/// @nodoc
class __$$SatellitePointDtoImplCopyWithImpl<$Res>
    extends _$SatellitePointDtoCopyWithImpl<$Res, _$SatellitePointDtoImpl>
    implements _$$SatellitePointDtoImplCopyWith<$Res> {
  __$$SatellitePointDtoImplCopyWithImpl(_$SatellitePointDtoImpl _value,
      $Res Function(_$SatellitePointDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? lat = null,
    Object? lon = null,
  }) {
    return _then(_$SatellitePointDtoImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lon: null == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SatellitePointDtoImpl implements _SatellitePointDto {
  _$SatellitePointDtoImpl({this.id, required this.lat, required this.lon});

  factory _$SatellitePointDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SatellitePointDtoImplFromJson(json);

  @override
  final int? id;
  @override
  final double lat;
  @override
  final double lon;

  @override
  String toString() {
    return 'SatellitePointDto(id: $id, lat: $lat, lon: $lon)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SatellitePointDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lon, lon) || other.lon == lon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, lat, lon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SatellitePointDtoImplCopyWith<_$SatellitePointDtoImpl> get copyWith =>
      __$$SatellitePointDtoImplCopyWithImpl<_$SatellitePointDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SatellitePointDtoImplToJson(
      this,
    );
  }
}

abstract class _SatellitePointDto implements SatellitePointDto {
  factory _SatellitePointDto(
      {final int? id,
      required final double lat,
      required final double lon}) = _$SatellitePointDtoImpl;

  factory _SatellitePointDto.fromJson(Map<String, dynamic> json) =
      _$SatellitePointDtoImpl.fromJson;

  @override
  int? get id;
  @override
  double get lat;
  @override
  double get lon;
  @override
  @JsonKey(ignore: true)
  _$$SatellitePointDtoImplCopyWith<_$SatellitePointDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
