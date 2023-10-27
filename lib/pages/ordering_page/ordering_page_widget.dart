import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:satellite_app/domain/models/satellite.dart';

import 'ordering_page_wm.dart';

// TODO: cover with documentation
/// Main widget for ProfilePage module
@RoutePage()
class OrderingPageWidget extends ElementaryWidget<IOrderingPageWidgetModel> {
  const OrderingPageWidget({
    Key? key,
    WidgetModelFactory wmFactory = defaultOrderingPageWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IOrderingPageWidgetModel wm) {
    final theme = wm.theme;

    return Builder(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Оформление заказа'),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView(
              children: [
                _ProfileCard(model: wm, theme: theme),
                const SizedBox(
                  height: 16,
                ),
                _SettingsCard(model: wm, theme: theme),
                //const Spacer(),
                const SizedBox(
                  height: 16,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Выбор тарифа',
                  style: theme.textTheme.bodyLarge,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Выбор плагинов',
                  style: theme.textTheme.bodyLarge,
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: SizedBox(
                    height: 50,
                    child: FilledButton(
                      style: theme.filledButtonTheme.style?.copyWith(
                          fixedSize: const MaterialStatePropertyAll(
                              Size.fromHeight(50))),
                      onPressed: wm.orderCreate,
                      child: const Center(child: Text('Оформить')),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _SettingsCard extends StatelessWidget {
  const _SettingsCard({
    required this.model,
    required this.theme,
  });

  final IOrderingPageWidgetModel model;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text('Настройки съемки:'),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              child: const Row(
                children: [
                  Text('Дата начала'),
                  Spacer(),
                  Icon(Icons.settings_outlined),
                ],
              ),
            ),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              child: const Row(
                children: [
                  Text('Дата окончания:'),
                  Spacer(),
                  Icon(Icons.settings_outlined),
                ],
              ),
            ),
            const Text('Количество мегапикселей:'),
          ],
        ),
      ),
    );
  }
}

class _SatelliteGrid extends StatelessWidget {
  const _SatelliteGrid({
    required this.model,
    required this.theme,
  });

  final IOrderingPageWidgetModel model;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    final satellites = [];
    return Column(
      children: [
        Text(
          'Выбор cпутников',
          style: theme.textTheme.bodyLarge,
        ),
        GridView(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          children: satellites.map((e) => _SatelliteCard(value: e)).toList(),
        ),
      ],
    );
  }
}

class _SatelliteCard extends StatelessWidget {
  const _SatelliteCard({required this.value});

  final Satellite value;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _ProfileCard extends StatelessWidget {
  const _ProfileCard({
    required this.model,
    required this.theme,
  });

  final IOrderingPageWidgetModel model;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              textAlign: TextAlign.center,
              controller: model.firstNameController,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onBackground,
                overflow: TextOverflow.ellipsis,
              ),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Имя',
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextField(
              textAlign: TextAlign.center,
              controller: model.secondNameController,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onBackground,
                overflow: TextOverflow.ellipsis,
              ),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Фамилия',
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextField(
              textAlign: TextAlign.center,
              controller: model.emailController,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onBackground,
                overflow: TextOverflow.ellipsis,
              ),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextField(
              textAlign: TextAlign.center,
              controller: model.phoneNumberController,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onBackground,
                overflow: TextOverflow.ellipsis,
              ),
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Номер телефона',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
