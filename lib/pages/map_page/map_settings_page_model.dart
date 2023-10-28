import 'package:dio/dio.dart';
import 'package:elementary/elementary.dart';
import 'package:satellite_app/data/service/geozones_service.dart';
import 'package:satellite_app/data/service/satellite_service.dart';
import 'package:satellite_app/domain/entity/geozones/geozone.dart';

// TODO: cover with documentation
/// Default Elementary model for MapSettingsPage module
class MapSettingsPageModel extends ElementaryModel {
  MapSettingsPageModel(
    this._geozonesService,
  );

  final GeozonesService _geozonesService;

  Future<List<Geozone>> getDeprecated() async {
    try {
      final result = await _geozonesService.getDeprecated();
      return result;
    } on DioException catch (error) {
      throw Exception(
        error.response?.data['message'],
      );
    }
  }

  Future<List<Geozone>> getZones() async {
    try {
      final result = await _geozonesService.getZones();
      return result;
    } on DioException catch (error) {
      throw Exception(
        error.response?.data['message'],
      );
    }
  }

  @override
  Future<List<Geozone>> postDeprecated({
    required List<Geozone> request,
  }) async {
    try {
      final result = await _geozonesService.postDeprecated(request: request);
      return result;
    } on DioException catch (error) {
      throw Exception(
        error.response?.data['message'],
      );
    }
  }

  @override
  Future<Geozone> postZones({required Geozone request}) async {
    try {
      final result = await _geozonesService.postZones(request: request);
      return result;
    } on DioException catch (error) {
      throw Exception(
        error.response?.data['message'],
      );
    }
  }


}
