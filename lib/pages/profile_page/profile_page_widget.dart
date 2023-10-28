import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:satellite_app/domain/models/profile.dart';
import 'package:satellite_app/pages/components/theme_switch.dart';
import 'package:satellite_app/router/app_router.dart';

import 'profile_page_wm.dart';

// TODO: cover with documentation
/// Main widget for ProfilePage module
@RoutePage()
class ProfilePageWidget extends ElementaryWidget<IProfilePageWidgetModel> {
  const ProfilePageWidget({
    Key? key,
    WidgetModelFactory wmFactory = defaultProfilePageWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IProfilePageWidgetModel wm) {
    final theme = wm.theme;

    return Builder(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Профиль'),
            centerTitle: true,
            actions: const [
              ThemeSwitch(),
            ],
          ),
          body: SizedBox(
            width: 600,
            child: StreamBuilder<Profile?>(
              initialData: wm.profileController.valueOrNull,
              stream: wm.profileController.stream,
              builder: (context, profileSnapshot) {
                final isLogin = profileSnapshot.hasData &&
                    profileSnapshot.data!.email.isNotEmpty;
                final width = MediaQuery.of(context).size.width - 90;

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 800),
                    child: isLogin ? Column(
                      children:  [
                        MenuItem(
                            onTap: wm.onEditProfileTap,
                            title: 'Мои данные',
                            icon: Icons.person),
                        const Divider(),
                        MenuItem(
                            onTap: wm.onEditProfileTap,
                            title: 'Мои заказы',
                            icon: Icons.shopping_cart),
                        const Divider(),
                        MenuItem(
                            onTap: wm.onEditProfileTap,
                            title: 'Мои зоны',
                            icon: Icons.map),
                        const Divider(),
                        MenuItem(
                          onTap: wm.onEditProfileTap,
                          title: 'O нас',
                          icon: Icons.settings_outlined,
                        ),
                        const Divider(),
                        const Spacer(),
                        Image.asset('assets/images/logo_large.png', width: width, height: width,),
                        const Spacer(),
                      ],
                    )
                        :
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:     [
                        Image.asset('assets/images/logo_large.png', width: width, height: width,),
                        Text(
                          'Что бы сталкерить\n на полную катушку,\n зарегистрируйтесь или\n войдите в аккаунт :) ',
                          style: theme.textTheme.bodyMedium,
                          textAlign: TextAlign.center,
                        ),
                        Row(
                          children: [
                            Flexible(
                              child: FilledButton(
                                style:
                                theme.filledButtonTheme.style?.copyWith(
                                  fixedSize: const MaterialStatePropertyAll(
                                    Size.fromHeight(50),
                                  ),
                                ),
                                onPressed: () {
                                  if (!isLogin) {
                                    context.router.push(AuthRoute());
                                  } else {
                                    wm.profileUseCase.logout();
                                  }
                                },
                                child: Center(
                                  child: !isLogin
                                      ? const Text('Войти')
                                      : const Text('Выйти'),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Flexible(
                              child: OutlinedButton(
                                  onPressed: () =>
                                      context.router.push(RegisterRoute()),
                                  child: const Text('Зарегистрироваться')),
                            )
                          ],
                        ),
                      ],
                    )
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class MenuItem extends StatelessWidget {
  const MenuItem({
    super.key,
    required this.onTap,
    required this.title,
    required this.icon,
  });

  final void Function() onTap;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Row(children: [
          Padding(padding: const EdgeInsets.only(right: 6), child: Icon(icon)),
          Text(title),
          const Spacer(),
          const Icon(Icons.navigate_next),
        ]),
      ),
    );
  }
}
