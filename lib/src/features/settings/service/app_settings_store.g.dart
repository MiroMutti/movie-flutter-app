// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_settings_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppStore on _AppStore, Store {
  Computed<ThemeMode>? _$themeModeComputed;

  @override
  ThemeMode get themeMode =>
      (_$themeModeComputed ??= Computed<ThemeMode>(() => super.themeMode,
              name: '_AppStore.themeMode'))
          .value;

  late final _$_themeModeAtom =
      Atom(name: '_AppStore._themeMode', context: context);

  @override
  ThemeMode get _themeMode {
    _$_themeModeAtom.reportRead();
    return super._themeMode;
  }

  @override
  set _themeMode(ThemeMode value) {
    _$_themeModeAtom.reportWrite(value, super._themeMode, () {
      super._themeMode = value;
    });
  }

  late final _$loadSettingsAsyncAction =
      AsyncAction('_AppStore.loadSettings', context: context);

  @override
  Future<void> loadSettings() {
    return _$loadSettingsAsyncAction.run(() => super.loadSettings());
  }

  late final _$updateThemeModeAsyncAction =
      AsyncAction('_AppStore.updateThemeMode', context: context);

  @override
  Future<void> updateThemeMode(ThemeMode? newThemeMode) {
    return _$updateThemeModeAsyncAction
        .run(() => super.updateThemeMode(newThemeMode));
  }

  @override
  String toString() {
    return '''
themeMode: ${themeMode}
    ''';
  }
}
