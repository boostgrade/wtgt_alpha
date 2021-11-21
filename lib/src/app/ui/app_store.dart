import 'package:where_to_go_today/src/modules/settings/service/settings_bloc.dart';
import 'package:where_to_go_today/src/modules/settings/service/state/state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'app_store.g.dart';

class AppStore = _AppStore with _$AppStore;

abstract class _AppStore with Store, ChangeNotifier {
  final SettingsBloc _bloc;

  _AppStore(this._bloc) {
    _bloc.stream.listen(
      (event) {
        if (event is SettingsWithDataState) {
          themeMode = event.themeMode;
        } else {
          themeMode = ThemeMode.system;
        }

        notifyListeners();
      },
    );
  }

  @observable
  ThemeMode? themeMode;
}
