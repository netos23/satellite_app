import 'package:freezed_annotation/freezed_annotation.dart';

part 'map_controller.freezed.dart';

@freezed
sealed class CameraUpdate with _$CameraUpdate {
  const factory CameraUpdate.zoomIn() = CameraUpdateZoomIn;

  const factory CameraUpdate.zoomOut() = CameraUpdateZoomOut;
}

abstract interface class MapController {


  Future<void> animateCamera(CameraUpdate cameraUpdate);

  void dispose();
}
