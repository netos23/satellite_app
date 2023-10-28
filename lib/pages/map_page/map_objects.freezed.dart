// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_objects.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MapPoint _$MapPointFromJson(Map<String, dynamic> json) {
  return _MapPoint.fromJson(json);
}

/// @nodoc
mixin _$MapPoint {
  double get lat => throw _privateConstructorUsedError;
  double get lon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MapPointCopyWith<MapPoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapPointCopyWith<$Res> {
  factory $MapPointCopyWith(MapPoint value, $Res Function(MapPoint) then) =
      _$MapPointCopyWithImpl<$Res, MapPoint>;
  @useResult
  $Res call({double lat, double lon});
}

/// @nodoc
class _$MapPointCopyWithImpl<$Res, $Val extends MapPoint>
    implements $MapPointCopyWith<$Res> {
  _$MapPointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lon = null,
  }) {
    return _then(_value.copyWith(
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
abstract class _$$MapPointImplCopyWith<$Res>
    implements $MapPointCopyWith<$Res> {
  factory _$$MapPointImplCopyWith(
          _$MapPointImpl value, $Res Function(_$MapPointImpl) then) =
      __$$MapPointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double lat, double lon});
}

/// @nodoc
class __$$MapPointImplCopyWithImpl<$Res>
    extends _$MapPointCopyWithImpl<$Res, _$MapPointImpl>
    implements _$$MapPointImplCopyWith<$Res> {
  __$$MapPointImplCopyWithImpl(
      _$MapPointImpl _value, $Res Function(_$MapPointImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lon = null,
  }) {
    return _then(_$MapPointImpl(
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
class _$MapPointImpl with DiagnosticableTreeMixin implements _MapPoint {
  const _$MapPointImpl({required this.lat, required this.lon});

  factory _$MapPointImpl.fromJson(Map<String, dynamic> json) =>
      _$$MapPointImplFromJson(json);

  @override
  final double lat;
  @override
  final double lon;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MapPoint(lat: $lat, lon: $lon)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MapPoint'))
      ..add(DiagnosticsProperty('lat', lat))
      ..add(DiagnosticsProperty('lon', lon));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MapPointImpl &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lon, lon) || other.lon == lon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, lat, lon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MapPointImplCopyWith<_$MapPointImpl> get copyWith =>
      __$$MapPointImplCopyWithImpl<_$MapPointImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MapPointImplToJson(
      this,
    );
  }
}

abstract class _MapPoint implements MapPoint {
  const factory _MapPoint(
      {required final double lat, required final double lon}) = _$MapPointImpl;

  factory _MapPoint.fromJson(Map<String, dynamic> json) =
      _$MapPointImpl.fromJson;

  @override
  double get lat;
  @override
  double get lon;
  @override
  @JsonKey(ignore: true)
  _$$MapPointImplCopyWith<_$MapPointImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MapObject {
  MapsObjectId get id => throw _privateConstructorUsedError;
  void Function()? get onTap => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MapsObjectId id, List<MapPoint> polygone,
            Color fill, Color stroke, double width, VoidCallback? onTap)
        polygon,
    required TResult Function(
            MapsObjectId id,
            MapPoint points,
            Uint8List? byteData,
            num? color,
            VoidCallback? onTap,
            ValueChanged<MapPoint>? onDragStart,
            ValueChanged<MapPoint>? onDragEnd,
            ValueChanged<MapPoint>? onDrag)
        point,
    required TResult Function(MapsObjectId id, List<MapPoint> points,
            Color stroke, double width, VoidCallback? onTap)
        polyline,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(MapsObjectId id, List<MapPoint> polygone, Color fill,
            Color stroke, double width, VoidCallback? onTap)?
        polygon,
    TResult? Function(
            MapsObjectId id,
            MapPoint points,
            Uint8List? byteData,
            num? color,
            VoidCallback? onTap,
            ValueChanged<MapPoint>? onDragStart,
            ValueChanged<MapPoint>? onDragEnd,
            ValueChanged<MapPoint>? onDrag)?
        point,
    TResult? Function(MapsObjectId id, List<MapPoint> points, Color stroke,
            double width, VoidCallback? onTap)?
        polyline,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MapsObjectId id, List<MapPoint> polygone, Color fill,
            Color stroke, double width, VoidCallback? onTap)?
        polygon,
    TResult Function(
            MapsObjectId id,
            MapPoint points,
            Uint8List? byteData,
            num? color,
            VoidCallback? onTap,
            ValueChanged<MapPoint>? onDragStart,
            ValueChanged<MapPoint>? onDragEnd,
            ValueChanged<MapPoint>? onDrag)?
        point,
    TResult Function(MapsObjectId id, List<MapPoint> points, Color stroke,
            double width, VoidCallback? onTap)?
        polyline,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Polygon value) polygon,
    required TResult Function(MapObjectPoint value) point,
    required TResult Function(Polyline value) polyline,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Polygon value)? polygon,
    TResult? Function(MapObjectPoint value)? point,
    TResult? Function(Polyline value)? polyline,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Polygon value)? polygon,
    TResult Function(MapObjectPoint value)? point,
    TResult Function(Polyline value)? polyline,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MapObjectCopyWith<MapObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapObjectCopyWith<$Res> {
  factory $MapObjectCopyWith(MapObject value, $Res Function(MapObject) then) =
      _$MapObjectCopyWithImpl<$Res, MapObject>;
  @useResult
  $Res call({MapsObjectId id, void Function()? onTap});
}

/// @nodoc
class _$MapObjectCopyWithImpl<$Res, $Val extends MapObject>
    implements $MapObjectCopyWith<$Res> {
  _$MapObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? onTap = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as MapsObjectId,
      onTap: freezed == onTap
          ? _value.onTap
          : onTap // ignore: cast_nullable_to_non_nullable
              as void Function()?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PolygonImplCopyWith<$Res>
    implements $MapObjectCopyWith<$Res> {
  factory _$$PolygonImplCopyWith(
          _$PolygonImpl value, $Res Function(_$PolygonImpl) then) =
      __$$PolygonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {MapsObjectId id,
      List<MapPoint> polygone,
      Color fill,
      Color stroke,
      double width,
      VoidCallback? onTap});
}

/// @nodoc
class __$$PolygonImplCopyWithImpl<$Res>
    extends _$MapObjectCopyWithImpl<$Res, _$PolygonImpl>
    implements _$$PolygonImplCopyWith<$Res> {
  __$$PolygonImplCopyWithImpl(
      _$PolygonImpl _value, $Res Function(_$PolygonImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? polygone = null,
    Object? fill = null,
    Object? stroke = null,
    Object? width = null,
    Object? onTap = freezed,
  }) {
    return _then(_$PolygonImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as MapsObjectId,
      polygone: null == polygone
          ? _value._polygone
          : polygone // ignore: cast_nullable_to_non_nullable
              as List<MapPoint>,
      fill: null == fill
          ? _value.fill
          : fill // ignore: cast_nullable_to_non_nullable
              as Color,
      stroke: null == stroke
          ? _value.stroke
          : stroke // ignore: cast_nullable_to_non_nullable
              as Color,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double,
      onTap: freezed == onTap
          ? _value.onTap
          : onTap // ignore: cast_nullable_to_non_nullable
              as VoidCallback?,
    ));
  }
}

/// @nodoc

class _$PolygonImpl with DiagnosticableTreeMixin implements Polygon {
  _$PolygonImpl(
      {required this.id,
      required final List<MapPoint> polygone,
      required this.fill,
      required this.stroke,
      required this.width,
      this.onTap})
      : _polygone = polygone;

  @override
  final MapsObjectId id;
  final List<MapPoint> _polygone;
  @override
  List<MapPoint> get polygone {
    if (_polygone is EqualUnmodifiableListView) return _polygone;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_polygone);
  }

  @override
  final Color fill;
  @override
  final Color stroke;
  @override
  final double width;
  @override
  final VoidCallback? onTap;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MapObject.polygon(id: $id, polygone: $polygone, fill: $fill, stroke: $stroke, width: $width, onTap: $onTap)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MapObject.polygon'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('polygone', polygone))
      ..add(DiagnosticsProperty('fill', fill))
      ..add(DiagnosticsProperty('stroke', stroke))
      ..add(DiagnosticsProperty('width', width))
      ..add(DiagnosticsProperty('onTap', onTap));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PolygonImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._polygone, _polygone) &&
            (identical(other.fill, fill) || other.fill == fill) &&
            (identical(other.stroke, stroke) || other.stroke == stroke) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.onTap, onTap) || other.onTap == onTap));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_polygone),
      fill,
      stroke,
      width,
      onTap);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PolygonImplCopyWith<_$PolygonImpl> get copyWith =>
      __$$PolygonImplCopyWithImpl<_$PolygonImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MapsObjectId id, List<MapPoint> polygone,
            Color fill, Color stroke, double width, VoidCallback? onTap)
        polygon,
    required TResult Function(
            MapsObjectId id,
            MapPoint points,
            Uint8List? byteData,
            num? color,
            VoidCallback? onTap,
            ValueChanged<MapPoint>? onDragStart,
            ValueChanged<MapPoint>? onDragEnd,
            ValueChanged<MapPoint>? onDrag)
        point,
    required TResult Function(MapsObjectId id, List<MapPoint> points,
            Color stroke, double width, VoidCallback? onTap)
        polyline,
  }) {
    return polygon(id, polygone, fill, stroke, width, onTap);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(MapsObjectId id, List<MapPoint> polygone, Color fill,
            Color stroke, double width, VoidCallback? onTap)?
        polygon,
    TResult? Function(
            MapsObjectId id,
            MapPoint points,
            Uint8List? byteData,
            num? color,
            VoidCallback? onTap,
            ValueChanged<MapPoint>? onDragStart,
            ValueChanged<MapPoint>? onDragEnd,
            ValueChanged<MapPoint>? onDrag)?
        point,
    TResult? Function(MapsObjectId id, List<MapPoint> points, Color stroke,
            double width, VoidCallback? onTap)?
        polyline,
  }) {
    return polygon?.call(id, polygone, fill, stroke, width, onTap);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MapsObjectId id, List<MapPoint> polygone, Color fill,
            Color stroke, double width, VoidCallback? onTap)?
        polygon,
    TResult Function(
            MapsObjectId id,
            MapPoint points,
            Uint8List? byteData,
            num? color,
            VoidCallback? onTap,
            ValueChanged<MapPoint>? onDragStart,
            ValueChanged<MapPoint>? onDragEnd,
            ValueChanged<MapPoint>? onDrag)?
        point,
    TResult Function(MapsObjectId id, List<MapPoint> points, Color stroke,
            double width, VoidCallback? onTap)?
        polyline,
    required TResult orElse(),
  }) {
    if (polygon != null) {
      return polygon(id, polygone, fill, stroke, width, onTap);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Polygon value) polygon,
    required TResult Function(MapObjectPoint value) point,
    required TResult Function(Polyline value) polyline,
  }) {
    return polygon(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Polygon value)? polygon,
    TResult? Function(MapObjectPoint value)? point,
    TResult? Function(Polyline value)? polyline,
  }) {
    return polygon?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Polygon value)? polygon,
    TResult Function(MapObjectPoint value)? point,
    TResult Function(Polyline value)? polyline,
    required TResult orElse(),
  }) {
    if (polygon != null) {
      return polygon(this);
    }
    return orElse();
  }
}

abstract class Polygon implements MapObject {
  factory Polygon(
      {required final MapsObjectId id,
      required final List<MapPoint> polygone,
      required final Color fill,
      required final Color stroke,
      required final double width,
      final VoidCallback? onTap}) = _$PolygonImpl;

  @override
  MapsObjectId get id;
  List<MapPoint> get polygone;
  Color get fill;
  Color get stroke;
  double get width;
  @override
  VoidCallback? get onTap;
  @override
  @JsonKey(ignore: true)
  _$$PolygonImplCopyWith<_$PolygonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MapObjectPointImplCopyWith<$Res>
    implements $MapObjectCopyWith<$Res> {
  factory _$$MapObjectPointImplCopyWith(_$MapObjectPointImpl value,
          $Res Function(_$MapObjectPointImpl) then) =
      __$$MapObjectPointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {MapsObjectId id,
      MapPoint points,
      Uint8List? byteData,
      num? color,
      VoidCallback? onTap,
      ValueChanged<MapPoint>? onDragStart,
      ValueChanged<MapPoint>? onDragEnd,
      ValueChanged<MapPoint>? onDrag});

  $MapPointCopyWith<$Res> get points;
}

/// @nodoc
class __$$MapObjectPointImplCopyWithImpl<$Res>
    extends _$MapObjectCopyWithImpl<$Res, _$MapObjectPointImpl>
    implements _$$MapObjectPointImplCopyWith<$Res> {
  __$$MapObjectPointImplCopyWithImpl(
      _$MapObjectPointImpl _value, $Res Function(_$MapObjectPointImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? points = null,
    Object? byteData = freezed,
    Object? color = freezed,
    Object? onTap = freezed,
    Object? onDragStart = freezed,
    Object? onDragEnd = freezed,
    Object? onDrag = freezed,
  }) {
    return _then(_$MapObjectPointImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as MapsObjectId,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as MapPoint,
      byteData: freezed == byteData
          ? _value.byteData
          : byteData // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as num?,
      onTap: freezed == onTap
          ? _value.onTap
          : onTap // ignore: cast_nullable_to_non_nullable
              as VoidCallback?,
      onDragStart: freezed == onDragStart
          ? _value.onDragStart
          : onDragStart // ignore: cast_nullable_to_non_nullable
              as ValueChanged<MapPoint>?,
      onDragEnd: freezed == onDragEnd
          ? _value.onDragEnd
          : onDragEnd // ignore: cast_nullable_to_non_nullable
              as ValueChanged<MapPoint>?,
      onDrag: freezed == onDrag
          ? _value.onDrag
          : onDrag // ignore: cast_nullable_to_non_nullable
              as ValueChanged<MapPoint>?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $MapPointCopyWith<$Res> get points {
    return $MapPointCopyWith<$Res>(_value.points, (value) {
      return _then(_value.copyWith(points: value));
    });
  }
}

/// @nodoc

class _$MapObjectPointImpl
    with DiagnosticableTreeMixin
    implements MapObjectPoint {
  _$MapObjectPointImpl(
      {required this.id,
      required this.points,
      this.byteData,
      this.color,
      this.onTap,
      this.onDragStart,
      this.onDragEnd,
      this.onDrag});

  @override
  final MapsObjectId id;
  @override
  final MapPoint points;
  @override
  final Uint8List? byteData;
  @override
  final num? color;
  @override
  final VoidCallback? onTap;
  @override
  final ValueChanged<MapPoint>? onDragStart;
  @override
  final ValueChanged<MapPoint>? onDragEnd;
  @override
  final ValueChanged<MapPoint>? onDrag;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MapObject.point(id: $id, points: $points, byteData: $byteData, color: $color, onTap: $onTap, onDragStart: $onDragStart, onDragEnd: $onDragEnd, onDrag: $onDrag)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MapObject.point'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('points', points))
      ..add(DiagnosticsProperty('byteData', byteData))
      ..add(DiagnosticsProperty('color', color))
      ..add(DiagnosticsProperty('onTap', onTap))
      ..add(DiagnosticsProperty('onDragStart', onDragStart))
      ..add(DiagnosticsProperty('onDragEnd', onDragEnd))
      ..add(DiagnosticsProperty('onDrag', onDrag));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MapObjectPointImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.points, points) || other.points == points) &&
            const DeepCollectionEquality().equals(other.byteData, byteData) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.onTap, onTap) || other.onTap == onTap) &&
            (identical(other.onDragStart, onDragStart) ||
                other.onDragStart == onDragStart) &&
            (identical(other.onDragEnd, onDragEnd) ||
                other.onDragEnd == onDragEnd) &&
            (identical(other.onDrag, onDrag) || other.onDrag == onDrag));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      points,
      const DeepCollectionEquality().hash(byteData),
      color,
      onTap,
      onDragStart,
      onDragEnd,
      onDrag);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MapObjectPointImplCopyWith<_$MapObjectPointImpl> get copyWith =>
      __$$MapObjectPointImplCopyWithImpl<_$MapObjectPointImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MapsObjectId id, List<MapPoint> polygone,
            Color fill, Color stroke, double width, VoidCallback? onTap)
        polygon,
    required TResult Function(
            MapsObjectId id,
            MapPoint points,
            Uint8List? byteData,
            num? color,
            VoidCallback? onTap,
            ValueChanged<MapPoint>? onDragStart,
            ValueChanged<MapPoint>? onDragEnd,
            ValueChanged<MapPoint>? onDrag)
        point,
    required TResult Function(MapsObjectId id, List<MapPoint> points,
            Color stroke, double width, VoidCallback? onTap)
        polyline,
  }) {
    return point(
        id, points, byteData, color, onTap, onDragStart, onDragEnd, onDrag);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(MapsObjectId id, List<MapPoint> polygone, Color fill,
            Color stroke, double width, VoidCallback? onTap)?
        polygon,
    TResult? Function(
            MapsObjectId id,
            MapPoint points,
            Uint8List? byteData,
            num? color,
            VoidCallback? onTap,
            ValueChanged<MapPoint>? onDragStart,
            ValueChanged<MapPoint>? onDragEnd,
            ValueChanged<MapPoint>? onDrag)?
        point,
    TResult? Function(MapsObjectId id, List<MapPoint> points, Color stroke,
            double width, VoidCallback? onTap)?
        polyline,
  }) {
    return point?.call(
        id, points, byteData, color, onTap, onDragStart, onDragEnd, onDrag);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MapsObjectId id, List<MapPoint> polygone, Color fill,
            Color stroke, double width, VoidCallback? onTap)?
        polygon,
    TResult Function(
            MapsObjectId id,
            MapPoint points,
            Uint8List? byteData,
            num? color,
            VoidCallback? onTap,
            ValueChanged<MapPoint>? onDragStart,
            ValueChanged<MapPoint>? onDragEnd,
            ValueChanged<MapPoint>? onDrag)?
        point,
    TResult Function(MapsObjectId id, List<MapPoint> points, Color stroke,
            double width, VoidCallback? onTap)?
        polyline,
    required TResult orElse(),
  }) {
    if (point != null) {
      return point(
          id, points, byteData, color, onTap, onDragStart, onDragEnd, onDrag);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Polygon value) polygon,
    required TResult Function(MapObjectPoint value) point,
    required TResult Function(Polyline value) polyline,
  }) {
    return point(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Polygon value)? polygon,
    TResult? Function(MapObjectPoint value)? point,
    TResult? Function(Polyline value)? polyline,
  }) {
    return point?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Polygon value)? polygon,
    TResult Function(MapObjectPoint value)? point,
    TResult Function(Polyline value)? polyline,
    required TResult orElse(),
  }) {
    if (point != null) {
      return point(this);
    }
    return orElse();
  }
}

abstract class MapObjectPoint implements MapObject {
  factory MapObjectPoint(
      {required final MapsObjectId id,
      required final MapPoint points,
      final Uint8List? byteData,
      final num? color,
      final VoidCallback? onTap,
      final ValueChanged<MapPoint>? onDragStart,
      final ValueChanged<MapPoint>? onDragEnd,
      final ValueChanged<MapPoint>? onDrag}) = _$MapObjectPointImpl;

  @override
  MapsObjectId get id;
  MapPoint get points;
  Uint8List? get byteData;
  num? get color;
  @override
  VoidCallback? get onTap;
  ValueChanged<MapPoint>? get onDragStart;
  ValueChanged<MapPoint>? get onDragEnd;
  ValueChanged<MapPoint>? get onDrag;
  @override
  @JsonKey(ignore: true)
  _$$MapObjectPointImplCopyWith<_$MapObjectPointImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PolylineImplCopyWith<$Res>
    implements $MapObjectCopyWith<$Res> {
  factory _$$PolylineImplCopyWith(
          _$PolylineImpl value, $Res Function(_$PolylineImpl) then) =
      __$$PolylineImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {MapsObjectId id,
      List<MapPoint> points,
      Color stroke,
      double width,
      VoidCallback? onTap});
}

/// @nodoc
class __$$PolylineImplCopyWithImpl<$Res>
    extends _$MapObjectCopyWithImpl<$Res, _$PolylineImpl>
    implements _$$PolylineImplCopyWith<$Res> {
  __$$PolylineImplCopyWithImpl(
      _$PolylineImpl _value, $Res Function(_$PolylineImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? points = null,
    Object? stroke = null,
    Object? width = null,
    Object? onTap = freezed,
  }) {
    return _then(_$PolylineImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as MapsObjectId,
      points: null == points
          ? _value._points
          : points // ignore: cast_nullable_to_non_nullable
              as List<MapPoint>,
      stroke: null == stroke
          ? _value.stroke
          : stroke // ignore: cast_nullable_to_non_nullable
              as Color,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double,
      onTap: freezed == onTap
          ? _value.onTap
          : onTap // ignore: cast_nullable_to_non_nullable
              as VoidCallback?,
    ));
  }
}

/// @nodoc

class _$PolylineImpl with DiagnosticableTreeMixin implements Polyline {
  _$PolylineImpl(
      {required this.id,
      required final List<MapPoint> points,
      required this.stroke,
      required this.width,
      this.onTap})
      : _points = points;

  @override
  final MapsObjectId id;
  final List<MapPoint> _points;
  @override
  List<MapPoint> get points {
    if (_points is EqualUnmodifiableListView) return _points;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_points);
  }

  @override
  final Color stroke;
  @override
  final double width;
  @override
  final VoidCallback? onTap;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MapObject.polyline(id: $id, points: $points, stroke: $stroke, width: $width, onTap: $onTap)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MapObject.polyline'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('points', points))
      ..add(DiagnosticsProperty('stroke', stroke))
      ..add(DiagnosticsProperty('width', width))
      ..add(DiagnosticsProperty('onTap', onTap));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PolylineImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._points, _points) &&
            (identical(other.stroke, stroke) || other.stroke == stroke) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.onTap, onTap) || other.onTap == onTap));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id,
      const DeepCollectionEquality().hash(_points), stroke, width, onTap);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PolylineImplCopyWith<_$PolylineImpl> get copyWith =>
      __$$PolylineImplCopyWithImpl<_$PolylineImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MapsObjectId id, List<MapPoint> polygone,
            Color fill, Color stroke, double width, VoidCallback? onTap)
        polygon,
    required TResult Function(
            MapsObjectId id,
            MapPoint points,
            Uint8List? byteData,
            num? color,
            VoidCallback? onTap,
            ValueChanged<MapPoint>? onDragStart,
            ValueChanged<MapPoint>? onDragEnd,
            ValueChanged<MapPoint>? onDrag)
        point,
    required TResult Function(MapsObjectId id, List<MapPoint> points,
            Color stroke, double width, VoidCallback? onTap)
        polyline,
  }) {
    return polyline(id, points, stroke, width, onTap);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(MapsObjectId id, List<MapPoint> polygone, Color fill,
            Color stroke, double width, VoidCallback? onTap)?
        polygon,
    TResult? Function(
            MapsObjectId id,
            MapPoint points,
            Uint8List? byteData,
            num? color,
            VoidCallback? onTap,
            ValueChanged<MapPoint>? onDragStart,
            ValueChanged<MapPoint>? onDragEnd,
            ValueChanged<MapPoint>? onDrag)?
        point,
    TResult? Function(MapsObjectId id, List<MapPoint> points, Color stroke,
            double width, VoidCallback? onTap)?
        polyline,
  }) {
    return polyline?.call(id, points, stroke, width, onTap);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MapsObjectId id, List<MapPoint> polygone, Color fill,
            Color stroke, double width, VoidCallback? onTap)?
        polygon,
    TResult Function(
            MapsObjectId id,
            MapPoint points,
            Uint8List? byteData,
            num? color,
            VoidCallback? onTap,
            ValueChanged<MapPoint>? onDragStart,
            ValueChanged<MapPoint>? onDragEnd,
            ValueChanged<MapPoint>? onDrag)?
        point,
    TResult Function(MapsObjectId id, List<MapPoint> points, Color stroke,
            double width, VoidCallback? onTap)?
        polyline,
    required TResult orElse(),
  }) {
    if (polyline != null) {
      return polyline(id, points, stroke, width, onTap);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Polygon value) polygon,
    required TResult Function(MapObjectPoint value) point,
    required TResult Function(Polyline value) polyline,
  }) {
    return polyline(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Polygon value)? polygon,
    TResult? Function(MapObjectPoint value)? point,
    TResult? Function(Polyline value)? polyline,
  }) {
    return polyline?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Polygon value)? polygon,
    TResult Function(MapObjectPoint value)? point,
    TResult Function(Polyline value)? polyline,
    required TResult orElse(),
  }) {
    if (polyline != null) {
      return polyline(this);
    }
    return orElse();
  }
}

abstract class Polyline implements MapObject {
  factory Polyline(
      {required final MapsObjectId id,
      required final List<MapPoint> points,
      required final Color stroke,
      required final double width,
      final VoidCallback? onTap}) = _$PolylineImpl;

  @override
  MapsObjectId get id;
  List<MapPoint> get points;
  Color get stroke;
  double get width;
  @override
  VoidCallback? get onTap;
  @override
  @JsonKey(ignore: true)
  _$$PolylineImplCopyWith<_$PolylineImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
