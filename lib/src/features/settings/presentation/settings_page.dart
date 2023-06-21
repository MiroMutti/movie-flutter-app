import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:movie_app/src/features/settings/service/app_settings_store.dart';

@RoutePage<dynamic>()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key, required this.appSettingsStore});

  final AppStore appSettingsStore;

  @override
  Widget build(BuildContext context) {
    // AppStore appSettingsStore = Provider.of<AppStore>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Observer(builder: (context) {
          return DropdownButton<ThemeMode>(
            value: appSettingsStore.themeMode,
            onChanged: (mode) => appSettingsStore.updateThemeMode(mode),
            items: const [
              DropdownMenuItem(
                value: ThemeMode.system,
                child: Text('System Theme'),
              ),
              DropdownMenuItem(
                value: ThemeMode.light,
                child: Text('Light Theme'),
              ),
              DropdownMenuItem(
                value: ThemeMode.dark,
                child: Text('Dark Theme'),
              )
            ],
          );
        }),
      ),
    );
  }
}
