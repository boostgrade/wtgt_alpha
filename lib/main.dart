import 'package:firebase_core/firebase_core.dart';
import 'package:where_to_go_today/src/app/ui/app_store.dart';
import 'package:where_to_go_today/src/di/app_dependency.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'src/app/ui/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final globalDeps = AppDependencies();
  await globalDeps.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    Provider(
      create: (ctx) => globalDeps,
      child: App(
        store: AppStore(
          globalDeps.settingsController,
          globalDeps.errorHandler,
        ),
      ),
    ),
  );
}
