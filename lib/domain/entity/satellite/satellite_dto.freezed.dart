// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'satellite_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SatelliteDto _$SatelliteDtoFromJson(Map<String, dynamic> json) {
  return _Satellite.fromJson(json);
}

/// @nodoc
mixin _$SatelliteDto {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get picture => throw _privateConstructorUsedError;
  double get resolution => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SatelliteDtoCopyWith<SatelliteDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SatelliteDtoCopyWith<$Res> {
  factory $SatelliteDtoCopyWith(
          SatelliteDto value, $Res Function(SatelliteDto) then) =
      _$SatelliteDtoCopyWithImpl<$Res, SatelliteDto>;
  @useResult
  $Res call({int id, String name, String picture, double resolution});
}

/// @nodoc
class _$SatelliteDtoCopyWithImpl<$Res, $Val extends SatelliteDto>
    implements $SatelliteDtoCopyWith<$Res> {
  _$SatelliteDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? picture = null,
    Object? resolution = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      picture: null == picture
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String,
      resolution: null == resolution
          ? _value.resolution
          : resolution // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SatelliteImplCopyWith<$Res>
    implements $SatelliteDtoCopyWith<$Res> {
  factory _$$SatelliteImplCopyWith(
          _$SatelliteImpl value, $Res Function(_$SatelliteImpl) then) =
      __$$SatelliteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String picture, double resolution});
}

/// @nodoc
class __$$SatelliteImplCopyWithImpl<$Res>
    extends _$SatelliteDtoCopyWithImpl<$Res, _$SatelliteImpl>
    implements _$$SatelliteImplCopyWith<$Res> {
  __$$SatelliteImplCopyWithImpl(
      _$SatelliteImpl _value, $Res Function(_$SatelliteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? picture = null,
    Object? resolution = null,
  }) {
    return _then(_$SatelliteImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      picture: null == picture
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String,
      resolution: null == resolution
          ? _value.resolution
          : resolution // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SatelliteImpl implements _Satellite {
  _$SatelliteImpl(
      {required this.id,
      required this.name,
      required this.picture,
      required this.resolution});

  factory _$SatelliteImpl.fromJson(Map<String, dynamic> json) =>
      _$$SatelliteImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String picture;
  @override
  final double resolution;

  @override
  String toString() {
    return 'SatelliteDto(id: $id, name: $name, picture: $picture, resolution: $resolution)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SatelliteImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.picture, picture) || other.picture == picture) &&
            (identical(other.resolution, resolution) ||
                other.resolution == resolution));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, picture, resolution);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SatelliteImplCopyWith<_$SatelliteImpl> get copyWith =>
      __$$SatelliteImplCopyWithImpl<_$SatelliteImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SatelliteImplToJson(
      this,
    );
  }
}

abstract class _Satellite implements SatelliteDto {
  factory _Satellite(
      {required final int id,
      required final String name,
      required final String picture,
      required final double resolution}) = _$SatelliteImpl;

  factory _Satellite.fromJson(Map<String, dynamic> json) =
      _$SatelliteImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get picture;
  @override
  double get resolution;
  @override
  @JsonKey(ignore: true)
  _$$SatelliteImplCopyWith<_$SatelliteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
