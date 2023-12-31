import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:satellite_app/data/repository/auth_repository.dart';
import 'package:satellite_app/data/repository/satellite_repository.dart';
import 'package:satellite_app/data/service/order_service.dart';
import 'package:satellite_app/domain/entity/geozones/geozone.dart';
import 'package:satellite_app/domain/entity/order/order.dart';
import 'package:satellite_app/domain/entity/order/tarif.dart';
import 'package:satellite_app/domain/models/plugin.dart';
import 'package:satellite_app/domain/models/profile.dart';
import 'package:satellite_app/domain/models/satellite.dart';
import 'package:satellite_app/domain/use_case/profile_use_case.dart';
import 'package:satellite_app/internal/app_components.dart';
import 'package:satellite_app/router/app_router.dart';
import 'package:satellite_app/util/snack_bar_util.dart';
import 'package:satellite_app/util/wm_extensions.dart';

import 'ordering_page_model.dart';
import 'ordering_page_widget.dart';

abstract class IOrderingPageWidgetModel extends IWidgetModel
    implements IThemeProvider {
  AuthRepository get authRepository;

  OrderService get orderService;

  SatelliteRepository get satelliteRepository;

  ProfileUseCase get profileUseCase;

  TextEditingController get firstNameController;

  TextEditingController get secondNameController;

  TextEditingController get emailController;

  TextEditingController get phoneNumberController;

  BehaviorSubject<Profile?> get profileController;

  BehaviorSubject<List<Tarif>> get tarifsController;

  BehaviorSubject<List<Satellite>> get satelliteController;

  BehaviorSubject<Order> get orderController;

  BehaviorSubject<List<Geozone>> get geozonesController;

  BehaviorSubject<List<Plugin>> get pluginController;

  BehaviorSubject<int> get selectedTarifController;

  BehaviorSubject<DateTime> get startDate;

  BehaviorSubject<DateTime> get secondDate;

  BehaviorSubject<RangeValues> get rangeValuesController;

  void selectSatellite(Satellite value);

  void selectPlugin(Plugin value);

  void orderCreate();

  void selectedTarif(Tarif? tarif);
}

OrderingPageWidgetModel defaultOrderingPageWidgetModelFactory(
    BuildContext context) {
  return OrderingPageWidgetModel(OrderingPageModel());
}

// TODO: cover with documentation
/// Default widget model for ProfilePageWidget
class OrderingPageWidgetModel
    extends WidgetModel<OrderingPageWidget, OrderingPageModel>
    with ThemeProvider
    implements IOrderingPageWidgetModel {
  OrderingPageWidgetModel(OrderingPageModel model) : super(model);
  @override
  final profileUseCase = AppComponents().profileUseCase;

  @override
  final emailController = TextEditingController();

  @override
  final firstNameController = TextEditingController();

  @override
  final profileController = BehaviorSubject();
  @override
  final startDate = BehaviorSubject();
  @override
  final secondDate = BehaviorSubject();

  @override
  final geozonesController = BehaviorSubject();

  @override
  final orderController = BehaviorSubject();

  @override
  final satelliteController = BehaviorSubject();

  @override
  final tarifsController = BehaviorSubject();

  @override
  final secondNameController = TextEditingController();

  @override
  final phoneNumberController = TextEditingController();

  @override
  final orderService = AppComponents().orderService;

  @override
  final satelliteRepository = AppComponents().satelliteRepository;

  @override
  final selectedTarifController = BehaviorSubject.seeded(1);

  @override
  final rangeValuesController =
      BehaviorSubject.seeded(const RangeValues(0.1, 5));

  @override
  final pluginController = BehaviorSubject();

  bool get isUnauthorisedUser =>
      profileUseCase.profile.valueOrNull == null ||
      (profileUseCase.profile.value!.email).isEmpty;

  bool get isClientUser => profileUseCase.profile.valueOrNull?.role != 'farmer';

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    loadSatellite();
    loadTarifs();
    loadPlugin();

    if (profileController.valueOrNull != null) {
      profileController.add(profileUseCase.profile.value);
    }

    profileUseCase.profile.stream.listen((event) {
      profileController.add(event);
    });

    if (profileUseCase.profile.valueOrNull == null) {
      profileUseCase.loadProfile();
    }

    final profile = profileUseCase.profile.valueOrNull;

    emailController.text = profile?.email ?? '';
    firstNameController.text = profile?.firstName ?? '';
    secondNameController.text = profile?.secondName ?? '';
    phoneNumberController.text = profile?.phone ?? '';
  }

  @override
  void dispose() {
    emailController.dispose();
    firstNameController.dispose();
    secondNameController.dispose();
    phoneNumberController.dispose();
    profileController.close();
    geozonesController.close();
    satelliteController.close();
    orderController.close();
    selectedTarifController.close();
    pluginController.close();
    tarifsController.close();
    startDate.close();
    secondDate.close();
    super.dispose();
  }

  Future<void> loadSatellite() async {
    final result = await satelliteRepository.getSatellite();
    satelliteController.add(result);
  }

  Future<void> loadTarifs() async {
    final result = await orderService.getTarifs();
    tarifsController.add(result);
  }

  Future<void> loadPlugin() async {
    final result = await orderService.getPlugins();
    pluginController.add(
      result
          .map(
            (e) => Plugin(
                id: e.id,
                name: e.name,
                link: e.link,
                picture: e.picture,
                perPhoto: e.perPhoto,
                isSelected: false),
          )
          .toList(),
    );
  }

  void selectTarif(int id) async {
    selectedTarifController.add(id);
  }

  @override
  void enableSatellite(int id) {
    final satellites = satelliteController.valueOrNull ?? [];
    final newSatellites = satellites
        .map((e) => e.id == id
            ? Satellite(
                id: e.id,
                name: e.name,
                picture: e.picture,
                resolution: e.resolution,
                isSelected: true)
            : e)
        .toList();
    satelliteController.add(newSatellites);
  }

  @override
  void disableSatellite(int id) {
    final satellites = satelliteController.valueOrNull ?? [];
    final newSatellites = satellites
        .map((e) => e.id == id
            ? Satellite(
                id: e.id,
                name: e.name,
                picture: e.picture,
                resolution: e.resolution,
                isSelected: false)
            : e)
        .toList();
    satelliteController.add(newSatellites);
  }

  @override
  void enablePlugin(int id) {
    final plugins = pluginController.valueOrNull ?? [];
    final newPlugins = plugins
        .map((e) => e.id == id
            ? Plugin(
                id: e.id,
                name: e.name,
                link: e.link,
                picture: e.picture,
                perPhoto: e.perPhoto,
                isSelected: true,
              )
            : e)
        .toList();
    pluginController.add(newPlugins);
  }

  @override
  void disablePlugin(int id) {
    final plugins = pluginController.valueOrNull ?? [];
    final newPlugins = plugins
        .map((e) => e.id == id
            ? Plugin(
                id: e.id,
                name: e.name,
                link: e.link,
                picture: e.picture,
                perPhoto: e.perPhoto,
                isSelected: false,
              )
            : e)
        .toList();
    pluginController.add(newPlugins);
  }

  @override
  AuthRepository authRepository = AuthRepository(
    AppComponents().authService,
  );

  @override
  Future<void> orderCreate() async {
    final profile = profileController.valueOrNull;
    final tarif = selectedTarifController.valueOrNull;
    final start = startDate.valueOrNull ?? DateTime.now();
    final end =
        startDate.valueOrNull ?? DateTime.now().add(const Duration(days: 1));
    final selectedPlugins = (pluginController.valueOrNull ?? [])
        .where((element) => element.isSelected == true)
        .toList();
    List<Satellite> checkedSatellited = satelliteController.valueOrNull ?? [];
    checkedSatellited =
        checkedSatellited.where((element) => element.isSelected).toList();
    if (profile != null && tarif != null && checkedSatellited.isNotEmpty) {
      try {
        await orderService.postOrder(
          request: Order(
            dateBegin: start != null ? start.toUtc().toString() : '',
            dateEnd: end != null ? start.toUtc().toString() : '',
            createdAt: DateTime.now().toUtc().toString(),
            satellites: checkedSatellited.map((e) => e.id).toList(),
            geozone: widget.zoneId,
            tarif: tarif,
            plugins: selectedPlugins.map((e) => e.id).toList(),
          ),
        );
        router.pop();
        context.showSnackBar('Заказ оформлен!');
      } catch (_) {}
    }
  }

  @override
  void selectPlugin(Plugin value) {
    if (value.isSelected == true) {
      disablePlugin(value.id);
    } else {
      enablePlugin(value.id);
    }
  }

  @override
  void selectSatellite(Satellite value) {
    if (value.isSelected == true) {
      disableSatellite(value.id);
    } else {
      enableSatellite(value.id);
    }
  }

  @override
  void selectedTarif(Tarif? tarif) {
    if (tarif != null) {
      selectedTarifController.add(tarif.id);
    }
    // TODO: implement selectedTarif
  }
}
