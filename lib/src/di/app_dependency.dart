import 'package:where_to_go_today/src/modules/auth/service/api/auth_api.dart';
import 'package:where_to_go_today/src/modules/auth/service/auth_bloc.dart';
import 'package:where_to_go_today/src/modules/auth/service/repository/auth_repository.dart';
import 'package:where_to_go_today/src/modules/settings/service/event/event.dart';
import 'package:where_to_go_today/src/modules/settings/service/settings_bloc.dart';
import 'package:where_to_go_today/src/modules/settings/service/settings_service.dart';
import 'package:where_to_go_today/src/services/network/dio/dio_module.dart';
import 'package:where_to_go_today/src/ui/errors_handling/scenario_error_handler/scenario_error_handler.dart';
import 'package:where_to_go_today/src/ui/errors_handling/scenario_error_handler/scenarios/snackbar_error_scenarios.dart';
import 'package:where_to_go_today/src/ui/messages/default_message_controller.dart';
import 'package:where_to_go_today/src/modules/auth/service/phone_service.dart';

import 'base/dependency_bundle.dart';

/// Класс с глобальными зависимостями приложения
/// Здесь бужем описывать то, что является синглтонами.
class AppDependencies extends DependencyBundle {
  final dio = DioModule().dio;
  final settingsController = SettingsBloc(SettingsService());
  final String baseUrl = 'https://stoplight.io/mocks/softech/wtgt/75539';
  late final authBloc = AuthBloc(
    AuthRepository(AuthApi(
      dio,
      baseUrl: baseUrl,
    )),
    PhoneService(),
  );

  late final messageController = DefaultMessageController();
  late final errorHandler = ScenarioErrorHandler(
    SnackBarErrorScenarios(
      messageController,
    ),
  );

  Future<void> init() async {
    settingsController.add(LoadSettings());
  }
}
