import 'package:where_to_go_today/src/modules/settings/service/settings_bloc.dart';
import 'package:where_to_go_today/src/modules/settings/service/state/state.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:where_to_go_today/src/ui/base/view_model.dart';
import 'package:where_to_go_today/src/ui/errors_handling/error_handler.dart';

part 'app_store.g.dart';

class AppStore = _AppStore with _$AppStore;

abstract class _AppStore extends ViewModel with Store, ChangeNotifier {
  @observable
  ThemeMode? themeMode;

  final SettingsBloc _bloc;

  _AppStore(this._bloc, ErrorHandler errorHandler) : super(errorHandler) {
    observeBloc<SettingsState, SettingsBloc>(
      _bloc,
      (event) {
        themeMode =
            event is SettingsWithDataState ? event.themeMode : ThemeMode.system;

        notifyListeners();
      },
    );
  }
}
