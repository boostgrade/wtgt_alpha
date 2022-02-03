import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:where_to_go_today/src/di/app_dependency.dart';
import 'package:where_to_go_today/src/modules/auth/sign_in/sign_in_screen.dart';
import 'package:where_to_go_today/src/modules/auth/sign_in/sign_in_vm.dart';

class AuthByPhoneRoute extends MaterialPage {
  static const routeName = '/auth_by_phone';

  AuthByPhoneRoute()
      : super(
          child: Provider<SignInVM>(
            create: (ctx) => SignInVM(
              ctx.read<AppDependencies>().authBloc,
              ctx.read<AppDependencies>().errorHandler,
              ctx,
            ),
            child: Builder(builder: (context) {
              return SignInScreen(
                vm: context.read<SignInVM>(),
                context: context,
              );
            }),
          ),
        );
}
