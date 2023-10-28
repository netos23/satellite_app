// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geozone.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GeozoneImpl _$$GeozoneImplFromJson(Map<String, dynamic> json) =>
    _$GeozoneImpl(
      id: json['id'] as int?,
      name: json['name'] as String,
      wkt: (json['wkt'] as List<dynamic>)
          .map((e) => (e as List<dynamic>)
              .map((e) => (e as List<dynamic>)
                  .map((e) => (e as num).toDouble())
                  .toList())
              .toList())
          .toList(),
    );

Map<String, dynamic> _$$GeozoneImplToJson(_$GeozoneImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'wkt': instance.wkt,
    };
