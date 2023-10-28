// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plugin_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PluginDtoImpl _$$PluginDtoImplFromJson(Map<String, dynamic> json) =>
    _$PluginDtoImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      link: json['link'] as String,
      picture: json['picture'] as String?,
      description: json['description'] as String?,
      perPhoto: (json['per_photo'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$PluginDtoImplToJson(_$PluginDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'link': instance.link,
      'picture': instance.picture,
      'description': instance.description,
      'per_photo': instance.perPhoto,
    };
