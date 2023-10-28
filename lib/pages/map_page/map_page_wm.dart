import 'dart:async';

import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:satellite_app/data/repository/auth_repository.dart';
import 'package:satellite_app/internal/app_components.dart';
import 'package:satellite_app/pages/map_page/map_controller.dart';
import 'package:satellite_app/pages/map_page/map_layers.dart';
import 'package:satellite_app/pages/map_page/map_objects.dart';
import 'package:satellite_app/pages/map_page/map_overlay.dart';
import 'package:satellite_app/pages/map_page/map_points_page_widget.dart';
import 'package:satellite_app/pages/map_page/map_settings_page_widget.dart';
import 'package:satellite_app/router/app_router.dart';
import 'package:satellite_app/util/wm_extensions.dart';

import 'map_page_model.dart';
import 'map_page_widget.dart';

abstract class IMapPageWidgetModel extends IWidgetModel
    implements IThemeProvider {
  BehaviorSubject<Set<MapObject>> get mapObjectController;

  MapOverlayController get mapOverlayController;

  void onMapCreated(MapController controller);

  void addPoint();

  void onTap(MapPoint value);
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
  final mapObjectController = BehaviorSubject<Set<MapObject>>();

  final _mapPointController = StreamController<MapPoint>.broadcast();

  @override
  late final mapOverlayController = MapOverlayController(
    [
      MapOverlayEntry(
        id: MapLayers.settings,
        builder: (_) => MapSettingsPageWidget(
          controller: () => controller,
          mapObjectController: mapObjectController,
        ),
      ),
      MapOverlayEntry(
        id: MapLayers.add,
        builder: (_) => Positioned(
          right: 16,
          bottom: 40,
          child: Align(
            alignment: Alignment.bottomRight,
            child: SizedBox(
              height: 70,
              width: 70,
              child: FloatingActionButton(
                onPressed: navigateAdd,
                child: const Icon(Icons.add),
              ),
            ),
          ),
        ),
      ),
    ],
  );

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
/*    final set1 = _mapPolygones(zonesPub, colorScheme.primary);
    final set2 = _mapPolygones(zones, colorScheme.tertiary);*/
  }

  @override
  void onMapCreated(MapController controller) {
    this.controller = controller;
  }

  @override
  void addPoint() {
  }

  @override
  void dispose() {
    mapObjectController.close();
    controller = null;
    super.dispose();
  }

  void navigateAdd() {
    print('context.select((SubjectBloc bloc) => bloc.state)');
    mapOverlayController.hide(MapLayers.add);
    mapOverlayController.push(
      MapOverlayEntry(
        id: MapLayers.settings,
        builder: (context) => MapPointsPageWidget(
          mapOverlayController: mapOverlayController,
          mapStreem: _mapPointController.stream,
          mapObjectController: mapObjectController,
        ),
      ),
    );
  }

  @override
  void onTap(MapPoint value) {
    _mapPointController.add(value);
  }
}
