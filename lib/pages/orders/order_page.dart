import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:satellite_app/domain/entity/order/order.dart';
import 'package:satellite_app/internal/app_components.dart';

@RoutePage()
class OrdersPageWidget extends StatefulWidget {
  const OrdersPageWidget({super.key});

  @override
  State<OrdersPageWidget> createState() => _OrdersPageWidgetState();
}

class _OrdersPageWidgetState extends State<OrdersPageWidget> {
  late final _orders = AppComponents().orderService.getOrders();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Заказы'),
      ),
      body: Center(
        child: SizedBox(
          width: 600,
          child: FutureBuilder(
            future: _orders,
            builder: (context, snap) {
              final orders = snap.data;

              if (orders == null) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/logo_large.png'),
                    SizedBox(height: 10),
                    Text('Заказов пока нет:(')
                  ],
                );
              }
              return Container();
             /* return OrientationBuilder(
                builder: (context,orie),
              );*/
            },
          ),
        ),
      ),
    );
  }
}

@RoutePage()
class OrderViewPageWidget extends StatefulWidget {
  const OrderViewPageWidget({
    super.key,
    required this.order,
  });

  final Order order;

  @override
  State<OrderViewPageWidget> createState() => _OrderViewPageWidgetState();
}

class _OrderViewPageWidgetState extends State<OrderViewPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
