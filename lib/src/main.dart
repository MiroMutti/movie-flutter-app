import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var sharedPreferences = await SharedPreferences.getInstance();

  runApp(MyApp(
    prefs: sharedPreferences,
  ));
}
