// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderImpl _$$OrderImplFromJson(Map<String, dynamic> json) => _$OrderImpl(
      id: json['id'] as int,
      dateBegin: json['date_begin'] as String,
      dateEnd: json['date_end'] as String,
      price: (json['price'] as num).toDouble(),
      user: json['user'] as int,
      satellites:
          (json['satellites'] as List<dynamic>).map((e) => e as int).toList(),
      createdAt: json['created_at'] as String?,
      status: json['status'] as int?,
      geozone: json['geozone'] as int?,
      tarif: json['tarif'] as int?,
    );

Map<String, dynamic> _$$OrderImplToJson(_$OrderImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date_begin': instance.dateBegin,
      'date_end': instance.dateEnd,
      'price': instance.price,
      'user': instance.user,
      'satellites': instance.satellites,
      'created_at': instance.createdAt,
      'status': instance.status,
      'geozone': instance.geozone,
      'tarif': instance.tarif,
    };
