import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class SettingsEvent extends Equatable {}

/// Событие обновления темы
class UpdateTheme extends SettingsEvent {
  final ThemeMode? themeMode;

  UpdateTheme(this.themeMode);

  @override
  List<Object?> get props => [themeMode];
}

/// Событие для загрузки данных
class LoadSettings extends SettingsEvent {

  @override
  List<Object?> get props => [];
}
