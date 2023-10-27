import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:satellite_app/pages/map_page/map_controller.dart';

import 'map_settings_page_model.dart';
import 'map_settings_page_widget.dart';

abstract class IMapSettingsPageWidgetModel extends IWidgetModel {
  Future<void> openSettings();

  void zoomIn();

  void zoomOut();
}

MapSettingsPageWidgetModel defaultMapSettingsPageWidgetModelFactory(
    BuildContext context) {
  return MapSettingsPageWidgetModel(MapSettingsPageModel());
}

// TODO: cover with documentation
/// Default widget model for MapSettingsPageWidget
class MapSettingsPageWidgetModel
    extends WidgetModel<MapSettingsPageWidget, MapSettingsPageModel>
    implements IMapSettingsPageWidgetModel {
  MapSettingsPageWidgetModel(MapSettingsPageModel model) : super(model);

  MapController? get _controller => widget.controller?.call();

  @override
  Future<void> openSettings() async {}

  @override
  void zoomIn() {
    _controller?.animateCamera(
      const CameraUpdate.zoomIn(),
    );
  }

  @override
  void zoomOut() {
    _controller?.animateCamera(
      const CameraUpdate.zoomOut(),
    );
  }
}
