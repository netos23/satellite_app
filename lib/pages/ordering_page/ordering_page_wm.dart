import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:satellite_app/data/repository/auth_repository.dart';
import 'package:satellite_app/domain/models/profile.dart';
import 'package:satellite_app/domain/use_case/profile_use_case.dart';
import 'package:satellite_app/internal/app_components.dart';
import 'package:satellite_app/router/app_router.dart';
import 'package:satellite_app/util/snack_bar_util.dart';
import 'package:satellite_app/util/wm_extensions.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'ordering_page_model.dart';
import 'ordering_page_widget.dart';

abstract class IOrderingPageWidgetModel extends IWidgetModel
    implements IThemeProvider {
  AuthRepository get authRepository;

  ProfileUseCase get profileUseCase;

  TextEditingController get firstNameController;

  TextEditingController get secondNameController;

  TextEditingController get emailController;

  TextEditingController get phoneNumberController;

  BehaviorSubject<Profile?> get profileController;

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
  final secondNameController = TextEditingController();

  @override
  final phoneNumberController = TextEditingController();

  bool get isUnauthorisedUser =>
      profileUseCase.profile.valueOrNull == null ||
      (profileUseCase.profile.value!.email ?? '').isEmpty;

  bool get isClientUser =>
      profileUseCase.profile.valueOrNull?.role != 'farmer';

  @override
  void initWidgetModel() {
    super.initWidgetModel();
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
    super.dispose();
  }

  @override
  AuthRepository authRepository = AuthRepository(
    AppComponents().authService,
  );
}
