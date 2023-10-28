// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'satellite_point_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SatellitePointDtoImpl _$$SatellitePointDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$SatellitePointDtoImpl(
      id: json['id'] as int?,
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
    );

Map<String, dynamic> _$$SatellitePointDtoImplToJson(
        _$SatellitePointDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lat': instance.lat,
      'lon': instance.lon,
    };
