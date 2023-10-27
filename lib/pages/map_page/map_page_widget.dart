import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'map_page_wm.dart';

// TODO: cover with documentation
/// Main widget for ProfilePage module
@RoutePage()
class MapPageWidget extends ElementaryWidget<IMapPageWidgetModel> {
  const MapPageWidget({
    Key? key,
    WidgetModelFactory wmFactory = defaultMapPageWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IMapPageWidgetModel wm) {
    final theme = wm.theme;
    final textTheme = wm.textTheme;
    final colorTheme = wm.colorScheme;

    return OrientationBuilder(
      builder: (context, orientation) {
        return Scaffold(
          body: Stack(
            fit: StackFit.expand,
            children: [
              Positioned.fill(
                child: GoogleMap(
                  zoomControlsEnabled: false,
                  compassEnabled: false,
                  initialCameraPosition: const CameraPosition(
                    target: LatLng(1231, 123),
                  ),
                  onMapCreated: wm.onMapCreated,
                ),
              ),
              Positioned(
                top: 30,
                right: 16,
                child: SizedBox(
                  height: 60,
                  width: 60,
                  child: _SettingsButton(
                    wm: wm,
                  ),
                ),
              ),
              Positioned(
                top: 100,
                right: 16,
                child: SizedBox(
                  height: 110,
                  width: 60,
                  child: _ZoomButtons(
                    wm: wm,
                  ),
                ),
              ),
              Positioned(
                bottom: 100,
                right: 16,
                child: SizedBox(
                  height: 110,
                  width: 60,
                  child: FloatingActionButton(
                    onPressed: wm.addPoint,
                    child: const Icon(Icons.add),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ZoomButtons extends StatelessWidget {
  const _ZoomButtons({
    super.key,
    required this.wm,
  });

  final IMapPageWidgetModel wm;

  @override
  Widget build(BuildContext context) {
    return Card(
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
    );
  }
}

class _SettingsButton extends StatelessWidget {
  const _SettingsButton({
    super.key,
    required this.wm,
  });

  final IMapPageWidgetModel wm;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 5,
      shape: const CircleBorder(),
      onPressed: wm.openSettings,
      child: const Icon(Icons.settings_outlined),
    );
  }
}
