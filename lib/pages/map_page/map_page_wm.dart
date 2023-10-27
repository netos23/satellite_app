import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:satellite_app/data/repository/auth_repository.dart';
import 'package:satellite_app/internal/app_components.dart';
import 'package:satellite_app/pages/map_page/map_controller.dart';
import 'package:satellite_app/pages/map_page/map_layers.dart';
import 'package:satellite_app/pages/map_page/map_overlay.dart';
import 'package:satellite_app/pages/map_page/map_settings_page_widget.dart';
import 'package:satellite_app/router/app_router.dart';
import 'package:satellite_app/util/wm_extensions.dart';

import 'map_page_model.dart';
import 'map_page_widget.dart';

abstract class IMapPageWidgetModel extends IWidgetModel
    implements IThemeProvider {
  MapOverlayController get mapOverlayController;

  void onMapCreated(MapController controller);

  void addPoint();
}

MapPageWidgetModel defaultMapPageWidgetModelFactory(BuildContext context) {
  return MapPageWidgetModel(MapPageModel());
}

// TODO: cover with documentation
/// Default widget model for ProfilePageWidget
class MapPageWidgetModel extends WidgetModel<MapPageWidget, MapPageModel>
    with ThemeProvider
    implements IMapPageWidgetModel {
  MapPageWidgetModel(MapPageModel model) : super(model);

  @override
  late final mapOverlayController = MapOverlayController([
    MapOverlayEntry(
      id: MapLayers.settings,
      builder: (_) => MapSettingsPageWidget(
        controller: () => controller,
      ),
    )
  ]);

  final profileUseCase = AppComponents().profileUseCase;

  bool get isUnauthorisedUser =>
      profileUseCase.profile.valueOrNull == null ||
      (profileUseCase.profile.value!.email ?? '').isEmpty;

  AuthRepository authRepository = AuthRepository(
    AppComponents().authService,
  );

  MapController? controller;

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    _initPoligons();
  }

  Future<void> _initPoligons() async {
    final zones = await AppComponents().geozonesRepository.getDeprecated();
    final zonesPub = await AppComponents().geozonesRepository.getZones();
/*    final set1 = _mapPolygones(zonesPub, colorScheme.primary);
    final set2 = _mapPolygones(zones, colorScheme.tertiary);*/
  }

/*

  Set<Polygon> _mapPolygones(List<Geozone> zones, Color color) {
    return zones
        .expand((z) => z.wkt)
        .map((p) {
          return p.map((e) {
            if (e.length != 2) {
              return null;
            }
            return LatLng(e[1], e[0]);
          }).whereType<LatLng>();
        })
        .map(
          (e) => Polygon(
            polygonId: PolygonId(e.hashCode.toString()),
            fillColor: color.withOpacity(0.5),
            strokeColor: color,
            strokeWidth: 1,
            points: e.toList(),
          ),
        )
        .toSet();
  }
*/

  @override
  void onMapCreated(MapController controller) {
    this.controller = controller;
  }

  @override
  void addPoint() {
    router.push(OrderingRoute());
  }

  @override
  void dispose() {
    controller = null;
    super.dispose();
  }
}
