import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:satellite_app/data/repository/auth_repository.dart';
import 'package:satellite_app/data/repository/satellite_repository.dart';
import 'package:satellite_app/data/service/order_service.dart';
import 'package:satellite_app/domain/entity/geozones/geozone.dart';
import 'package:satellite_app/domain/entity/order/order.dart';
import 'package:satellite_app/domain/entity/order/tarif.dart';
import 'package:satellite_app/domain/models/profile.dart';
import 'package:satellite_app/domain/models/satellite.dart';
import 'package:satellite_app/domain/use_case/profile_use_case.dart';
import 'package:satellite_app/internal/app_components.dart';
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

  BehaviorSubject<int> get selectedTarifController;

  void orderCreate();
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
  final selectedTarifController = BehaviorSubject();

  bool get isUnauthorisedUser =>
      profileUseCase.profile.valueOrNull == null ||
      (profileUseCase.profile.value!.email).isEmpty;

  bool get isClientUser => profileUseCase.profile.valueOrNull?.role != 'farmer';

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    loadSatellite();
    loadTarifs();

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

  Future<void> selectTarif(int id) async {
    selectedTarifController.add(id);
  }

  Future<void> enableSatellite(int id) async {
    final satellites = satelliteController.valueOrNull ?? [];
    satellites
        .map((e) => e.id == id
            ? Satellite(
                id: e.id,
                name: e.name,
                picture: e.picture,
                resolution: e.resolution,
                isSelected: true)
            : e)
        .toList();
    satelliteController.add(satellites);
  }

  Future<void> disableSatellite(int id) async {
    final satellites = satelliteController.valueOrNull ?? [];
    satellites
        .map((e) => e.id == id
            ? Satellite(
                id: e.id,
                name: e.name,
                picture: e.picture,
                resolution: e.resolution,
                isSelected: false)
            : e)
        .toList();
    satelliteController.add(satellites);
  }

  @override
  AuthRepository authRepository = AuthRepository(
    AppComponents().authService,
  );

  @override
  void orderCreate() {
    final profile = profileController.valueOrNull;
    final tarif = selectedTarifController.valueOrNull;
    List<Satellite> checkedSatellited = satelliteController.valueOrNull ?? [];
    checkedSatellited =
        checkedSatellited.where((element) => element.isSelected).toList();
    if (profile != null && tarif != null && checkedSatellited.isNotEmpty) {
      orderService.postOrder(
        request: Order(
          dateBegin: '',
          dateEnd: '',
          satellites: checkedSatellited.map((e) => e.id).toList(),
          //TODO addIdZone
          geozone: 0,
          tarif: tarif,
        ),
      );
    }
  }
}
