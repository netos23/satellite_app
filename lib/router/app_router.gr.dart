// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AuthCodeRoute.name: (routeData) {
      final args = routeData.argsAs<AuthCodeRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AuthCodePageWidget(
          key: args.key,
          email: args.email,
          wmFactory: args.wmFactory,
        ),
      );
    },
    AuthRoute.name: (routeData) {
      final args =
          routeData.argsAs<AuthRouteArgs>(orElse: () => const AuthRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AuthPageWidget(
          key: args.key,
          wmFactory: args.wmFactory,
        ),
      );
    },
    EditProfileRoute.name: (routeData) {
      final args = routeData.argsAs<EditProfileRouteArgs>(
          orElse: () => const EditProfileRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EditProfilePageWidget(
          profile: args.profile,
          key: args.key,
          wmFactory: args.wmFactory,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: HomePageWidget(
          key: args.key,
          wmFactory: args.wmFactory,
        ),
      );
    },
    MapRoute.name: (routeData) {
      final args =
          routeData.argsAs<MapRouteArgs>(orElse: () => const MapRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MapPageWidget(
          key: args.key,
          wmFactory: args.wmFactory,
        ),
      );
    },
    MapTab.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MapTabPage(),
      );
    },
    OrderViewRoute.name: (routeData) {
      final args = routeData.argsAs<OrderViewRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: OrderViewPageWidget(
          key: args.key,
          order: args.order,
        ),
      );
    },
    OrderingRoute.name: (routeData) {
      final args = routeData.argsAs<OrderingRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: OrderingPageWidget(
          key: args.key,
          zoneId: args.zoneId,
          wmFactory: args.wmFactory,
        ),
      );
    },
    OrdersRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OrdersPageWidget(),
      );
    },
    ProfileRoute.name: (routeData) {
      final args = routeData.argsAs<ProfileRouteArgs>(
          orElse: () => const ProfileRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ProfilePageWidget(
          key: args.key,
          wmFactory: args.wmFactory,
        ),
      );
    },
    RegisterRoute.name: (routeData) {
      final args = routeData.argsAs<RegisterRouteArgs>(
          orElse: () => const RegisterRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: RegisterPageWidget(
          email: args.email,
          key: args.key,
          wmFactory: args.wmFactory,
        ),
      );
    },
    ShowCaseRoute.name: (routeData) {
      final args = routeData.argsAs<ShowCaseRouteArgs>(
          orElse: () => const ShowCaseRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ShowCasePageWidget(
          key: args.key,
          wmFactory: args.wmFactory,
        ),
      );
    },
    ShowCaseTab.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ShowCaseTabPage(),
      );
    },
    UserProfileTab.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UserProfileTabPage(),
      );
    },
    WebViewerRoute.name: (routeData) {
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<WebViewerRouteArgs>(
          orElse: () => WebViewerRouteArgs(
                title: queryParams.getString(
                  'title',
                  '',
                ),
                url: queryParams.getString(
                  'url',
                  '',
                ),
                hideAppbar: queryParams.optBool('hideAppbar'),
              ));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WebViewerPageWidget(
          key: args.key,
          title: args.title,
          url: args.url,
          onNavigationRequest: args.onNavigationRequest,
          onPageFinished: args.onPageFinished,
          onWillPop: args.onWillPop,
          hideAppbar: args.hideAppbar,
        ),
      );
    },
  };
}

/// generated route for
/// [AuthCodePageWidget]
class AuthCodeRoute extends PageRouteInfo<AuthCodeRouteArgs> {
  AuthCodeRoute({
    Key? key,
    required String email,
    WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
            BuildContext)
        wmFactory = defaultAuthCodePageWidgetModelFactory,
    List<PageRouteInfo>? children,
  }) : super(
          AuthCodeRoute.name,
          args: AuthCodeRouteArgs(
            key: key,
            email: email,
            wmFactory: wmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'AuthCodeRoute';

  static const PageInfo<AuthCodeRouteArgs> page =
      PageInfo<AuthCodeRouteArgs>(name);
}

class AuthCodeRouteArgs {
  const AuthCodeRouteArgs({
    this.key,
    required this.email,
    this.wmFactory = defaultAuthCodePageWidgetModelFactory,
  });

  final Key? key;

  final String email;

  final WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
      BuildContext) wmFactory;

  @override
  String toString() {
    return 'AuthCodeRouteArgs{key: $key, email: $email, wmFactory: $wmFactory}';
  }
}

/// generated route for
/// [AuthPageWidget]
class AuthRoute extends PageRouteInfo<AuthRouteArgs> {
  AuthRoute({
    Key? key,
    WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
            BuildContext)
        wmFactory = defaultAuthPageWidgetModelFactory,
    List<PageRouteInfo>? children,
  }) : super(
          AuthRoute.name,
          args: AuthRouteArgs(
            key: key,
            wmFactory: wmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const PageInfo<AuthRouteArgs> page = PageInfo<AuthRouteArgs>(name);
}

class AuthRouteArgs {
  const AuthRouteArgs({
    this.key,
    this.wmFactory = defaultAuthPageWidgetModelFactory,
  });

  final Key? key;

  final WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
      BuildContext) wmFactory;

  @override
  String toString() {
    return 'AuthRouteArgs{key: $key, wmFactory: $wmFactory}';
  }
}

/// generated route for
/// [EditProfilePageWidget]
class EditProfileRoute extends PageRouteInfo<EditProfileRouteArgs> {
  EditProfileRoute({
    Profile? profile,
    Key? key,
    WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
            BuildContext)
        wmFactory = defaultEditProfilePageWidgetModelFactory,
    List<PageRouteInfo>? children,
  }) : super(
          EditProfileRoute.name,
          args: EditProfileRouteArgs(
            profile: profile,
            key: key,
            wmFactory: wmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'EditProfileRoute';

  static const PageInfo<EditProfileRouteArgs> page =
      PageInfo<EditProfileRouteArgs>(name);
}

class EditProfileRouteArgs {
  const EditProfileRouteArgs({
    this.profile,
    this.key,
    this.wmFactory = defaultEditProfilePageWidgetModelFactory,
  });

  final Profile? profile;

  final Key? key;

  final WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
      BuildContext) wmFactory;

  @override
  String toString() {
    return 'EditProfileRouteArgs{profile: $profile, key: $key, wmFactory: $wmFactory}';
  }
}

/// generated route for
/// [HomePageWidget]
class HomeRoute extends PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    Key? key,
    WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
            BuildContext)
        wmFactory = defaultHomePageWidgetModelFactory,
    List<PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          args: HomeRouteArgs(
            key: key,
            wmFactory: wmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<HomeRouteArgs> page = PageInfo<HomeRouteArgs>(name);
}

class HomeRouteArgs {
  const HomeRouteArgs({
    this.key,
    this.wmFactory = defaultHomePageWidgetModelFactory,
  });

  final Key? key;

  final WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
      BuildContext) wmFactory;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key, wmFactory: $wmFactory}';
  }
}

/// generated route for
/// [MapPageWidget]
class MapRoute extends PageRouteInfo<MapRouteArgs> {
  MapRoute({
    Key? key,
    WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
            BuildContext)
        wmFactory = defaultMapPageWidgetModelFactory,
    List<PageRouteInfo>? children,
  }) : super(
          MapRoute.name,
          args: MapRouteArgs(
            key: key,
            wmFactory: wmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'MapRoute';

  static const PageInfo<MapRouteArgs> page = PageInfo<MapRouteArgs>(name);
}

class MapRouteArgs {
  const MapRouteArgs({
    this.key,
    this.wmFactory = defaultMapPageWidgetModelFactory,
  });

  final Key? key;

  final WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
      BuildContext) wmFactory;

  @override
  String toString() {
    return 'MapRouteArgs{key: $key, wmFactory: $wmFactory}';
  }
}

/// generated route for
/// [MapTabPage]
class MapTab extends PageRouteInfo<void> {
  const MapTab({List<PageRouteInfo>? children})
      : super(
          MapTab.name,
          initialChildren: children,
        );

  static const String name = 'MapTab';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OrderViewPageWidget]
class OrderViewRoute extends PageRouteInfo<OrderViewRouteArgs> {
  OrderViewRoute({
    Key? key,
    required Order order,
    List<PageRouteInfo>? children,
  }) : super(
          OrderViewRoute.name,
          args: OrderViewRouteArgs(
            key: key,
            order: order,
          ),
          initialChildren: children,
        );

  static const String name = 'OrderViewRoute';

  static const PageInfo<OrderViewRouteArgs> page =
      PageInfo<OrderViewRouteArgs>(name);
}

class OrderViewRouteArgs {
  const OrderViewRouteArgs({
    this.key,
    required this.order,
  });

  final Key? key;

  final Order order;

  @override
  String toString() {
    return 'OrderViewRouteArgs{key: $key, order: $order}';
  }
}

/// generated route for
/// [OrderingPageWidget]
class OrderingRoute extends PageRouteInfo<OrderingRouteArgs> {
  OrderingRoute({
    Key? key,
    required int zoneId,
    WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
            BuildContext)
        wmFactory = defaultOrderingPageWidgetModelFactory,
    List<PageRouteInfo>? children,
  }) : super(
          OrderingRoute.name,
          args: OrderingRouteArgs(
            key: key,
            zoneId: zoneId,
            wmFactory: wmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'OrderingRoute';

  static const PageInfo<OrderingRouteArgs> page =
      PageInfo<OrderingRouteArgs>(name);
}

class OrderingRouteArgs {
  const OrderingRouteArgs({
    this.key,
    required this.zoneId,
    this.wmFactory = defaultOrderingPageWidgetModelFactory,
  });

  final Key? key;

  final int zoneId;

  final WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
      BuildContext) wmFactory;

  @override
  String toString() {
    return 'OrderingRouteArgs{key: $key, zoneId: $zoneId, wmFactory: $wmFactory}';
  }
}

/// generated route for
/// [OrdersPageWidget]
class OrdersRoute extends PageRouteInfo<void> {
  const OrdersRoute({List<PageRouteInfo>? children})
      : super(
          OrdersRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrdersRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfilePageWidget]
class ProfileRoute extends PageRouteInfo<ProfileRouteArgs> {
  ProfileRoute({
    Key? key,
    WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
            BuildContext)
        wmFactory = defaultProfilePageWidgetModelFactory,
    List<PageRouteInfo>? children,
  }) : super(
          ProfileRoute.name,
          args: ProfileRouteArgs(
            key: key,
            wmFactory: wmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<ProfileRouteArgs> page =
      PageInfo<ProfileRouteArgs>(name);
}

class ProfileRouteArgs {
  const ProfileRouteArgs({
    this.key,
    this.wmFactory = defaultProfilePageWidgetModelFactory,
  });

  final Key? key;

  final WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
      BuildContext) wmFactory;

  @override
  String toString() {
    return 'ProfileRouteArgs{key: $key, wmFactory: $wmFactory}';
  }
}

/// generated route for
/// [RegisterPageWidget]
class RegisterRoute extends PageRouteInfo<RegisterRouteArgs> {
  RegisterRoute({
    String? email,
    Key? key,
    WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
            BuildContext)
        wmFactory = defaultRegisterPageWidgetModelFactory,
    List<PageRouteInfo>? children,
  }) : super(
          RegisterRoute.name,
          args: RegisterRouteArgs(
            email: email,
            key: key,
            wmFactory: wmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const PageInfo<RegisterRouteArgs> page =
      PageInfo<RegisterRouteArgs>(name);
}

class RegisterRouteArgs {
  const RegisterRouteArgs({
    this.email,
    this.key,
    this.wmFactory = defaultRegisterPageWidgetModelFactory,
  });

  final String? email;

  final Key? key;

  final WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
      BuildContext) wmFactory;

  @override
  String toString() {
    return 'RegisterRouteArgs{email: $email, key: $key, wmFactory: $wmFactory}';
  }
}

/// generated route for
/// [ShowCasePageWidget]
class ShowCaseRoute extends PageRouteInfo<ShowCaseRouteArgs> {
  ShowCaseRoute({
    Key? key,
    WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
            BuildContext)
        wmFactory = defaultShowCasePageWidgetModelFactory,
    List<PageRouteInfo>? children,
  }) : super(
          ShowCaseRoute.name,
          args: ShowCaseRouteArgs(
            key: key,
            wmFactory: wmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'ShowCaseRoute';

  static const PageInfo<ShowCaseRouteArgs> page =
      PageInfo<ShowCaseRouteArgs>(name);
}

class ShowCaseRouteArgs {
  const ShowCaseRouteArgs({
    this.key,
    this.wmFactory = defaultShowCasePageWidgetModelFactory,
  });

  final Key? key;

  final WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
      BuildContext) wmFactory;

  @override
  String toString() {
    return 'ShowCaseRouteArgs{key: $key, wmFactory: $wmFactory}';
  }
}

/// generated route for
/// [ShowCaseTabPage]
class ShowCaseTab extends PageRouteInfo<void> {
  const ShowCaseTab({List<PageRouteInfo>? children})
      : super(
          ShowCaseTab.name,
          initialChildren: children,
        );

  static const String name = 'ShowCaseTab';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UserProfileTabPage]
class UserProfileTab extends PageRouteInfo<void> {
  const UserProfileTab({List<PageRouteInfo>? children})
      : super(
          UserProfileTab.name,
          initialChildren: children,
        );

  static const String name = 'UserProfileTab';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [WebViewerPageWidget]
class WebViewerRoute extends PageRouteInfo<WebViewerRouteArgs> {
  WebViewerRoute({
    Key? key,
    String title = '',
    String url = '',
    FutureOr<NavigationDecision> Function(NavigationRequest)?
        onNavigationRequest,
    void Function(String)? onPageFinished,
    void Function()? onWillPop,
    bool? hideAppbar,
    List<PageRouteInfo>? children,
  }) : super(
          WebViewerRoute.name,
          args: WebViewerRouteArgs(
            key: key,
            title: title,
            url: url,
            onNavigationRequest: onNavigationRequest,
            onPageFinished: onPageFinished,
            onWillPop: onWillPop,
            hideAppbar: hideAppbar,
          ),
          rawQueryParams: {
            'title': title,
            'url': url,
            'hideAppbar': hideAppbar,
          },
          initialChildren: children,
        );

  static const String name = 'WebViewerRoute';

  static const PageInfo<WebViewerRouteArgs> page =
      PageInfo<WebViewerRouteArgs>(name);
}

class WebViewerRouteArgs {
  const WebViewerRouteArgs({
    this.key,
    this.title = '',
    this.url = '',
    this.onNavigationRequest,
    this.onPageFinished,
    this.onWillPop,
    this.hideAppbar,
  });

  final Key? key;

  final String title;

  final String url;

  final FutureOr<NavigationDecision> Function(NavigationRequest)?
      onNavigationRequest;

  final void Function(String)? onPageFinished;

  final void Function()? onWillPop;

  final bool? hideAppbar;

  @override
  String toString() {
    return 'WebViewerRouteArgs{key: $key, title: $title, url: $url, onNavigationRequest: $onNavigationRequest, onPageFinished: $onPageFinished, onWillPop: $onWillPop, hideAppbar: $hideAppbar}';
  }
}
