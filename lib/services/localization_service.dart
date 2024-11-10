import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalizationService extends ChangeNotifier {
  static const String _languageKey = 'language';
  late SharedPreferences _prefs;
  String _currentLanguage = 'en';

  String get currentLanguage => _currentLanguage;

  Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
    _currentLanguage = _prefs.getString(_languageKey) ?? 'en';
    notifyListeners();
  }

  Future<void> setLanguage(String languageCode) async {
    await _prefs.setString(_languageKey, languageCode);
    _currentLanguage = languageCode;
    notifyListeners();
  }
}