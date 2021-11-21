import 'package:routemaster/routemaster.dart';
import 'package:where_to_go_today/src/app/ui/app_store.dart';
import 'package:where_to_go_today/src/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

/// The Widget that configures your application.
class App extends StatelessWidget {
  const App({
    Key? key,
    required this.store,
  }) : super(key: key);

  final AppStore store;

  @override
  Widget build(BuildContext context) {

    return AnimatedBuilder(
      animation: store,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp.router(
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
          theme: ThemeData(),
          darkTheme: ThemeData.dark(),
          themeMode: store.themeMode,
        );
      },
    );
  }
}
