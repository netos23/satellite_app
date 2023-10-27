import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:satellite_app/data/repository/auth_repository.dart';
import 'package:satellite_app/domain/models/profile.dart';
import 'package:satellite_app/domain/use_case/profile_use_case.dart';
import 'package:satellite_app/internal/app_components.dart';
import 'package:satellite_app/router/app_router.dart';
import 'package:satellite_app/util/wm_extensions.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'profile_page_model.dart';
import 'profile_page_widget.dart';

abstract class IProfilePageWidgetModel extends IWidgetModel
    implements IThemeProvider {
  AuthRepository get authRepository;

  ProfileUseCase get profileUseCase;

  void onEditProfileTap();

  void linkToTelegram();

  TextEditingController get brandController;

  TextEditingController get addressController;

  BehaviorSubject<Profile?> get profileController;
}

ProfilePageWidgetModel defaultProfilePageWidgetModelFactory(
    BuildContext context) {
  return ProfilePageWidgetModel(ProfilePageModel());
}

// TODO: cover with documentation
/// Default widget model for ProfilePageWidget
class ProfilePageWidgetModel
    extends WidgetModel<ProfilePageWidget, ProfilePageModel>
    with ThemeProvider
    implements IProfilePageWidgetModel {
  ProfilePageWidgetModel(ProfilePageModel model) : super(model);
  @override
  final profileUseCase = AppComponents().profileUseCase;

  bool get isUnauthorisedUser =>
      profileController.valueOrNull == null ||
      (profileController.value!.email ?? '').isEmpty;

  @override
  BehaviorSubject<Profile?> profileController = BehaviorSubject();

  final telegramLink =
      'https://telegram.me/MiraMessTeam_help_bot?start=w1i1zvbu9h6teeO3gR1mXxE-eZG9Pl5SFW4-vhSjNU4';

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    if(profileUseCase.profile.valueOrNull != null) {
      profileController.add(profileUseCase.profile.value);
    }

    profileUseCase.profile.stream.listen((event) {
      profileController.add(event);
    });

    if (profileUseCase.profile.valueOrNull == null) {
      profileUseCase.loadProfile();
    }
  }

  @override
  void dispose() {
    profileController.close();
    super.dispose();
  }

  @override
  AuthRepository authRepository = AuthRepository(
    AppComponents().authService,
  );

  @override
  void onUnauthorisedTap(void Function() onTap) {
    if (isUnauthorisedUser) {
      showModalBottomSheet(
        context: router.root.navigatorKey.currentContext!,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(25),
            topLeft: Radius.circular(25),
          ),
        ),
        builder: _buildUnauthorisedContent,
      );
    } else {
      onTap();
    }
  }

  @override
  void linkToTelegram() {
    launchUrlString(profileUseCase.profile.value?.tgChatStartLink ?? '',
        mode: LaunchMode.externalApplication);
  }

  @override
  void onEditProfileTap() {
    onUnauthorisedTap(() {
      router.push(EditProfileRoute(profile: profileUseCase.profile.value));
    });
  }

  Widget _buildUnauthorisedContent(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
          child: Text(
            'Данный раздел доступен только авторизованным пользователям, войдите или зарегистрируйтесь',
            maxLines: 6,
            style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSurface,
                overflow: TextOverflow.ellipsis),
          ),
        ),
        Column(
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                height: 50,
                child: FilledButton(
                  style: theme.filledButtonTheme.style?.copyWith(
                    fixedSize: const MaterialStatePropertyAll(
                      Size.fromHeight(50),
                    ),
                  ),
                  onPressed: () {
                    context.popRoute();
                    context.pushRoute(AuthRoute());
                  },
                  child: const Center(
                    child: Text('Войти'),
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                margin: const EdgeInsets.symmetric(vertical: 16),
                height: 50,
                child: FilledButton(
                  style: theme.filledButtonTheme.style?.copyWith(
                    fixedSize: const MaterialStatePropertyAll(
                      Size.fromHeight(50),
                    ),
                  ),
                  onPressed: () {
                    context.popRoute();
                  },
                  child: const Center(
                    child: Text('Позже'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  final addressController = TextEditingController();

  @override
  final brandController = TextEditingController();
}
