import 'package:freezed_annotation/freezed_annotation.dart';

part 'plugin_dto.freezed.dart';
part 'plugin_dto.g.dart';

@freezed
class PluginDto with _$PluginDto {
    factory PluginDto({
      required int id,
      required String name,
      required String link,
      String? picture,
      String? description,
      @JsonKey(name: 'per_photo')
      double? perPhoto,

}) = _PluginDto;

    factory PluginDto.fromJson(Map<String, dynamic> json) => _$PluginDtoFromJson(json);
}