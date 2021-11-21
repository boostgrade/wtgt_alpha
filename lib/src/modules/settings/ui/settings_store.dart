import 'package:where_to_go_today/src/modules/settings/service/event/event.dart';
import 'package:where_to_go_today/src/modules/settings/service/settings_bloc.dart';
import 'package:where_to_go_today/src/modules/settings/service/state/state.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'settings_store.g.dart';

class SettingsStore = _SettingsStore with _$SettingsStore;

abstract class _SettingsStore with Store {
  _SettingsStore(this._bloc) {
    _bloc.stream.listen(
      _handleStates,
    );
  }

  final SettingsBloc _bloc;

  @observable
  ThemeMode? themeMode;

  @action
  void updateTheme(ThemeMode? mode) {
    _bloc.add(UpdateTheme(mode));
  }

  void _handleStates(SettingsState state) {
    if (state is LoadingSettingsState) {
      themeMode = ThemeMode.system;
    } else if (state is SettingsWithDataState) {
      themeMode = state.themeMode;
      debugPrint('Hello ${themeMode.toString()}');
    }
  }
}
