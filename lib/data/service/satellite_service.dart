import 'dart:async';

import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:satellite_app/domain/entity/satellite/satellite_dto.dart';
import 'package:satellite_app/domain/entity/satellite/satellite_point_dto.dart';

part 'satellite_service.g.dart';

@RestApi()
abstract class SatelliteService {
  factory SatelliteService(Dio dio, {String baseUrl}) = _SatelliteService;

  @GET('/satellites/')
  Future<List<SatelliteDto>> getSatellites();

  @GET('/satellites/points')
  Future<List<SatellitePointDto>> getSatellitesPoints(
      @Query('satellite_id') int satelliteId);
}
