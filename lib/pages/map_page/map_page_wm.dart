import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:satellite_app/data/repository/auth_repository.dart';
import 'package:satellite_app/domain/use_case/profile_use_case.dart';
import 'package:satellite_app/internal/app_components.dart';
import 'package:satellite_app/router/app_router.dart';
import 'package:satellite_app/util/wm_extensions.dart';

import 'map_page_model.dart';
import 'map_page_widget.dart';

abstract class IMapPageWidgetModel extends IWidgetModel
    implements IThemeProvider {
  AuthRepository get authRepository;

  ProfileUseCase get profileUseCase;

  TextEditingController get brandController;

  TextEditingController get addressController;

  void onMapCreated(GoogleMapController controller);

  Future<void> openSettings();

  void zoomIn();

  void zoomOut();

  void addPoint();
}

MapPageWidgetModel defaultMapPageWidgetModelFactory(BuildContext context) {
  return MapPageWidgetModel(MapPageModel());
}

// TODO: cover with documentation
/// Default widget model for ProfilePageWidget
class MapPageWidgetModel extends WidgetModel<MapPageWidget, MapPageModel>
    with ThemeProvider
    implements IMapPageWidgetModel {
  MapPageWidgetModel(MapPageModel model) : super(model);
  @override
  final profileUseCase = AppComponents().profileUseCase;

  bool get isUnauthorisedUser =>
      profileUseCase.profile.valueOrNull == null ||
      (profileUseCase.profile.value!.email ?? '').isEmpty;

  bool get isClientUser => profileUseCase.profile.valueOrNull?.role != 'farmer';

  final telegramLink =
      'https://telegram.me/MiraMessTeam_help_bot?start=w1i1zvbu9h6teeO3gR1mXxE-eZG9Pl5SFW4-vhSjNU4';

  @override
  AuthRepository authRepository = AuthRepository(
    AppComponents().authService,
  );

  @override
  final addressController = TextEditingController();

  @override
  final brandController = TextEditingController();

  GoogleMapController? controller;

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    if (profileUseCase.profile.valueOrNull == null) {
      profileUseCase.loadProfile();
    }
  }

  @override
  void onMapCreated(GoogleMapController controller) {
    this.controller = controller;
  }

  @override
  Future<void> openSettings() async {}

  @override
  void zoomIn() {
    controller?.animateCamera(
      CameraUpdate.zoomIn(),
    );
  }

  @override
  void zoomOut() {
    controller?.animateCamera(
      CameraUpdate.zoomOut(),
    );
  }


  @override
  void addPoint() {
    router.push(OrderingRoute());
  }
}
