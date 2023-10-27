import 'package:freezed_annotation/freezed_annotation.dart';

part 'satellite.freezed.dart';
part 'satellite.g.dart';

@freezed
class Satellite with _$Satellite {
    factory Satellite({
      required String id,
      required String name,
      required String picture,
      required double resolution,
}) = _Satellite;

    factory Satellite.fromJson(Map<String, dynamic> json) => _$SatelliteFromJson(json);
}