import 'package:freezed_annotation/freezed_annotation.dart';

part 'satellite_point_dto.freezed.dart';
part 'satellite_point_dto.g.dart';

@freezed
class SatellitePointDto with _$SatellitePointDto {
    factory SatellitePointDto({
     int? id,
    required double lat,
    required double lon,
}) = _SatellitePointDto;

    factory SatellitePointDto.fromJson(Map<String, dynamic> json) => _$SatellitePointDtoFromJson(json);
}