import 'package:flutter/material.dart';

import '../theme/theme_switcher.dart';
import 'circle_icon_button.dart';

class ThemeSwitcherBtn extends StatelessWidget {

  IconData _getIcon(BuildContext context) {
    IconData icon = Icons.brightness_auto;
    bool isAutoThemeData = ThemeSwitcher.of(context).isAuto;
    if(!isAutoThemeData) {
      var themeData = ThemeSwitcher.of(context).themeData;
      icon = themeData.brightness == Brightness.light ? Icons.brightness_high : Icons.brightness_4 ;
    }
    return icon;
  }

  @override
  Widget build(BuildContext context) {
    return CircleIconButton(
      fn: (){ThemeSwitcher.of(context).switchTheme(context);},
      icon: _getIcon(context),
    );
  }
}
