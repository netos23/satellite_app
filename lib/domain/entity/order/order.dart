import 'package:freezed_annotation/freezed_annotation.dart';

part 'order.freezed.dart';

part 'order.g.dart';

@freezed
class Order with _$Order {
  factory Order({
    @JsonKey(name: "date_begin")
    required String dateBegin,
    @JsonKey(name: "date_end")
    required String dateEnd,
    int? user,
    double? price,
    required List<int> satellites,
    int? status,
    required int geozone,
    required int tarif,
    @JsonKey(name: "created_at")
    String? createdAt,
    int? id,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}
