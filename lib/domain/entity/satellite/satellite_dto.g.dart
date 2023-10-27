// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'satellite_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SatelliteImpl _$$SatelliteImplFromJson(Map<String, dynamic> json) =>
    _$SatelliteImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      picture: json['picture'] as String,
      resolution: (json['resolution'] as num).toDouble(),
    );

Map<String, dynamic> _$$SatelliteImplToJson(_$SatelliteImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'picture': instance.picture,
      'resolution': instance.resolution,
    };
