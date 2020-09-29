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

  ThemeData newTheme;
  if (isDark != null) {
    newTheme = isDark ? darkThemeData : lightThemeData;
  }

  runApp(
    ThemeSwitcherWidget(
      initialTheme: newTheme,
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
      theme: ThemeSwitcher.of(context).themeData ?? lightThemeData,
      darkTheme: ThemeSwitcher.of(context).themeData ?? darkThemeData,
      themeMode: ThemeMode.system,
      home: new MyHomePage(title: title,)
    );
  }
}