import 'package:flutter/material.dart';
import '../theme/theme_switcher.dart';

class ThemeSwitcherBtn extends StatelessWidget {

  IconData _getIcon(BuildContext context) {
    var themeMode = ThemeSwitcher.of(context).themeMode;
    return themeMode == ThemeMode.system ? Icons.brightness_auto : themeMode == ThemeMode.light ? Icons.brightness_high : Icons.brightness_4;
  }

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: CircleBorder(),
      onPressed: (){ThemeSwitcher.of(context).switchTheme();},
      child: new Padding(
        padding: const EdgeInsets.all(12.0),
        child: new Icon(_getIcon(context), color: Theme.of(context).textTheme.button.color),
      ),
    );
  }
}
