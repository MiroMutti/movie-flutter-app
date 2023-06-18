import 'package:flutter/material.dart';
import 'package:movie_app/src/features/settings/service/app_settings_store.dart';

import 'app.dart';
import 'features/settings/service/settings_service.dart';

void main() async {
  final appSettingStore = AppStore(settingsService: SettingsService());
  await appSettingStore.loadSettings();

  runApp(MyApp(appSettingsStore: appSettingStore));
}
