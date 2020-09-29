import 'package:dark_mode/common/services/shared_preferences_service/shared_preferences_service.dart';
import 'package:flutter/material.dart';
import 'theme.dart';


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
  final ThemeData initialTheme;
  final Widget child;

  ThemeSwitcherWidget({Key key, @required this.initialTheme, @required this.child})
      : assert(child != null),
        super(key: key);

  @override
  _ThemeSwitcherWidgetState createState() => _ThemeSwitcherWidgetState();
}

class _ThemeSwitcherWidgetState extends State<ThemeSwitcherWidget> {
  ThemeData themeData;
  bool isAuto;
  SharedPreferencesService _prefs;

  @override
  initState() {
    super.initState();
    isAuto = widget.initialTheme == null;
    _loadSharedPreferences();
  }

  Future _loadSharedPreferences() async {
    _prefs = new SharedPreferencesService();
    await _prefs.loadInstance();
  }

  void switchTheme(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    bool forceDark = _prefs.isDark();

    var newTheme = darkModeOn ? darkThemeData : lightThemeData;
    var isNewThemeDark;

    if(forceDark == null) {
      newTheme = lightThemeData;
      isNewThemeDark = false;
    } else {
      if(!forceDark) {
        newTheme = darkThemeData;
        isNewThemeDark = true;
      }
    }

    if(isNewThemeDark == null) {
      isAuto = true;
      _prefs.clearPref(SharePrefsAttribute.IS_DARK);
    } else {
      isAuto = false;
      _prefs.setIsDark(isNewThemeDark);
    }

    setState(() {
      themeData = newTheme;
    });
  }

  @override
  Widget build(BuildContext context) {
    themeData = themeData ?? widget.initialTheme;
    return ThemeSwitcher(
      data: this,
      child: widget.child,
    );
  }
}