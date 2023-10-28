import 'dart:async';

import 'package:auto_route/annotations.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:satellite_app/domain/entity/order/order.dart';
import 'package:satellite_app/domain/entity/order/plugin_dto.dart';
import 'package:satellite_app/domain/entity/order/tarif.dart';
import 'package:satellite_app/domain/models/profile.dart';

part 'order_service.g.dart';

@RestApi()
abstract class OrderService {
  factory OrderService(Dio dio, {String baseUrl}) = _OrderService;

  @POST('/order/')
  Future<Order> postOrder({
    @Body() required Order request,
  });

  @GET('/order/orders/')
  Future<Order> postOrders({
    @QueryParam('id') required int id,
  });

  @GET('/order/tarifs/')
  Future<List<Tarif>> getTarifs();

  @GET('/order/plugins/')
  Future<List<PluginDto>> getPlugins();

  @GET('/order/orders')
  Future<List<Order>> getOrders();

  @GET('/order/orders/{id}')
  Future<Order> getOrder(@Path('id') int id);

  @POST('/payment/pay/')
  Future<PaymetnUrl> getPay(@Body() PaymentId id);
}
