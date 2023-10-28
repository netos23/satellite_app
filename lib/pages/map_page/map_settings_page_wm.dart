import 'package:elementary/elementary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:satellite_app/domain/entity/geozones/geozone.dart';
import 'package:satellite_app/domain/entity/satellite/satellite_dto.dart';
import 'package:satellite_app/internal/app_components.dart';
import 'package:satellite_app/pages/map_page/map_controller.dart';
import 'package:satellite_app/pages/map_page/map_objects.dart';
import 'package:satellite_app/util/wm_extensions.dart';

import 'map_settings_page_model.dart';
import 'map_settings_page_widget.dart';

abstract class IMapSettingsPageWidgetModel extends IWidgetModel
    implements IThemeProvider {
  Future<void> openSettings();

  void zoomIn();

  void zoomOut();

  BehaviorSubject<bool> get deprecatedZonesController;

  BehaviorSubject<bool> get publicZonesController;

  BehaviorSubject<bool> get dayZonesController;
}

MapSettingsPageWidgetModel defaultMapSettingsPageWidgetModelFactory(
    BuildContext context) {
  return MapSettingsPageWidgetModel(MapSettingsPageModel(
    AppComponents().geozonesService,
  ));
}

// TODO: cover with documentation
/// Default widget model for MapSettingsPageWidget
class MapSettingsPageWidgetModel
    extends WidgetModel<MapSettingsPageWidget, MapSettingsPageModel>
    with ThemeProvider
    implements IMapSettingsPageWidgetModel {
  MapSettingsPageWidgetModel(MapSettingsPageModel model) : super(model);

  MapController? get _controller => widget.controller?.call();

  @override
  final deprecatedZonesController = BehaviorSubject<bool>.seeded(true);
  @override
  final publicZonesController = BehaviorSubject<bool>.seeded(true);
  @override
  final dayZonesController = BehaviorSubject<bool>.seeded(false);

  @override
  final allSattelitesController = BehaviorSubject<List<SatelliteDto>>();

  Set<MapObject>? _deprecatedZones;
  Set<MapObject>? _publicZones;
  Set<MapObject>? _satelliteActive;
  Set<MapObject>? _lastSatelliteActive;
  List<SatelliteDto>? _satellite;
  Set<int> _ids = {};

  @override
  void initWidgetModel() {
    super.initWidgetModel();

    _applyTransforms();
    loadSatellite();
  }

  Future<void> _applyTransforms() async {
    var tmp = widget.mapObjectController.valueOrNull ?? {};
    tmp = Set.of(tmp);

    tmp = await _applyDeprecatedZones(tmp);
    tmp = await _applyPublicZones(tmp);
    tmp = await _applySattelitesZones(tmp);

    widget.mapObjectController.add(tmp);
  }

  Future<Set<MapObject>> _applyDeprecatedZones(Set<MapObject> buffer) async {
    await loadDeprecatedZones();
    final enabled = deprecatedZonesController.valueOrNull ?? false;
    final points = _deprecatedZones;
    if (points == null) {
      return buffer;
    }
    if (enabled) {
      return buffer.union(points);
    } else {
      return buffer.difference(points);
    }
  }

  Future<Set<MapObject>> _applyPublicZones(Set<MapObject> buffer) async {
    await _loadPublicZones();
    final enabled = publicZonesController.valueOrNull ?? false;
    final points = _publicZones;
    if (points == null) {
      return buffer;
    }
    if (enabled) {
      return buffer.union(points);
    } else {
      return buffer.difference(points);
    }
  }

  Future<Set<MapObject>> _applySattelitesZones(Set<MapObject> buffer) async {
    final last = _lastSatelliteActive ?? {};
    var tmp = buffer.difference(last);
    final cur = _satelliteActive ?? {};
    tmp = tmp.union(cur);
    _lastSatelliteActive = null;
    return tmp;
  }

  @override
  Future<void> openSettings() async {
    await showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      constraints: BoxConstraints.expand(width: 500, height: 350),
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
          ),
          child: Column(
            children: [
              const DraggableLine(),
              const SizedBox(
                height: 10,
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text('Границы ночи:'),
                trailing: StreamBuilder(
                  stream: dayZonesController,
                  builder: (context, snapshot) {
                    final enabled = snapshot.data ?? false;
                    return CupertinoSwitch(
                      activeColor: colorScheme.primary,
                      value: enabled,
                      onChanged: null,
                      // onChanged: switchNigth,
                    );
                  },
                ),
              ),
              const Divider(),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text('Запрещенные зоны:'),
                trailing: StreamBuilder(
                  stream: deprecatedZonesController,
                  builder: (context, snapshot) {
                    final enabled = snapshot.data ?? false;
                    return CupertinoSwitch(
                      activeColor: colorScheme.primary,
                      value: enabled,
                      onChanged: switchDeprecated,
                    );
                  },
                ),
              ),
              const Divider(),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text('Публичные зоны:'),
                trailing: StreamBuilder(
                  stream: publicZonesController,
                  builder: (context, snapshot) {
                    final enabled = snapshot.data ?? false;
                    return CupertinoSwitch(
                      activeColor: colorScheme.primary,
                      value: enabled,
                      onChanged: switchPublic,
                    );
                  },
                ),
              ),
              const Divider(),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text('Спутники:'),
                onTap: openSattelites,
                trailing: Icon(
                  Icons.navigate_next,
                ),
              ),
            ],
          ),
        );
      },
    );
    await _applyTransforms();
  }

  void switchNigth(bool val) {
    dayZonesController.add(val);
  }

  void switchDeprecated(bool val) {
    deprecatedZonesController.add(val);
  }

  void switchPublic(bool val) {
    publicZonesController.add(val);
  }

  Future<void> loadDeprecatedZones() async {
    if (_deprecatedZones != null) {
      return;
    }
    final zones = await model.getDeprecated();
    _deprecatedZones = _mapPolygones(zones, colorScheme.error);
  }

  Future<void> loadSatellite() async {
    if (_satellite != null) {
      return;
    }
    final zones = await AppComponents().satelliteService.getSatellites();
    _satellite = zones;
    allSattelitesController.add(zones);
  }

  Future<void> _loadPublicZones() async {
    if (_publicZones != null) {
      return;
    }
    final zones = await model.getZones();

    _publicZones = _mapPolygones(zones, colorScheme.tertiary);
  }

  Set<Polygon> _mapPolygones(List<Geozone> zones, Color color) {
    return zones
        .expand((z) => z.wkt)
        .map((p) {
          return p.map((e) {
            if (e.length != 2) {
              return null;
            }
            return MapPoint(lat: e[1], lon: e[0]);
          }).whereType<MapPoint>();
        })
        .map(
          (e) => Polygon(
            id: MapsObjectId(e.hashCode.toString()),
            fill: color.withOpacity(0.5),
            stroke: color,
            width: 1,
            polygone: e.toList(),
          ),
        )
        .toSet();
  }

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

  @override
  void dispose() {
    allSattelitesController.close();
    deprecatedZonesController.close();
    publicZonesController.close();
    dayZonesController.close();
    super.dispose();
  }

  Future<void> openSattelites() async {
    var service = AppComponents().satelliteService;

    await showModalBottomSheet<int>(
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      isDismissible: true,
      constraints: BoxConstraints.expand(width: 500, height: 600),
      builder: (_) {
        return Column(
          children: [
            const DraggableLine(),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: StreamBuilder(
                stream: allSattelitesController,
                builder: (context, snapshot) {
                  final sattelites = snapshot.data ?? [];

                  if (sattelites.isEmpty) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/logo_large.png'),
                        SizedBox(height: 10),
                        Text('Спутников пока нет:(')
                      ],
                    );
                  }

                  return StatefulBuilder(
                    builder: (context, setState) {
                      return ListView.separated(
                        itemCount: sattelites.length,
                        itemBuilder: (context, index) {
                          final sattelite = sattelites[index];
                          return CheckboxListTile(
                            title: Text(sattelite.name),
                            value: _ids.contains(sattelite.id),
                            onChanged:
                                _ids.contains(sattelite.id) || _ids.length <= 10
                                    ? (value) {
                                        setState(() {
                                          if (_ids.contains(sattelite.id)) {
                                            _ids.remove(sattelite.id);
                                          } else {
                                            _ids.add(sattelite.id);
                                          }
                                        });
                                      }
                                    : null,
                          );
                        },
                        separatorBuilder: (_, __) => const Divider(),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        );
      },
    );

    _lastSatelliteActive = _satelliteActive;

    _satelliteActive = {};
    final colors = [
      colorScheme.primary,
      colorScheme.secondary,
      colorScheme.tertiary,
      Colors.yellowAccent,
      Colors.deepOrange,
      Colors.green,
      Colors.purple,
      Colors.red,
      Colors.greenAccent,
      Colors.blue,
    ].iterator;
    colors.moveNext();
    for (int id in _ids) {
      final points = await service.getSatellitesPoints(
        id,
      );
      final mapPoints =
          points.map((e) => MapPoint(lat: e.lat, lon: e.lon)).toList();
      var c = colors.current;
      colors.moveNext();
      _satelliteActive!.add(
        Polyline(
          id: MapsObjectId(id.toString()),
          points: mapPoints,
          stroke: c,
          width: 3,
        ),
      );
    }

    _applyTransforms();
  }
}
