import 'package:routemaster/routemaster.dart';
import 'package:where_to_go_today/src/modules/auth/ui/code/code_route.dart';
import 'package:where_to_go_today/src/modules/main/main_screen_route.dart';
import 'package:where_to_go_today/src/modules/settings/ui/settings_route.dart';

/// Класс, в котором описываем навигацию в приложении.
/// Навигация основана на пакете [routemaster](https://pub.dev/packages/routemaster)
///
/// Имена роутов храним в константах по аналогии с [SettingsRoute.routeName]
class AppRouter {
  static const initialRoute = '/';

  static final routes = RouteMap(routes: {
    initialRoute: (_) => MainScreenRoute(),
    SettingsRoute.routeName: (_) => SettingsRoute(),
    CodeRoute.routeName: (_) => CodeRoute(),
  });
}
