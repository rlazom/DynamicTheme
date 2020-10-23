import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';

import './views/home.dart';
import 'common/services/shared_preferences_service/shared_preferences_service.dart';
import 'common/theme/theme.dart';


void main() async {
  runApp(
    EasyDynamicThemeWidget(
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
        themeMode: EasyDynamicTheme.of(context).themeMode,
        home: new MyHomePage(title: title,)
    );
  }
}
