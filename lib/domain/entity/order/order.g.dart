// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderImpl _$$OrderImplFromJson(Map<String, dynamic> json) => _$OrderImpl(
      dateBegin: json['date_begin'] as String,
      dateEnd: json['date_end'] as String,
      user: json['user'] as int?,
      price: (json['price'] as num?)?.toDouble(),
      satellites:
          (json['satellites'] as List<dynamic>).map((e) => e as int).toList(),
      status: json['status'] as int?,
      geozone: json['geozone'] as int,
      tarif: json['tarif'] as int,
      plugins: (json['plugins'] as List<dynamic>).map((e) => e as int).toList(),
      createdAt: json['created_at'] as String?,
      id: json['id'] as int?,
    );

Map<String, dynamic> _$$OrderImplToJson(_$OrderImpl instance) =>
    <String, dynamic>{
      'date_begin': instance.dateBegin,
      'date_end': instance.dateEnd,
      'user': instance.user,
      'price': instance.price,
      'satellites': instance.satellites,
      'status': instance.status,
      'geozone': instance.geozone,
      'tarif': instance.tarif,
      'plugins': instance.plugins,
      'created_at': instance.createdAt,
      'id': instance.id,
    };
