import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:satellite_app/data/repository/auth_repository.dart';
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

  void onEditProfileTap();

  void onCalendarTap();

  void linkToTelegram();

  TextEditingController get brandController;

  TextEditingController get addressController;

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

  bool get isUnauthorisedUser =>
      profileUseCase.profile.valueOrNull == null ||
      (profileUseCase.profile.value!.email ?? '').isEmpty;

  bool get isClientUser =>
      profileUseCase.profile.valueOrNull?.role != 'farmer';

  final telegramLink =
      'https://telegram.me/MiraMessTeam_help_bot?start=w1i1zvbu9h6teeO3gR1mXxE-eZG9Pl5SFW4-vhSjNU4';

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    if (profileUseCase.profile.valueOrNull == null) {
      profileUseCase.loadProfile();
    }
  }

  @override
  AuthRepository authRepository = AuthRepository(
    AppComponents().authService,
  );


  @override
  void onCalendarTap() {
    onUnauthorisedTap(() {
      onClientTap(() {
        () async {
          if(kIsWeb){
            context.showSnackBar(
              'ПОддерживается только в мобильном приложение',
            );
            return;
          }

          final resp = await AppComponents().dio.get('/subscriptions/calendar');
          context.showSnackBar(
            'Возникли проблемы при сохранении файла',
          );
        };
      });
    });
  }

  Widget _buildClientContent(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
          child: Text(
            'Данный раздел доступен только пользователям, зарегистрированным в качестве фермера. Чтобы стать фермером - перейдите в раздел "Мои данные" и измените свой статус',
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
                    context.pushRoute(EditProfileRoute());
                  },
                  child: const Center(
                    child: Text('Become a farmer'),
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
        )
      ],
    );
  }

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
  void onClientTap(void Function() onTap) {
    if (isClientUser) {
      showModalBottomSheet(
        context: router.root.navigatorKey.currentContext!,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(25),
            topLeft: Radius.circular(25),
          ),
        ),
        builder: _buildClientContent,
      );
    } else {
      onTap();
    }
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
                   // context.pushRoute(AuthRoute());
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