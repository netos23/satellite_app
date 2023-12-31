import 'package:dio/dio.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';
import 'package:satellite_app/domain/models/profile.dart';
import 'package:satellite_app/domain/use_case/profile_use_case.dart';
import 'package:satellite_app/internal/app_components.dart';
import 'package:satellite_app/router/app_router.dart';
import 'package:satellite_app/util/snack_bar_util.dart';
import 'package:satellite_app/util/value_stream_wrapper.dart';
import 'package:satellite_app/util/wm_extensions.dart';

import 'edit_profile_page_model.dart';
import 'edit_profile_page_widget.dart';

abstract class IEditProfilePageWidgetModel extends IWidgetModel
    implements IThemeProvider {
  BehaviorSubject<String?> get genderController;

  ProfileUseCase get profileUseCase;

  TextEditingController get firstNameController;

  TextEditingController get secondNameController;

  TextEditingController get emailController;

  TextEditingController get bitrhdayController;

  TextEditingController get phoneNumber;

  BehaviorSubject<Profile?> get profileController;

  onEditProfile();
}

EditProfilePageWidgetModel defaultEditProfilePageWidgetModelFactory(
    BuildContext context) {
  return EditProfilePageWidgetModel(EditProfilePageModel());
}

// TODO: cover with documentation
/// Default widget model for EditProfilePageWidget
class EditProfilePageWidgetModel
    extends WidgetModel<EditProfilePageWidget, EditProfilePageModel>
    with ThemeProvider
    implements IEditProfilePageWidgetModel {
  EditProfilePageWidgetModel(EditProfilePageModel model) : super(model);

  @override
  final bitrhdayController = TextEditingController();

  @override
  final emailController = TextEditingController();

  @override
  final firstNameController = TextEditingController();

  @override
  final phoneNumber = TextEditingController();

  @override
  final secondNameController = TextEditingController();

  @override
  BehaviorSubject<String?> genderController = BehaviorSubject();

  @override
  BehaviorSubject<Profile?> profileController = BehaviorSubject<Profile?>();


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

    emailController.text = widget.profile?.email ?? '';
    firstNameController.text = widget.profile?.firstName ?? '';
    secondNameController.text = widget.profile?.secondName ?? '';
    phoneNumber.text = widget.profile?.phone ?? '';
    bitrhdayController.text = widget.profile?.birthDate ?? '';
    genderController.add(widget.profile?.gender);
  }

  @override
  Future<void> onEditProfile() async {
    final request = Profile(
      email: emailController.text,
      firstName: firstNameController.text,
      secondName: secondNameController.text,
      phone: phoneNumber.text,
      birthDate: bitrhdayController.text,
      gender: genderController.value,
    );

    try {
      await profileUseCase.patchProfile(request);
    } on DioException catch (error) {
      throw Exception(
        error.response?.data['message'],
      );
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    firstNameController.dispose();
    secondNameController.dispose();
    phoneNumber.dispose();
    bitrhdayController.dispose();
    genderController.close();
    profileController.close();
    super.dispose();
  }

  @override
  ProfileUseCase profileUseCase = AppComponents().profileUseCase;
}
