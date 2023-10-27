// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Order _$OrderFromJson(Map<String, dynamic> json) {
  return _Order.fromJson(json);
}

/// @nodoc
mixin _$Order {
  @JsonKey(name: "date_begin")
  String get dateBegin => throw _privateConstructorUsedError;
  @JsonKey(name: "date_end")
  String get dateEnd => throw _privateConstructorUsedError;
  int? get user => throw _privateConstructorUsedError;
  double? get price => throw _privateConstructorUsedError;
  List<int> get satellites => throw _privateConstructorUsedError;
  int? get status => throw _privateConstructorUsedError;
  int get geozone => throw _privateConstructorUsedError;
  int get tarif => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  String? get createdAt => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderCopyWith<Order> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCopyWith<$Res> {
  factory $OrderCopyWith(Order value, $Res Function(Order) then) =
      _$OrderCopyWithImpl<$Res, Order>;
  @useResult
  $Res call(
      {@JsonKey(name: "date_begin") String dateBegin,
      @JsonKey(name: "date_end") String dateEnd,
      int? user,
      double? price,
      List<int> satellites,
      int? status,
      int geozone,
      int tarif,
      @JsonKey(name: "created_at") String? createdAt,
      int? id});
}

/// @nodoc
class _$OrderCopyWithImpl<$Res, $Val extends Order>
    implements $OrderCopyWith<$Res> {
  _$OrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateBegin = null,
    Object? dateEnd = null,
    Object? user = freezed,
    Object? price = freezed,
    Object? satellites = null,
    Object? status = freezed,
    Object? geozone = null,
    Object? tarif = null,
    Object? createdAt = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      dateBegin: null == dateBegin
          ? _value.dateBegin
          : dateBegin // ignore: cast_nullable_to_non_nullable
              as String,
      dateEnd: null == dateEnd
          ? _value.dateEnd
          : dateEnd // ignore: cast_nullable_to_non_nullable
              as String,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as int?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      satellites: null == satellites
          ? _value.satellites
          : satellites // ignore: cast_nullable_to_non_nullable
              as List<int>,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      geozone: null == geozone
          ? _value.geozone
          : geozone // ignore: cast_nullable_to_non_nullable
              as int,
      tarif: null == tarif
          ? _value.tarif
          : tarif // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderImplCopyWith<$Res> implements $OrderCopyWith<$Res> {
  factory _$$OrderImplCopyWith(
          _$OrderImpl value, $Res Function(_$OrderImpl) then) =
      __$$OrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "date_begin") String dateBegin,
      @JsonKey(name: "date_end") String dateEnd,
      int? user,
      double? price,
      List<int> satellites,
      int? status,
      int geozone,
      int tarif,
      @JsonKey(name: "created_at") String? createdAt,
      int? id});
}

/// @nodoc
class __$$OrderImplCopyWithImpl<$Res>
    extends _$OrderCopyWithImpl<$Res, _$OrderImpl>
    implements _$$OrderImplCopyWith<$Res> {
  __$$OrderImplCopyWithImpl(
      _$OrderImpl _value, $Res Function(_$OrderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateBegin = null,
    Object? dateEnd = null,
    Object? user = freezed,
    Object? price = freezed,
    Object? satellites = null,
    Object? status = freezed,
    Object? geozone = null,
    Object? tarif = null,
    Object? createdAt = freezed,
    Object? id = freezed,
  }) {
    return _then(_$OrderImpl(
      dateBegin: null == dateBegin
          ? _value.dateBegin
          : dateBegin // ignore: cast_nullable_to_non_nullable
              as String,
      dateEnd: null == dateEnd
          ? _value.dateEnd
          : dateEnd // ignore: cast_nullable_to_non_nullable
              as String,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as int?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      satellites: null == satellites
          ? _value._satellites
          : satellites // ignore: cast_nullable_to_non_nullable
              as List<int>,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      geozone: null == geozone
          ? _value.geozone
          : geozone // ignore: cast_nullable_to_non_nullable
              as int,
      tarif: null == tarif
          ? _value.tarif
          : tarif // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderImpl implements _Order {
  _$OrderImpl(
      {@JsonKey(name: "date_begin") required this.dateBegin,
      @JsonKey(name: "date_end") required this.dateEnd,
      this.user,
      this.price,
      required final List<int> satellites,
      this.status,
      required this.geozone,
      required this.tarif,
      @JsonKey(name: "created_at") this.createdAt,
      this.id})
      : _satellites = satellites;

  factory _$OrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderImplFromJson(json);

  @override
  @JsonKey(name: "date_begin")
  final String dateBegin;
  @override
  @JsonKey(name: "date_end")
  final String dateEnd;
  @override
  final int? user;
  @override
  final double? price;
  final List<int> _satellites;
  @override
  List<int> get satellites {
    if (_satellites is EqualUnmodifiableListView) return _satellites;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_satellites);
  }

  @override
  final int? status;
  @override
  final int geozone;
  @override
  final int tarif;
  @override
  @JsonKey(name: "created_at")
  final String? createdAt;
  @override
  final int? id;

  @override
  String toString() {
    return 'Order(dateBegin: $dateBegin, dateEnd: $dateEnd, user: $user, price: $price, satellites: $satellites, status: $status, geozone: $geozone, tarif: $tarif, createdAt: $createdAt, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderImpl &&
            (identical(other.dateBegin, dateBegin) ||
                other.dateBegin == dateBegin) &&
            (identical(other.dateEnd, dateEnd) || other.dateEnd == dateEnd) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.price, price) || other.price == price) &&
            const DeepCollectionEquality()
                .equals(other._satellites, _satellites) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.geozone, geozone) || other.geozone == geozone) &&
            (identical(other.tarif, tarif) || other.tarif == tarif) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      dateBegin,
      dateEnd,
      user,
      price,
      const DeepCollectionEquality().hash(_satellites),
      status,
      geozone,
      tarif,
      createdAt,
      id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      __$$OrderImplCopyWithImpl<_$OrderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderImplToJson(
      this,
    );
  }
}

abstract class _Order implements Order {
  factory _Order(
      {@JsonKey(name: "date_begin") required final String dateBegin,
      @JsonKey(name: "date_end") required final String dateEnd,
      final int? user,
      final double? price,
      required final List<int> satellites,
      final int? status,
      required final int geozone,
      required final int tarif,
      @JsonKey(name: "created_at") final String? createdAt,
      final int? id}) = _$OrderImpl;

  factory _Order.fromJson(Map<String, dynamic> json) = _$OrderImpl.fromJson;

  @override
  @JsonKey(name: "date_begin")
  String get dateBegin;
  @override
  @JsonKey(name: "date_end")
  String get dateEnd;
  @override
  int? get user;
  @override
  double? get price;
  @override
  List<int> get satellites;
  @override
  int? get status;
  @override
  int get geozone;
  @override
  int get tarif;
  @override
  @JsonKey(name: "created_at")
  String? get createdAt;
  @override
  int? get id;
  @override
  @JsonKey(ignore: true)
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
