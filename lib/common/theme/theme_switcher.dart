import 'package:dark_mode/common/services/shared_preferences_service/shared_preferences_service.dart';
import 'package:flutter/material.dart';


class ThemeSwitcher extends InheritedWidget {
  final _ThemeSwitcherWidgetState data;

  const ThemeSwitcher({
    Key key,
    @required this.data,
    @required Widget child,
  })  : assert(child != null),
        super(key: key, child: child);

  static _ThemeSwitcherWidgetState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeSwitcher>().data;
  }

  @override
  bool updateShouldNotify(ThemeSwitcher old) {
    return this != old;
  }
}


class ThemeSwitcherWidget extends StatefulWidget {
  final ThemeMode initialThemeMode;
  final Widget child;

  ThemeSwitcherWidget({Key key, this.initialThemeMode, @required this.child})
      : assert(child != null),
        super(key: key);

  @override
  _ThemeSwitcherWidgetState createState() => _ThemeSwitcherWidgetState();
}

class _ThemeSwitcherWidgetState extends State<ThemeSwitcherWidget> {
  ThemeMode themeMode;
  SharedPreferencesService _prefs;

  @override
  initState() {
    super.initState();
    _loadSharedPreferences();
  }

  Future _loadSharedPreferences() async {
    themeMode = widget.initialThemeMode;
    _prefs = new SharedPreferencesService();
    await _prefs.loadInstance();
    bool isDark = _prefs.isDark();
    if (isDark != null) {
      themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    }
  }

  void switchTheme() {
    bool forceDark = _prefs.isDark();

    var newThemeMode = ThemeMode.system;
    var isNewThemeDark;

    if(forceDark == null) {
      newThemeMode = ThemeMode.light;
      isNewThemeDark = false;
    } else {
      if(!forceDark) {
        newThemeMode = ThemeMode.dark;
        isNewThemeDark = true;
      }
    }

    if(isNewThemeDark == null) {
      _prefs.clearPref(SharePrefsAttribute.IS_DARK);
    } else {
      _prefs.setIsDark(isNewThemeDark);
    }

    setState(() {
      themeMode = newThemeMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    themeMode = themeMode ?? ThemeMode.system;
    return ThemeSwitcher(
      data: this,
      child: widget.child,
    );
  }
}