// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SettingsStore on _SettingsStore, Store {
  final _$themeModeAtom = Atom(name: '_SettingsStore.themeMode');

  @override
  ThemeMode get themeMode {
    _$themeModeAtom.reportRead();
    return super.themeMode;
  }

  @override
  set themeMode(ThemeMode value) {
    _$themeModeAtom.reportWrite(value, super.themeMode, () {
      super.themeMode = value;
    });
  }

  final _$_SettingsStoreActionController =
      ActionController(name: '_SettingsStore');

  @override
  void updateTheme(ThemeMode? mode) {
    final _$actionInfo = _$_SettingsStoreActionController.startAction(
        name: '_SettingsStore.updateTheme');
    try {
      return super.updateTheme(mode);
    } finally {
      _$_SettingsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
themeMode: ${themeMode}
    ''';
  }
}
