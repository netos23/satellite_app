import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:satellite_app/pages/home_page/home_page_widget.dart';
import 'package:satellite_app/pages/home_page/home_page_wm.dart';
import 'package:satellite_app/pages/profile_page/profile_page.dart';
import 'package:satellite_app/pages/show_case_page/show_case_page_wm.dart';
import 'package:satellite_app/pages/web_view/web_view_page.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../pages/show_case_page/show_case_page_widget.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: "PageWidget,Route")
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: WebViewerRoute.page),
        //AutoRoute(page: AuthRoute.page),
        //AutoRoute(page: AuthCodeRoute.page),
        //AutoRoute(page: RegisterRoute.page),
        AutoRoute(
          page: HomeRoute.page,
          initial: true,
          children: [
            AutoRoute(
              page: ShowCaseTab.page,
              children: [
                AutoRoute(
                  page: ShowCaseRoute.page,
                  initial: true,
                ),
              ],
            ),
            AutoRoute(
              page: UserProfileTab.page,
              children: [
                AutoRoute(
                  page: ProfileRoute.page,
                  initial: true,
                ),
                // AutoRoute(
                //   page: EditProfileRoute.page,
                // ),
                // AutoRoute(
                //   page: RegisterBrandRoute.page,
                // ),
              ],
            ),

          ],
        ),
      ];
}



@RoutePage(name: 'ShowCaseTab')
class ShowCaseTabPage extends AutoRouter {
  const ShowCaseTabPage({super.key});
}

// @RoutePage(name: 'CatalogTab')
// class CatalogTabPage extends AutoRouter {
//   const CatalogTabPage({super.key});
// }

@RoutePage(name: 'UserProfileTab')
class UserProfileTabPage extends AutoRouter {
  const UserProfileTabPage({super.key});
}
