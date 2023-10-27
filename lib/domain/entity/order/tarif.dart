import 'package:freezed_annotation/freezed_annotation.dart';

part 'tarif.freezed.dart';
part 'tarif.g.dart';

@freezed
class Tarif with _$Tarif {
    factory Tarif({
      required int id,
      required String name,
      required String description,
      @JsonKey(name: "base_price")
      required double basePrice,
      @JsonKey(name: 'per_photo')
      required double perPhoto,
      String? picture,
    }) = _Tarif;

    factory Tarif.fromJson(Map<String, dynamic> json) => _$TarifFromJson(json);
}