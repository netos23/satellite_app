import 'package:freezed_annotation/freezed_annotation.dart';

part 'geozone.freezed.dart';
part 'geozone.g.dart';

@freezed
class Geozone with _$Geozone {
    factory Geozone({
      required String id,
      required String name,
      required String wkt,
}) = _Geozone;

    factory Geozone.fromJson(Map<String, dynamic> json) => _$GeozoneFromJson(json);
}