import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'map_objects.freezed.dart';

part 'map_objects.g.dart';

@freezed
class MapPoint with _$MapPoint {
  const factory MapPoint({
    required double lat,
    required double lon,
  }) = _MapPoint;

  factory MapPoint.fromJson(Map<String, dynamic> json) =>
      _$MapPointFromJson(json);
}

class MapsObjectId {
  /// Creates an immutable identifier for a [Polygon].
  const MapsObjectId(this.value);

  final String value;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is MapsObjectId && value == other.value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() {
    return '${objectRuntimeType(this, 'MapsObjectId')}($value)';
  }
}

@freezed
sealed class MapObject with _$MapObject {
  factory MapObject.polygon({
    required MapsObjectId id,
    required List<MapPoint> polygone,
    required Color fill,
    required Color stroke,
    required double width,
    VoidCallback? onTap,
  }) = Polygon;

  factory MapObject.point({
    required MapsObjectId id,
    required MapPoint points,
    Uint8List? byteData,
    num? color,
    VoidCallback? onTap,
    ValueChanged<MapPoint>? onDragStart,
    ValueChanged<MapPoint>? onDragEnd,
    ValueChanged<MapPoint>? onDrag,
  }) = MapObjectPoint;

  factory MapObject.polyline({
    required MapsObjectId id,
    required List<MapPoint> points,
    required Color stroke,
    required double width,
    VoidCallback? onTap,
  }) = Polyline;
}
