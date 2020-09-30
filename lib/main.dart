import 'package:flutter/material.dart';

import './views/home.dart';
import 'common/services/shared_preferences_service/shared_preferences_service.dart';
import 'common/theme/theme.dart';
import 'common/theme/theme_switcher.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferencesService sp = new SharedPreferencesService();
  await sp.loadInstance();
  bool isDark = sp.isDark();

  ThemeMode initialThemeMode;
  if (isDark != null) {
    initialThemeMode = isDark ? ThemeMode.dark : ThemeMode.light;
  }

  runApp(
    ThemeSwitcherWidget(
      initialThemeMode: initialThemeMode,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final String title = 'Dynamic Theme';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: lightThemeData,
      darkTheme: darkThemeData,
      themeMode: ThemeSwitcher.of(context).themeMode,
      home: new MyHomePage(title: title,)
    );
  }
}