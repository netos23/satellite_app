import 'package:freezed_annotation/freezed_annotation.dart';

part 'satellite.freezed.dart';
part 'satellite.g.dart';

@freezed
class Satellite with _$Satellite {
    factory Satellite({
      required int id,
      required String name,
      required String picture,
      required double resolution,
      required bool isSelected,
}) = _Satellite;

    factory Satellite.fromJson(Map<String, dynamic> json) => _$SatelliteFromJson(json);
}