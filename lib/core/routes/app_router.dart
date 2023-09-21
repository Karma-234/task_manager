import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: LoginRoute.page,
        ),
        CustomRoute(
            page: HomeRoute.page,
            transitionsBuilder: TransitionsBuilders.fadeIn,
            initial: true),
      ];
}
