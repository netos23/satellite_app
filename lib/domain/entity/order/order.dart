import 'package:freezed_annotation/freezed_annotation.dart';

part 'order.freezed.dart';

part 'order.g.dart';

@freezed
class Order with _$Order {
  factory Order({
    required int id,
    @JsonKey(name: "date_begin")
    required String dateBegin,
    @JsonKey(name: "date_end")
    required String dateEnd,
    required double price,
    required int user,
    required List<int> satellites,
    @JsonKey(name: "created_at")
    String? createdAt,
    int? status,
    int? geozone,
    int? tarif,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}
