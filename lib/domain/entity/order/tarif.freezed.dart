// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tarif.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Tarif _$TarifFromJson(Map<String, dynamic> json) {
  return _Tarif.fromJson(json);
}

/// @nodoc
mixin _$Tarif {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: "base_price")
  double get basePrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'per_photo')
  double get perPhoto => throw _privateConstructorUsedError;
  String? get picture => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TarifCopyWith<Tarif> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TarifCopyWith<$Res> {
  factory $TarifCopyWith(Tarif value, $Res Function(Tarif) then) =
      _$TarifCopyWithImpl<$Res, Tarif>;
  @useResult
  $Res call(
      {int id,
      String name,
      String description,
      @JsonKey(name: "base_price") double basePrice,
      @JsonKey(name: 'per_photo') double perPhoto,
      String? picture});
}

/// @nodoc
class _$TarifCopyWithImpl<$Res, $Val extends Tarif>
    implements $TarifCopyWith<$Res> {
  _$TarifCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? basePrice = null,
    Object? perPhoto = null,
    Object? picture = freezed,
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
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      basePrice: null == basePrice
          ? _value.basePrice
          : basePrice // ignore: cast_nullable_to_non_nullable
              as double,
      perPhoto: null == perPhoto
          ? _value.perPhoto
          : perPhoto // ignore: cast_nullable_to_non_nullable
              as double,
      picture: freezed == picture
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TarifImplCopyWith<$Res> implements $TarifCopyWith<$Res> {
  factory _$$TarifImplCopyWith(
          _$TarifImpl value, $Res Function(_$TarifImpl) then) =
      __$$TarifImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String description,
      @JsonKey(name: "base_price") double basePrice,
      @JsonKey(name: 'per_photo') double perPhoto,
      String? picture});
}

/// @nodoc
class __$$TarifImplCopyWithImpl<$Res>
    extends _$TarifCopyWithImpl<$Res, _$TarifImpl>
    implements _$$TarifImplCopyWith<$Res> {
  __$$TarifImplCopyWithImpl(
      _$TarifImpl _value, $Res Function(_$TarifImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? basePrice = null,
    Object? perPhoto = null,
    Object? picture = freezed,
  }) {
    return _then(_$TarifImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      basePrice: null == basePrice
          ? _value.basePrice
          : basePrice // ignore: cast_nullable_to_non_nullable
              as double,
      perPhoto: null == perPhoto
          ? _value.perPhoto
          : perPhoto // ignore: cast_nullable_to_non_nullable
              as double,
      picture: freezed == picture
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TarifImpl implements _Tarif {
  _$TarifImpl(
      {required this.id,
      required this.name,
      required this.description,
      @JsonKey(name: "base_price") required this.basePrice,
      @JsonKey(name: 'per_photo') required this.perPhoto,
      this.picture});

  factory _$TarifImpl.fromJson(Map<String, dynamic> json) =>
      _$$TarifImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String description;
  @override
  @JsonKey(name: "base_price")
  final double basePrice;
  @override
  @JsonKey(name: 'per_photo')
  final double perPhoto;
  @override
  final String? picture;

  @override
  String toString() {
    return 'Tarif(id: $id, name: $name, description: $description, basePrice: $basePrice, perPhoto: $perPhoto, picture: $picture)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TarifImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.basePrice, basePrice) ||
                other.basePrice == basePrice) &&
            (identical(other.perPhoto, perPhoto) ||
                other.perPhoto == perPhoto) &&
            (identical(other.picture, picture) || other.picture == picture));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, description, basePrice, perPhoto, picture);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TarifImplCopyWith<_$TarifImpl> get copyWith =>
      __$$TarifImplCopyWithImpl<_$TarifImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TarifImplToJson(
      this,
    );
  }
}

abstract class _Tarif implements Tarif {
  factory _Tarif(
      {required final int id,
      required final String name,
      required final String description,
      @JsonKey(name: "base_price") required final double basePrice,
      @JsonKey(name: 'per_photo') required final double perPhoto,
      final String? picture}) = _$TarifImpl;

  factory _Tarif.fromJson(Map<String, dynamic> json) = _$TarifImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get description;
  @override
  @JsonKey(name: "base_price")
  double get basePrice;
  @override
  @JsonKey(name: 'per_photo')
  double get perPhoto;
  @override
  String? get picture;
  @override
  @JsonKey(ignore: true)
  _$$TarifImplCopyWith<_$TarifImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
