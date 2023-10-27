import 'package:freezed_annotation/freezed_annotation.dart';

part 'satellite_dto.freezed.dart';
part 'satellite_dto.g.dart';

@freezed
class SatelliteDto with _$SatelliteDto {
    factory SatelliteDto({
      required int id,
      required String name,
      required String picture,
      required double resolution,
}) = _Satellite;

    factory SatelliteDto.fromJson(Map<String, dynamic> json) => _$SatelliteDtoFromJson(json);
}