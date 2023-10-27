import 'package:dio/dio.dart';
import 'package:satellite_app/data/service/geozones_service.dart';
import 'package:satellite_app/domain/entity/geozones/geozone.dart';

class GeozonesRepository {
  GeozonesRepository(
    this._geozonesService,
  );

  final GeozonesService _geozonesService;

  @override
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

  @override
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
  Future<List<Geozone>> postZones({required List<Geozone> request}) async {
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
