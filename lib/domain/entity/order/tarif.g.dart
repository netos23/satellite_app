// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tarif.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TarifImpl _$$TarifImplFromJson(Map<String, dynamic> json) => _$TarifImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      basePrice: (json['base_price'] as num).toDouble(),
      perPhoto: (json['per_photo'] as num).toDouble(),
      picture: json['picture'] as String?,
    );

Map<String, dynamic> _$$TarifImplToJson(_$TarifImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'base_price': instance.basePrice,
      'per_photo': instance.perPhoto,
      'picture': instance.picture,
    };
