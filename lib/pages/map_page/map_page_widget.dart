import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:satellite_app/domain/models/profile.dart';
import 'package:satellite_app/pages/components/theme_switch.dart';
import 'package:satellite_app/router/app_router.dart';

import 'map_page_wm.dart';

// TODO: cover with documentation
/// Main widget for ProfilePage module
@RoutePage()
class MapPageWidget extends ElementaryWidget<IMapPageWidgetModel> {
  const MapPageWidget({
    Key? key,
    WidgetModelFactory wmFactory = defaultMapPageWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IMapPageWidgetModel wm) {
    final theme = wm.theme;
    final textTheme = wm.textTheme;
    final colorTheme = wm.colorScheme;

    return Builder(
      builder: (context) {
        return Scaffold(
          body: StreamBuilder<Profile?>(
            initialData: wm.profileUseCase.profile.valueOrNull,
            stream: wm.profileUseCase.profile.stream,
            builder: (context, profileSnapshot) {
              final isLogin = profileSnapshot.hasData &&
                  profileSnapshot.data!.email.isNotEmpty;
              return Column(
                children: [
                  if (!isLogin)
                    Expanded(
                      child: Text(
                        'Необходима авторизация',
                        textAlign: TextAlign.center,
                        style: textTheme.bodyLarge?.copyWith(
                          color: colorTheme.onBackground,
                        ),
                      ),
                    ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.all(16),
                    height: 82,
                    child: FilledButton(
                      style: theme.filledButtonTheme.style?.copyWith(
                        fixedSize: const MaterialStatePropertyAll(
                          Size.fromHeight(50),
                        ),
                      ),
                      onPressed: () {
                        if (!isLogin) {
                          context.router.push(AuthRoute());
                        } else {
                          context.router.push(OrderingRoute());
                        }
                      },
                      child: Center(
                        child: !isLogin
                            ? const Text('Заказать')
                            : const Text('Заказать'),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
