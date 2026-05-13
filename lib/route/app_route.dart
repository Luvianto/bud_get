import 'package:auto_route/auto_route.dart';
import 'package:bud_get/route/app_route.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: OutcomeRoute.page, initial: true),
    AutoRoute(page: MyTestRoute.page),
  ];
}
