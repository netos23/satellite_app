// import 'dart:async';
//
// import 'package:auto_route/auto_route.dart';
//
// import 'package:flutter/material.dart';
//
// part 'app_router.gr.dart';
//
// @AutoRouterConfig(replaceInRouteName: "PageWidget,Route")
// class AppRouter extends _$AppRouter {
//   @override
//   List<AutoRoute> get routes => [
//         AutoRoute(page: WebViewerRoute.page),
//         AutoRoute(
//           page: HomeRoute.page,
//           initial: true,
//           children: [
//             AutoRoute(
//               page: ShowCaseTab.page,
//               children: [
//                 AutoRoute(
//                   page: ShowCaseRoute.page,
//                   initial: true,
//                 ),
//               ],
//             ),
//             AutoRoute(
//               page: UserProfileTab.page,
//               children: [
//                 AutoRoute(
//                   page: ProfileRoute.page,
//                   initial: true,
//                 ),
//                 AutoRoute(
//                   page: EditProfileRoute.page,
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ];
// }
//
// @RoutePage(name: 'ShowCaseTab')
// class ShowCaseTabPage extends AutoRouter {
//   const ShowCaseTabPage({super.key});
// }
//
// @RoutePage(name: 'UserProfileTab')
// class UserProfileTabPage extends AutoRouter {
//   const UserProfileTabPage({super.key});
// }
