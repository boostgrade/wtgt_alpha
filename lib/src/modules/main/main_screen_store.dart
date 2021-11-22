import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';
import 'package:where_to_go_today/src/modules/main/main_screen.dart';
import 'package:mobx/mobx.dart';
import 'package:where_to_go_today/src/modules/settings/ui/settings_route.dart';

part 'main_screen_store.g.dart';

/// MobX экрана [MainScreen]
class MainScreenStore = _MainScreenStore with _$MainScreenStore;

abstract class _MainScreenStore with Store {

  final BuildContext context;

  _MainScreenStore(this.context);

  @observable
  int currentIndex = 0;

  @action
  void tabClicked(int index) {
    Routemaster.of(context).push(SettingsRoute.routeName);
    currentIndex = index;
  }
}