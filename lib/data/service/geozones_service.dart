import 'dart:async';

import 'package:dio/dio.dart';
import 'package:satellite_app/domain/entity/geozones/geozone.dart';
import 'package:retrofit/http.dart';

part 'geozones_service.g.dart';

@RestApi()
abstract class GeozonesService {
  factory GeozonesService(Dio dio, {String baseUrl}) = _GeozonesService;

  @GET('/geozones/deprecated/')
  Future<List<Geozone>> getDeprecated();

  @GET('/geozones/zones/')
  Future<List<Geozone>> getZones();

}
