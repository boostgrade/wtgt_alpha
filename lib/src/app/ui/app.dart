import 'package:provider/provider.dart';
import 'package:routemaster/routemaster.dart';
import 'package:where_to_go_today/src/app/ui/app_store.dart';
import 'package:where_to_go_today/src/di/app_dependency.dart';
import 'package:where_to_go_today/src/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:where_to_go_today/src/ui/base/view_model.dart';
import 'package:where_to_go_today/src/ui/base/view_model_disposer_mixin.dart';
import 'package:where_to_go_today/src/ui/res/theme/project_theme.dart';

/// The Widget that configures your application.
class App extends StatefulWidget {
  final AppStore store;

  const App({
    Key? key,
    required this.store,
  }) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with ViewModelDisposerMixin {
  @override
  ViewModel get vm => widget.store;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.store,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp.router(
          scaffoldMessengerKey:
              context.read<AppDependencies>().messageController.scaffoldKey,
          routerDelegate: RoutemasterDelegate(
            routesBuilder: (_) => AppRouter.routes,
          ),
          routeInformationParser: const RoutemasterParser(),
          restorationScopeId: 'app',
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''), // English, no country code
            Locale('ru', ''), // Russia, no country code
            Locale('RU', ''), // Russia, no country code
          ],
          onGenerateTitle: (BuildContext context) =>
              AppLocalizations.of(context)!.appTitle,
          theme: ProjectTheme.lightTheme,
          darkTheme: ThemeData.dark(),
          themeMode: widget.store.themeMode,
        );
      },
    );
  }
}
