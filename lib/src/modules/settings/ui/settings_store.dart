import 'package:where_to_go_today/src/modules/settings/service/event/event.dart';
import 'package:where_to_go_today/src/modules/settings/service/settings_bloc.dart';
import 'package:where_to_go_today/src/modules/settings/service/state/state.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:where_to_go_today/src/ui/base/view_model.dart';
import 'package:where_to_go_today/src/ui/errors_handling/error_handler.dart';

part 'settings_store.g.dart';

class SettingsStore = _SettingsStore with _$SettingsStore;

abstract class _SettingsStore extends ViewModel with Store {
  @observable
  ThemeMode themeMode = ThemeMode.system;

  final SettingsBloc _bloc;

  _SettingsStore(
    this._bloc,
    ErrorHandler errorHandler,
  ) : super(errorHandler) {
    observeBloc<SettingsState, SettingsBloc>(_bloc, _handleStates);
  }

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
