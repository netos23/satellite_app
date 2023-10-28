import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:satellite_app/pages/map_page/map_objects.dart';
import 'package:satellite_app/pages/map_page/map_overlay.dart';

import 'map_points_page_wm.dart';

// TODO: cover with documentation
/// Main widget for MapPointsPage module
class MapPointsPageWidget extends ElementaryWidget<IMapPointsPageWidgetModel> {
  const MapPointsPageWidget({
    Key? key,
    required this.mapOverlayController,
    required this.mapObjectController,
    required this.mapStreem,
    WidgetModelFactory wmFactory = defaultMapPointsPageWidgetModelFactory,
  }) : super(wmFactory, key: key);

  final MapOverlayController mapOverlayController;
  final BehaviorSubject<Set<MapObject>> mapObjectController;
  final Stream<MapPoint> mapStreem;

  @override
  Widget build(IMapPointsPageWidgetModel wm) {
    return OrientationBuilder(
      builder: (context, orientation) {
        // if (orientation == Orientation.portrait) {
          return Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(
                right: 16.0,
                bottom: 20,
              ),
              child: SizedBox(
                width: 80,
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    FloatingActionButton(
                      onPressed: wm.close,
                      child: const Icon(Icons.close),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FloatingActionButton(
                      onPressed: wm.edit,
                      child: const Icon(Icons.edit),
                    ),
                  ],
                ),
              ),
            ),
          );
        // }
        //
        // return Container();
      },
    );
  }
}
