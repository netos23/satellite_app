import 'dart:async';

import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';
import 'package:satellite_app/domain/entity/geozones/geozone.dart';
import 'package:satellite_app/internal/app_components.dart';
import 'package:satellite_app/pages/map_page/map_layers.dart';
import 'package:satellite_app/pages/map_page/map_objects.dart';
import 'package:satellite_app/router/app_router.dart';
import 'package:satellite_app/util/snack_bar_util.dart';
import 'package:satellite_app/util/wm_extensions.dart';

import 'map_points_page_model.dart';
import 'map_points_page_widget.dart';
import 'map_settings_page_widget.dart';

abstract class IMapPointsPageWidgetModel extends IWidgetModel
    implements IThemeProvider {
  void edit();

  void close();
}

MapPointsPageWidgetModel defaultMapPointsPageWidgetModelFactory(
    BuildContext context) {
  return MapPointsPageWidgetModel(MapPointsPageModel());
}

// TODO: cover with documentation
/// Default widget model for MapPointsPageWidget
class MapPointsPageWidgetModel
    extends WidgetModel<MapPointsPageWidget, MapPointsPageModel>
    with ThemeProvider
    implements IMapPointsPageWidgetModel {
  MapPointsPageWidgetModel(MapPointsPageModel model) : super(model);

  final _pointsController = BehaviorSubject<Set<MapObjectPoint>>();

  StreamSubscription? _pointSubscription;

  final _nameController = TextEditingController();

  Set<MapObjectPoint> _pointes = {};
  Polygon? _polygon;

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    _setupListener();
    _nameController.text = 'Зона #${UniqueKey().hashCode}';
  }

  @override
  void didUpdateWidget(MapPointsPageWidget oldWidget) {
    _setupListener();
    super.didUpdateWidget(oldWidget);
  }

  void _setupListener() {
    _pointSubscription?.cancel();
    _pointSubscription = widget.mapStreem.listen(_addPoint);
  }

  @override
  void createOrder() {}

  @override
  Future<void> edit() async {
    await showModalBottomSheet<int>(
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      isDismissible: true,
      constraints: const BoxConstraints.expand(width: 500, height: 600),
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const DraggableLine(),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: StreamBuilder(
                  stream: _pointsController,
                  builder: (context, snapshot) {
                    final sattelites = snapshot.data?.toList() ?? [];

                    if (sattelites.length < 3) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Image.asset('assets/images/logo_large.png'),
                          ),
                          const SizedBox(height: 10),
                          Expanded(
                            child: Text(
                              'Выберите от трех точек, для формирования зоны',
                              style: textTheme.bodyLarge
                                  ?.copyWith(color: colorScheme.onSurface),
                            ),
                          )
                        ],
                      );
                    }

                    return StatefulBuilder(
                      builder: (context, setState) {
                        return ListView.separated(
                          itemCount: sattelites.length + 2,
                          itemBuilder: (context, index) {
                            if (index == 0) {
                              return TextField(
                                controller: _nameController,
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: theme.colorScheme.onBackground,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Имя зоны',
                                ),
                              );
                            }

                            if (index == sattelites.length + 1) {
                              return AnimatedBuilder(
                                  animation: _nameController,
                                  builder: (context, _) {
                                    final hasText =
                                        _nameController.text.isNotEmpty;
                                    return OutlinedButton(
                                      onPressed: hasText ? _submit : null,
                                      child: Text('Оформить'),
                                    );
                                  });
                            }

                            final sattelite = sattelites[index - 1];
                            var lon = sattelite.points.lon;
                            var lat = sattelite.points.lat;
                            return ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: Text('Lat: $lat; Lon: $lon'),
                              trailing: IconButton(
                                onPressed: () => _removePoint(sattelite),
                                icon: const Icon(Icons.delete),
                              ),
                            );
                          },
                          separatorBuilder: (_, index) {
                            if (index == 0) {
                              return const SizedBox(height: 10);
                            }
                            return const Divider();
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void close() {
    final controller = widget.mapOverlayController;
    controller.pop();
    controller.show(MapLayers.add);
  }

  void _addPoint(MapPoint event) {
    var tmp = widget.mapObjectController.valueOrNull ?? {};
    var mapObjectPoint = MapObjectPoint(
      id: MapsObjectId(
        event.toString(),
      ),
      points: event,
    );
    mapObjectPoint = mapObjectPoint.copyWith(
      onDragStart: (p) => _editPoint(p, mapObjectPoint),
      onDrag: (p) => _editPoint(p, mapObjectPoint),
      onDragEnd: (p) => _editPoint(p, mapObjectPoint),
    );

    final nextPointes = Set.of(_pointes);
    nextPointes.add(mapObjectPoint);
    _pointes = nextPointes;
    tmp.add(mapObjectPoint);

    _renewPolygon(tmp, nextPointes);
    _pointsController.add(nextPointes);
    widget.mapObjectController.add(tmp);
  }

  void _renewPolygon(Set<MapObject> tmp, Set<MapObjectPoint> nextPointes) {
    tmp.remove(_polygon);
    _polygon = null;
    if (_pointes.length >= 3) {
      var p = Polygon(
        id: MapsObjectId(UniqueKey().hashCode.toString()),
        polygone: nextPointes.map((p) => p.points).toList(),
        fill: Colors.green.withOpacity(0.2),
        stroke: Colors.green,
        width: 2,
      );
      tmp.add(p);
      _polygon = p;
    }
  }

  void _editPoint(MapPoint point, MapObjectPoint obj) {
    print('drag');
    var tmp = widget.mapObjectController.valueOrNull ?? {};
    final nextPointes = Set.of(_pointes);
    tmp.remove(obj);
    nextPointes.remove(obj);
    var edited = obj.copyWith(
      points: point,
    );
    edited = edited.copyWith(
      onDragStart: (p) => _editPoint(p, edited),
      onDrag: (p) => _editPoint(p, edited),
      onDragEnd: (p) => _editPoint(p, edited),
    );
    tmp.add(edited);
    nextPointes.add(edited);
    _pointes = nextPointes;
    _renewPolygon(tmp, nextPointes);

    _pointsController.add(nextPointes);
    widget.mapObjectController.add(tmp);
  }

  void _removePoint(MapObjectPoint obj) {
    var tmp = widget.mapObjectController.valueOrNull ?? {};
    final nextPointes = Set.of(_pointes);
    tmp.remove(obj);
    nextPointes.remove(obj);
    _pointes = nextPointes;
    _renewPolygon(tmp, nextPointes);

    _pointsController.add(nextPointes);
    widget.mapObjectController.add(tmp);
  }

  @override
  void dispose() {
    var tmp = widget.mapObjectController.valueOrNull ?? {};
    tmp = tmp.difference(_pointes);
    tmp.remove(_polygon);
    widget.mapObjectController.add(tmp);
    _pointSubscription?.cancel();
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (AppComponents().profileUseCase.profile.valueOrNull?.email == null) {
      router.root.navigatorKey.currentContext
          ?.showSnackBar('Необходимо авторизоваться');
    }

    final s = AppComponents().geozonesService;
    final zones = await s.postZones(request:
      Geozone(
        name: _nameController.text,
        wkt: <List<List<double>>>[
          _pointes.map((p) => p.points).map((e) => [e.lat, e.lon]).toList()
        ],
      ),
    );

    final id = zones.id;
    if (id == null) {
      context.showSnackBar('Не удалось создать зону');
      return;
    }

    router.pop();
    close();
    router.push(OrderingRoute(zoneId: id));
  }

  void _editSheet() {}
}
