import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:satellite_app/router/app_router.dart';

import 'home_page_wm.dart';

// TODO: cover with documentation
/// Main widget for HomePage module
@RoutePage()
class HomePageWidget extends ElementaryWidget<IHomePageWidgetModel> {
  const HomePageWidget({
    Key? key,
    WidgetModelFactory wmFactory = defaultHomePageWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IHomePageWidgetModel wm) {
    return kIsWeb ? const _WebPage() : const _MobilePage();
  }
}

class _MobilePage extends StatelessWidget {
  const _MobilePage();

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        ShowCaseTab(),
        MapTab(),
        UserProfileTab(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return NavigationBar(
          selectedIndex: tabsRouter.activeIndex,
          onDestinationSelected: tabsRouter.setActiveIndex,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          animationDuration: const Duration(milliseconds: 300),
          destinations: const [
            NavigationDestination(
              label: 'Статьи',
              icon: Icon(Icons.photo_outlined),
            ),
            NavigationDestination(
              label: 'Заказ',
               icon: Icon(Icons.map),
            ),
            NavigationDestination(
              label: 'Профиль',
              icon: Icon(Icons.person_outline),
            ),
          ],
        );
      },
    );
  }
}

class _WebPage extends StatelessWidget {
  const _WebPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoRouter(
      builder: (context, child) {
        const tabs = [
          ShowCaseTab(),
          MapTab(),
          UserProfileTab(),
        ];

        // we check for active route index by using
        //router.isRouteActive method
        var activeIndex = tabs.indexWhere(
          (d) => context.router.isRouteActive(d.routeName),
        );
        // there might be no active route until router is mounted
        // so we play safe
        if (activeIndex == -1) {
          activeIndex = 0;
        }
        return LayoutBuilder(
          builder: (context, constrains) {
            BoxConstraints bounds;

            final width = constrains.maxWidth;
            if (width <= 700) {
              bounds = constrains;
            } else {
              bounds = constrains.copyWith(
                minWidth: 0,
                maxWidth: max(width * 0.7, 700),
              );
            }

            return ColoredBox(
              color: Theme.of(context).colorScheme.background,
              child: Center(
                child: ConstrainedBox(
                  constraints: bounds,
                  child: Row(
                    children: [
                      NavigationRail(
                        labelType: NavigationRailLabelType.all,
                        destinations: const [
                          NavigationRailDestination(
                            label: Text('Статьи'),
                            icon: Icon(Icons.photo_outlined),
                          ),
                          NavigationRailDestination(
                            label: Text('Заказ'),
                            icon: Icon(Icons.map),
                          ),
                          NavigationRailDestination(
                            label: Text('Профиль'),
                            icon: Icon(Icons.person_outline),
                          ),
                        ],
                        selectedIndex: activeIndex,
                        onDestinationSelected: (index) {
                          // use navigate instead of push so you won't have
                          // many useless route stacks
                          context.navigateTo(tabs[index]);
                        },
                      ),
                      // child is the rendered route stack
                      Expanded(child: child)
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
