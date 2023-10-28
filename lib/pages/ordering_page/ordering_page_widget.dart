import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:satellite_app/domain/entity/order/tarif.dart';
import 'package:satellite_app/domain/models/plugin.dart';
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
          body: SizedBox(
            width: 600,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView(
                shrinkWrap: true,
                children: [
                  _ProfileCard(model: wm, theme: theme),
                  const SizedBox(
                    height: 16,
                  ),
                  _SettingsCard(model: wm, theme: theme),
                  const SizedBox(
                    height: 16,
                  ),
                  _SatelliteGrid(model: wm, theme: theme),
                  const SizedBox(
                    height: 16,
                  ),
                  _TarifList(model: wm, theme: theme),
                  const SizedBox(
                    height: 16,
                  ),
                  _PlaginSlider(model: wm, theme: theme),
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Text(
                          'От',
                          style: theme.textTheme.titleLarge,
                        ),
                        const Spacer(),
                        Text(
                          '30 000 ₽',
                          style: theme.textTheme.titleLarge,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: SizedBox(
                      height: 50,
                      child: FilledButton(
                        style: theme.filledButtonTheme.style?.copyWith(
                          fixedSize: const MaterialStatePropertyAll(
                            Size.fromHeight(50),
                          ),
                        ),
                        onPressed: wm.orderCreate,
                        child: const Center(
                          child: Text('Оформить'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
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
            StreamBuilder<DateTime>(
              stream: model.startDate,
              builder: (context, snapshot) {
                final startdate = snapshot.hasData ? snapshot.data : DateTime.now();
                return StreamBuilder<DateTime>(
                    stream: model.secondDate,
                    builder: (context, snapshot) {
                    return GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () async {
                        final newDate = await showDateDialog(context, startdate);
                        if (newDate != null) {
                          model.startDate.add(newDate);
                        }
                      },
                      child: Row(
                        children: [
                          const Text('Дата начала'),
                          const Spacer(),
                          Text(DateFormat('yyyy-MM-dd').format(startdate!),),
                          const SizedBox(width: 8,),
                          const Icon(Icons.settings_outlined),
                        ],
                      ),
                    );
                  }
                );
              }
            ),
            StreamBuilder<DateTime>(
              stream: model.secondDate,
              builder: (context, snapshot) {
                final startdate = snapshot.hasData ? snapshot.data : DateTime.now();
                final endDate = snapshot.hasData ? snapshot.data : startdate;
                return GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () async {
                    final newDate = await showDateDialog(context, endDate, startdate);
                    if (newDate != null) {
                      model.secondDate.add(newDate);
                    }                  },
                  child: Row(
                    children: [
                      const Text('Дата окончания:'),
                      const Spacer(),
                      Text(DateFormat('yyyy-MM-dd').format(endDate!),),
                      const SizedBox(width: 8,),
                      const Icon(Icons.settings_outlined),
                    ],
                  ),
                );
              }
            ),
            const Text('Количество мегапикселей:'),
            StreamBuilder<RangeValues>(
                stream: model.rangeValuesController,
                builder: (context, snapshot) {
                  final values = snapshot.hasData
                      ? snapshot.data
                      : const RangeValues(0.1, 5);
                  return Column(
                    children: [
                      Row(
                        children: [
                          Text(values!.start.toStringAsFixed(2)),
                          const Spacer(),
                          Text(values.end.toStringAsFixed(2)),
                        ],
                      ),
                      RangeSlider(
                        values: values,
                        max: 5,
                        labels: RangeLabels(
                          values.start.toStringAsFixed(2),
                          values.end.toStringAsFixed(2),
                        ),
                        min: 0.1,
                        onChanged: (RangeValues values) {
                          if (values.start < values.end) {
                            model.rangeValuesController.add(values);
                          }
                        },
                      ),
                    ],
                  );
                }),
          ],
        ),
      ),
    );
  }

  Future<DateTime?> showDateDialog(BuildContext context, DateTime value, [DateTime? initial]) async {
    return await showDatePicker(
      context: context,
      initialDate: value,
      firstDate: initial ?? DateTime.now(),
      lastDate: DateTime(2025),
    );
  }
}

class _TarifList extends StatelessWidget {
  const _TarifList({
    required this.model,
    required this.theme,
  });

  final IOrderingPageWidgetModel model;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Выбор тарифа',
          style: theme.textTheme.bodyLarge,
        ),
        StreamBuilder<List<Tarif>>(
          stream: model.tarifsController,
          initialData: const [],
          builder: (context, snapshot) {
            final tarifs = snapshot.hasData ? snapshot.data : <Tarif>[];
            final width = MediaQuery.of(context).size.width - 32;
            return StreamBuilder<int>(
                stream: model.selectedTarifController,
                initialData: -1,
                builder: (context, snapshot) {
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    //TODO allert null!
                    itemCount: tarifs?.length ?? 0,
                    itemBuilder: (context, index) {
                      final tarif = tarifs?[index];
                      final selectedTarif =
                          model.selectedTarifController.valueOrNull ?? -1;
                      if (tarif == null) return const SizedBox.shrink();
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          color: selectedTarif == tarif.id
                              ? theme.primaryColor
                              : null,
                          clipBehavior: Clip.antiAlias,
                          child: InkWell(
                            onTap: () => model.selectedTarif(tarif),
                            child: SizedBox(
                              height: width * 0.4,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      flex: 10,
                                      child: Image.network(
                                        tarif.picture ?? '',
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ),
                                    const Spacer(),
                                    Flexible(
                                        flex: 12,
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Column(
                                            children: [
                                              Text(tarif.name),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              Row(
                                                children: [
                                                  const Text('Базовая цена:'),
                                                  const Spacer(),
                                                  Text(tarif.basePrice
                                                          .toString()),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  const Text('Цена за фото:'),
                                                  const Spacer(),
                                                  Text(tarif.perPhoto
                                                          .toString()),
                                                ],
                                              ),
                                              const Spacer(),
                                              Text(
                                                tarif.description,
                                                maxLines: 2,
                                              ),
                                            ],
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                });
          },
        ),
      ],
    );
  }
}

class _PlaginSlider extends StatelessWidget {
  const _PlaginSlider({
    required this.model,
    required this.theme,
  });

  final IOrderingPageWidgetModel model;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Выбор плагина',
          style: theme.textTheme.bodyLarge,
        ),
        StreamBuilder<List<Plugin>>(
            stream: model.pluginController,
            initialData: const [],
            builder: (context, snapshot) {
              final width = MediaQuery.of(context).size.width;
              final plugins = snapshot.hasData ? snapshot.data : <Plugin>[];
              return SizedBox(
                height: width * 0.4,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: plugins?.length ?? 0,
                  itemBuilder: (context, index) {
                    final plugin = plugins?[index];
                    if (plugin == null) {
                      return const SizedBox.shrink();
                    }
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color:
                          plugin.isSelected == true ? theme.primaryColor : null,
                      clipBehavior: Clip.antiAlias,
                      child: InkWell(
                        onTap: () => model.selectPlugin(plugin),
                        child: Column(
                          children: [
                            Flexible(
                              flex: 8,
                              child: Image.network(plugin.picture ?? ''),
                            ),
                            Flexible(
                              flex: 2,
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    plugin.name,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const Icon(Icons.settings_outlined),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            }),
      ],
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
    return Column(
      children: [
        Text(
          'Выбор cпутников',
          style: theme.textTheme.bodyLarge,
        ),
        StreamBuilder<List<Satellite>>(
          stream: model.satelliteController,
          initialData: const [],
          builder: (context, snapshot) {
            final cardWidth = MediaQuery.of(context).size.width / 2;
            final satellites = snapshot.hasData ? snapshot.data : [];
            if (satellites == null) {
              return SizedBox(
                height: (cardWidth - 32) * 17 / 16,
              );
            }
            return StreamBuilder<List<Satellite>>(
                stream: model.satelliteController,
                initialData: const [],
                builder: (context, snapshot) {
                  return GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
                      childAspectRatio: 16 / 17,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    shrinkWrap: true,
                    itemCount: satellites.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _SatelliteCard(
                          value: satellites[index], model: model, theme: theme);
                    },
                  );
                });
          },
        ),
      ],
    );
  }
}

class _SatelliteCard extends StatelessWidget {
  const _SatelliteCard({
    required this.value,
    required this.model,
    required this.theme,
  });

  final Satellite value;
  final IOrderingPageWidgetModel model;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => model.selectSatellite(value),
        child: Column(
          children: [
            Flexible(
              flex: 6,
              child: Image.network(
                value.picture,
                fit: BoxFit.fitHeight,
              ),
            ),
            Flexible(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Text('Разрешение'),
                        const Spacer(),
                        Text('${value.resolution} МП'),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Text(
                          value.name,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const Spacer(),
                        Container(
                          height: 22,
                          width: 22,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: theme.primaryColor,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Visibility(
                            visible: value.isSelected,
                            child: const Icon(
                              Icons.check,
                              size: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
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
