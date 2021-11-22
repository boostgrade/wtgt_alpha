import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main_screen_store.dart';
import 'main_screen.dart';

/// Рроут экрана [MainScreen]
class MainScreenRoute extends MaterialPage {
  MainScreenRoute()
      : super(
          child: Provider(
            create: (ctx) => MainScreenStore(ctx),
            child: Builder(
              builder: (context) => MainScreen(
                store: context.read<MainScreenStore>(),
              ),
            ),
          ),
        );
}
