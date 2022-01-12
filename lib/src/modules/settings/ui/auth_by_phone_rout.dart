import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:where_to_go_today/src/di/app_dependency.dart';
import 'package:where_to_go_today/src/modules/auth/sign_in/sign_in_vm.dart';
import 'package:where_to_go_today/src/modules/settings/ui/settings_store.dart';
import 'package:where_to_go_today/src/modules/settings/ui/settings_view.dart';


class AuthByPhoneRout extends MaterialPage {
  static const routeName = '/auth_by_phone';

  AuthByPhoneRout()
      : super(
          child: Provider<SignInVM>(
            create: (ctx) => SignInVM(
              ctx.read<AppDependencies>().settingsController,
              ctx.read<AppDependencies>().errorHandler,
            ),
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
