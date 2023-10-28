import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:satellite_app/domain/entity/order/order.dart';
import 'package:satellite_app/domain/models/profile.dart';
import 'package:satellite_app/internal/app_components.dart';
import 'package:satellite_app/router/app_router.dart';

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
          width: 1000,
          child: FutureBuilder(
            future: _orders,
            builder: (context, snap) {
              final orders = snap.data;

              if (orders == null) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        flex: 4,
                        child: Image.asset('assets/images/logo_large.png')),
                    Expanded(flex: 4, child: SizedBox(height: 10)),
                    Flexible(child: CircularProgressIndicator())
                  ],
                );
              }

              if (orders.isEmpty) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        flex: 4,
                        child: Image.asset('assets/images/logo_large.png')),
                    Expanded(flex: 4, child: SizedBox(height: 10)),
                    Expanded(child: Text('Заказов пока нет:('))
                  ],
                );
              }

              return OrientationBuilder(
                builder: (context, orientation) {
                  final delegate = switch (orientation) {
                    Orientation.portrait =>
                      const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                    // TODO: Handle this case.
                    Orientation.landscape =>
                      const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 250,
                      ),
                  };

                  return GridView.builder(
                    gridDelegate: delegate,
                    itemCount: orders.length,
                    itemBuilder: (context, index) {
                      final order = orders[index];
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: InkWell(
                          onTap: () => context.router.push(
                            OrderViewRoute(order: order),
                          ),
                          child: Column(
                            children: [
                              Flexible(
                                flex: 6,
                                child: Image.network(
                                  'https://sensaciy.net/wp-content/uploads/2022/03/15_%D0%BD%D0%B0%D1%86%D0%B8%D0%BE%D0%BD%D0%B0%D0%BB%D1%8C%D0%BD%D0%B0%D1%8F_%D1%80%D0%BE%D1%81%D1%81%D0%B8%D0%B9%D1%81%D0%BA%D0%B0%D1%8F_%D1%81%D1%82%D0%B0%D0%BD%D1%86%D0%B8%D1%8F.jpg',
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                              Flexible(
                                flex: 3,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  child: ListTile(
                                    contentPadding: EdgeInsets.zero,
                                    title: Text('Заказ: №${order.id}'),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              );
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
  late final _order = AppComponents().orderService.getOrder(
        widget.order.id ?? 0,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Заказ №${widget.order.id}'),
      ),
      body: Center(
        child: SizedBox(
          width: 600,
          child: FutureBuilder(
              future: _order,
              builder: (context, snap) {
                final order = snap.data;

                if (order == null) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          flex: 4,
                          child: Image.asset('assets/images/logo_large.png')),
                      Expanded(flex: 4, child: SizedBox(height: 10)),
                      Flexible(child: CircularProgressIndicator())
                    ],
                  );
                }

                return ListView(
                  children: [
                    _SettingsCard(
                      order: order,
                    ),
                    if (DateTime.parse(order.dateEnd)
                            .compareTo(DateTime.now()) <=
                        0)
                      FilledButton(
                        onPressed: () async {
                          final url = await AppComponents().orderService.getPay(
                                PaymentId(
                                  id: order.id ?? 0,
                                ),
                              );
                          context.router.push(
                            WebViewerRoute(
                              title: 'Оплата заказа',
                              url: url.url,
                            ),
                          );
                        },
                        child: Text('Оплатить'),
                      ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}

class _SettingsCard extends StatelessWidget {
  const _SettingsCard({
    super.key,
    required this.order,
  });

  final Order order;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'Настройки съемки:',
            ),
            ListTile(
              title: const Text('Дата начала'),
              trailing: Text(order.dateBegin),
            ),
            ListTile(
              title: const Text('Дата окончания'),
              trailing: Text(order.dateEnd),
            ),
          ],
        ),
      ),
    );
  }
}
