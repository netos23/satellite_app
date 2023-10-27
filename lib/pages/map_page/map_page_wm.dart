import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rxdart/rxdart.dart';
import 'package:satellite_app/data/repository/auth_repository.dart';
import 'package:satellite_app/domain/entity/geozones/geozone.dart';
import 'package:satellite_app/internal/app_components.dart';
import 'package:satellite_app/router/app_router.dart';
import 'package:satellite_app/util/wm_extensions.dart';

import 'map_page_model.dart';
import 'map_page_widget.dart';

abstract class IMapPageWidgetModel extends IWidgetModel
    implements IThemeProvider {
  BehaviorSubject<(Set<Polygon>, bool)> get poliygonController;

  void onMapCreated(GoogleMapController controller);

  Future<void> openSettings();

  void zoomIn();

  void zoomOut();

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

  final profileUseCase = AppComponents().profileUseCase;

  bool get isUnauthorisedUser =>
      profileUseCase.profile.valueOrNull == null ||
      (profileUseCase.profile.value!.email ?? '').isEmpty;

  AuthRepository authRepository = AuthRepository(
    AppComponents().authService,
  );

  GoogleMapController? controller;

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    _initPoligons();
  }

  Future<void> _initPoligons() async {
    final zones = await AppComponents().geozonesRepository.getDeprecated();
    final zonesPub = await AppComponents().geozonesRepository.getZones();
    final set1 = _mapPolygones(zonesPub, colorScheme.primary);
    final set2 = _mapPolygones(zones, colorScheme.tertiary);
    final res = <Polygon>{};
    res.addAll(set2);
    res.addAll(set1);
    poliygonController.add((res, true));
  }

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

  @override
  void onMapCreated(GoogleMapController controller) {
    this.controller = controller;
  }

  @override
  Future<void> openSettings() async {}

  @override
  void zoomIn() {
    controller?.animateCamera(
      CameraUpdate.zoomIn(),
    );
  }

  @override
  void zoomOut() {
    controller?.animateCamera(
      CameraUpdate.zoomOut(),
    );
  }

  @override
  void addPoint() {
    router.push(OrderingRoute());
  }

  @override
  void dispose() {
    poliygonController.close();
    super.dispose();
  }

  @override
  final poliygonController = BehaviorSubject<(Set<Polygon>, bool)>();
}
