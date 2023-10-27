import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as gm;
import 'package:satellite_app/pages/map_page/google_extensions.dart';
import 'package:satellite_app/pages/map_page/google_map_controller.dart';
import 'package:satellite_app/pages/map_page/map_controller.dart';
import 'package:satellite_app/pages/map_page/map_objects.dart';

class GoogleGenericMap extends StatefulWidget {
  const GoogleGenericMap({
    super.key,
    required this.initialCameraPoint,
    this.onMapCreated,
    this.objects = const [],
  });

  final ValueChanged<MapController>? onMapCreated;
  final MapPoint initialCameraPoint;
  final List<MapObject> objects;

  @override
  State<GoogleGenericMap> createState() => _GenericMapState();
}

class _GenericMapState extends State<GoogleGenericMap> {
  MapController? _mapController;

  @override
  Widget build(BuildContext context) {
    return gm.GoogleMap(
      zoomControlsEnabled: false,
      compassEnabled: false,
      initialCameraPosition: gm.CameraPosition(
        target: widget.initialCameraPoint.toLatLng(),
      ),
      polygons: _mapPolygons(widget.objects),
      polylines: _mapPolyline(widget.objects),
      markers: _mapMarkers(widget.objects),
      onMapCreated: (controller) {
        final mapController = GenericGoogleMapController(controller);
        _mapController = mapController;
        widget.onMapCreated?.call(mapController);
      },
    );
  }

  Set<gm.Polygon> _mapPolygons(List<MapObject> objects) {
    return objects
        .whereType<Polygon>()
        .map((p) => gm.Polygon(
              polygonId: gm.PolygonId(p.id.value),
              onTap: p.onTap,
              fillColor: p.fill,
              strokeColor: p.stroke,
              strokeWidth: p.width.toInt(),
              points: p.polygone.map((p) => p.toLatLng()).toList(),
            ))
        .toSet();
  }

  ValueSetter<gm.LatLng>? _mapIfNotNull(ValueSetter<MapPoint>? setter) {
    if (setter == null) {
      return null;
    }
    return (l) => setter.call(
          MapPoint(lat: l.latitude, lon: l.longitude),
        );
  }

  Set<gm.Marker> _mapMarkers(List<MapObject> objects) {
    return objects
        .whereType<MapObjectPoint>()
        .map((p) => gm.Marker(
              markerId: gm.MarkerId(p.id.value),
              onTap: p.onTap,
              onDrag: _mapIfNotNull(p.onDrag),
              onDragEnd: _mapIfNotNull(p.onDrag),
              onDragStart: _mapIfNotNull(p.onDrag),
              icon: _buildIcon(p),
            ))
        .toSet();
  }

  Set<gm.Polyline> _mapPolyline(List<MapObject> objects) {
    return objects
        .whereType<Polyline>()
        .map((p) => gm.Polyline(
              polylineId: gm.PolylineId(p.id.value),
              onTap: p.onTap,
              color: p.stroke,
              width: p.width.toInt(),
              points: p.points.map((p) => p.toLatLng()).toList(),
            ))
        .toSet();
  }

  @override
  void dispose() {
    _mapController?.dispose();
    super.dispose();
  }

  gm.BitmapDescriptor _buildIcon(MapObjectPoint p) {
    var byteData = p.byteData;
    if(byteData != null){
      return gm.BitmapDescriptor.fromBytes(byteData);
    }
    var color = p.color;
    if(color is double){
      return gm.BitmapDescriptor.defaultMarkerWithHue(color);
    }

    return gm.BitmapDescriptor.defaultMarker;
  }
}
