import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:where_to_go_today/src/di/app_dependency.dart';
import 'package:where_to_go_today/src/modules/settings/ui/settings_store.dart';
import 'package:where_to_go_today/src/modules/settings/ui/settings_view.dart';

/// Маршрут для навигации к экрану настроек(сделан для примера)
class SettingsRoute extends MaterialPage {
  static const routeName = '/settings';

  SettingsRoute()
      : super(
          child: Provider<SettingsStore>(
            create: (ctx) =>
                SettingsStore(ctx.read<AppDependencies>().settingsController),
            child: Builder(
              builder: (context) {
                return SettingsView(
                  store: context.read<SettingsStore>(),
                );
              },
            ),
          ),
        );
}
