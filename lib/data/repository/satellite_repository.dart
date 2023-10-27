import 'package:dio/dio.dart';
import 'package:satellite_app/data/service/satellite_service.dart';
import 'package:satellite_app/domain/entity/satellite/satellite.dart';

class SatelliteRepository {
  SatelliteRepository(
      this._satelliteService,
      );
  final SatelliteService _satelliteService;

  @override
  Future<List<Satellite>> getSatellite() async {
    try {
      final result = await _satelliteService.getSatellites();
      return result;
    } on DioException catch (error) {
      throw Exception(
        error.response?.data['message'],
      );
    }
  }
}
