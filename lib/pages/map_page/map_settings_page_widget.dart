import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:satellite_app/pages/map_page/map_controller.dart';

import 'map_settings_page_wm.dart';

// TODO: cover with documentation
/// Main widget for MapSettingsPage module
class MapSettingsPageWidget
    extends ElementaryWidget<IMapSettingsPageWidgetModel> {
  const MapSettingsPageWidget({
    Key? key,
    required this.controller,
    WidgetModelFactory wmFactory = defaultMapSettingsPageWidgetModelFactory,
  }) : super(wmFactory, key: key);

  final ValueGetter<MapController?>? controller;

  @override
  Widget build(IMapSettingsPageWidgetModel wm) {
    return Positioned(
      top: 30,
      right: 16,
      child: Column(
        children: [
          _SettingsButton(wm: wm),
          const SizedBox(
            height: 10,
          ),
          _ZoomButtons(wm: wm),
        ],
      ),
    );
  }
}

class _ZoomButtons extends StatelessWidget {
  const _ZoomButtons({
    super.key,
    required this.wm,
  });

  final IMapSettingsPageWidgetModel wm;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: 120,
      child: Card(
        elevation: 5,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: InkWell(
                onTap: wm.zoomIn,
                child: const Center(
                  child: Icon(Icons.zoom_in),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: wm.zoomOut,
                child: const Center(
                  child: Icon(Icons.zoom_out),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SettingsButton extends StatelessWidget {
  const _SettingsButton({
    super.key,
    required this.wm,
  });

  final IMapSettingsPageWidgetModel wm;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: 60,
      child: FloatingActionButton(
        elevation: 5,
        shape: const CircleBorder(),
        onPressed: wm.openSettings,
        child: const Icon(Icons.settings_outlined),
      ),
    );
  }
}
