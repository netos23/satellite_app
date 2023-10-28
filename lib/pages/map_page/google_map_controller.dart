import 'package:google_maps_flutter/google_maps_flutter.dart' as gmf;

import 'map_controller.dart';

class GenericGoogleMapController implements MapController {
  final gmf.GoogleMapController? _controller;

  GenericGoogleMapController(this._controller);

  @override
  Future<void> animateCamera(CameraUpdate cameraUpdate) async {
    final update = switch (cameraUpdate) {
      CameraUpdateZoomIn() => gmf.CameraUpdate.zoomIn(),
      CameraUpdateZoomOut() => gmf.CameraUpdate.zoomOut(),
    };

    await _controller?.animateCamera(update);
  }

  @override
  void dispose() {

  }
}
