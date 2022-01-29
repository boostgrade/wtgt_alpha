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

import 'base/dependency_bundle.dart';

/// Класс с глобальными зависимостями приложения
/// Здесь бужем описывать то, что является синглтонами.
class AppDependencies extends DependencyBundle {
  final dio = DioModule().dio;
  final settingsController = SettingsBloc(SettingsService());

  final authByPhoneController = SettingsBloc(SettingsService());

  late final authBloc = AuthBloc(AuthRepository(AuthApi(dio)));

  late final messageController = DefaultMessageController();
  late final errorHandler = ScenarioErrorHandler(
    SnackBarErrorScenarios(
      messageController,
    ),
  );
  
  late final authRepository = AuthRepository(AuthApi(dio));
  late final authBlock = AuthBloc(authRepository);
 
  
  Future<void> init() async {
    settingsController.add(LoadSettings());
  }
}
