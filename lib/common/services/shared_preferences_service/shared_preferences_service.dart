import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

enum SharePrefsAttribute{
  IS_DARK,
}

class SharedPreferencesService {
  SharedPreferences prefs;

  String _getAttributeStr(SharePrefsAttribute attribute){
    return attribute == SharePrefsAttribute.IS_DARK ? 'is_dark'
        : '';
  }

  Future loadInstance() async => prefs = await SharedPreferences.getInstance();

  bool isDark() => prefs.getBool(_getAttributeStr(SharePrefsAttribute.IS_DARK));
  setIsDark(bool value) => prefs.setBool(_getAttributeStr(SharePrefsAttribute.IS_DARK), value);

  clearPref(SharePrefsAttribute attribute) => prefs.remove(_getAttributeStr(attribute));
}