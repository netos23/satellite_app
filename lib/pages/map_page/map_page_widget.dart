import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:satellite_app/pages/map_page/google_generic_map.dart';
import 'package:satellite_app/pages/map_page/map_objects.dart';
import 'package:satellite_app/pages/map_page/map_overlay.dart';

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
          body: MapOverlay(
            mapOverlayController: wm.mapOverlayController,
            map: GoogleGenericMap(
              onMapCreated: wm.onMapCreated,
              initialCameraPoint: const MapPoint(
                lat: 21.1232,
                lon: 34.123,
              ),
            ),
          ),
        );
      },
    );
  }
}

