import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:where_to_go_today/src/di/app_dependency.dart';
import 'package:where_to_go_today/src/modules/auth/ui/code/code_vm.dart';

import 'code_screen.dart';

/// Маршрут для навигации к экрану настроек(сделан для примера)
class CodeRoute extends MaterialPage {
  static const routeName = '/auth_code';

  CodeRoute()
      : super(
          child: Provider<CodeVm>(
            create: (ctx) => CodeVm(
              ctx.read<AppDependencies>().authBloc,
              ctx.read<AppDependencies>().errorHandler,
            ),
            child: Builder(
              builder: (context) {
                return CodeScreen(
                  vm: context.read<CodeVm>(),
                );
              },
            ),
          ),
        );
}
