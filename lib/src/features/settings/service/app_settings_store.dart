import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:movie_app/src/features/settings/service/settings_service.dart';
part 'app_settings_store.g.dart';

class AppStore extends _AppStore with _$AppStore {
  AppStore({required SettingsService settingsService})
      : super(settingsService: settingsService);
}

abstract class _AppStore with Store {
  _AppStore({required this.settingsService}) {
    loadSettings();
  }
  final SettingsService settingsService;

  @observable
  ThemeMode _themeMode = ThemeMode.system;

  @computed
  ThemeMode get themeMode => _themeMode;

  @action
  Future<void> loadSettings() async {
    _themeMode = settingsService.themeMode;
  }

  @action
  Future<void> updateThemeMode(ThemeMode? newThemeMode) async {
    if (newThemeMode == null) return;

    if (newThemeMode == _themeMode) return;

    _themeMode = newThemeMode;

    await settingsService.updateThemeMode(newThemeMode);
  }
}
