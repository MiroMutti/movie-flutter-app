import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A service that stores and retrieves user settings.
///
/// By default, this class does not persist user settings. If you'd like to
/// persist the user settings locally, use the shared_preferences package. If
/// you'd like to store settings on a web server, use the http package.
class SettingsService {
  SettingsService(this._sharedPreferences);

  final SharedPreferences _sharedPreferences;

  /// Loads the User's preferred ThemeMode from local or remote storage.
  ThemeMode get themeMode {
    String currentMode = _themeModeString;
    switch (currentMode) {
      case 'System':
        return ThemeMode.system;
      case 'Light':
        return ThemeMode.light;
      case 'Dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  String get _themeModeString =>
      _sharedPreferences.getString('ThemeMode') ?? 'System';

  /// Persists the user's preferred ThemeMode to local or remote storage.
  Future<void> updateThemeMode(ThemeMode theme) async {
    String themeValue = 'System';
    theme == ThemeMode.light
        ? themeValue = 'Light'
        : theme == ThemeMode.dark
            ? themeValue = 'Dark'
            : themeValue = 'System';
    _sharedPreferences.setString('themeMode', themeValue);
    // Use the shared_preferences package to persist settings locally or the
    // http package to persist settings over the network.
  }
}
