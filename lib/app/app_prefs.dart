// ignore_for_file: constant_identifier_names
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_you_like_it/domain/models/city_object.dart';
import 'package:weather_you_like_it/domain/models/responses.dart';

const String PREFS_KEY_ONBOARDING = "PREFS_KEY_ONBOARDING";
const String PREFS_KEY_AUTH_RESPONSE = "PREFS_KEY_AUTH_RESPONSE";
const String PREFS_KEY_FAV_CITY = "PREFS_KEY_FAV_CITY";
const String PREFS_KEY_LAST_SUCCESS_CITY = "PREFS_KEY_LAST_SUCCESS_CITY";
const String PREFS_KEY_PERMISSIONS_DIALOG = "PREFS_KEY_PERMISSIONS_DIALOG";
const String PREFS_KEY_METRIC = "PREFS_KEY_METRIC";
const String PREFS_KEY_LANGUAGE = "PREFS_KEY_LANGUAGE";
const String PREFS_KEY_LAST_SUCCESS_CITY_TIMESTAMP =
    "PREFS_KEY_LAST_SUCCESS_TIME";

class AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  void setOnboardingScreenViewed(bool isOnBoarding) async {
    _sharedPreferences.setBool(PREFS_KEY_ONBOARDING, isOnBoarding);
  }

  bool isOnboardingScreenViewed() {
    return _sharedPreferences.getBool(PREFS_KEY_ONBOARDING) ?? false;
  }

  void setLanguage(String language) {
    _sharedPreferences.setString(PREFS_KEY_LANGUAGE, language);
  }

  String getLanguage() {
    return _sharedPreferences.getString(PREFS_KEY_LANGUAGE) ?? "en";
  }

  void setMetric(bool isMetric) async {
    _sharedPreferences.setBool(PREFS_KEY_METRIC, isMetric);
  }

  bool isMetric() {
    return _sharedPreferences.getBool(PREFS_KEY_METRIC) ?? true;
  }

  Future<void> setFavoriteCity({required CityObject favCity}) async {
    final cityJson = jsonEncode(favCity.toJson());
    await _sharedPreferences.setString(PREFS_KEY_FAV_CITY, cityJson);
  }

  Future<CityObject?> getFavoriteCity() async {
    final cityJson = _sharedPreferences.getString(PREFS_KEY_FAV_CITY);
    if (cityJson == null) return null;

    try {
      final Map<String, dynamic> cityMap = jsonDecode(cityJson);
      return CityObject.fromJson(cityMap);
    } catch (e) {
      return null;
    }
  }

  bool isPermissionDialogViewed() {
    return _sharedPreferences.getBool(PREFS_KEY_PERMISSIONS_DIALOG) ?? false;
  }

  void setPermissionDialogViewed({required bool isShown}) {
    _sharedPreferences.setBool(PREFS_KEY_PERMISSIONS_DIALOG, isShown);
  }

  void resetUserData() {
    _sharedPreferences.setBool(PREFS_KEY_ONBOARDING, false);
    _sharedPreferences.setBool(PREFS_KEY_PERMISSIONS_DIALOG, false);
    _sharedPreferences.setString(PREFS_KEY_FAV_CITY, "");
  }

  void setWeatherResponse({required WeatherResponse? weatherResponse}) async {
    final weatherResponseStr = jsonEncode(weatherResponse?.toJson());
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    await _sharedPreferences.setString(
        PREFS_KEY_LAST_SUCCESS_CITY, weatherResponseStr);
    await _sharedPreferences.setInt(
        PREFS_KEY_LAST_SUCCESS_CITY_TIMESTAMP, timestamp);
  }

  Future<WeatherResponse?> getWeatherResponse() async {
    final timestamp =
        _sharedPreferences.getInt(PREFS_KEY_LAST_SUCCESS_CITY_TIMESTAMP);

    // timestamp when there was no request saved before
    if (timestamp == null) {
      return null;
    }
    // Calculate the time difference
    final currentTime = DateTime.now().millisecondsSinceEpoch;
    final timeDifference = currentTime - timestamp;
    // 12 hours to keep the data that is offline..
    if (timeDifference > 12 * 60 * 60 * 1000) {
      return null;
    }
    final weatherResponseStr =
        _sharedPreferences.getString(PREFS_KEY_LAST_SUCCESS_CITY);

    if (weatherResponseStr == null) {
      return null;
    }
    try {
      final Map<String, dynamic> weatherResponse =
          jsonDecode(weatherResponseStr) as Map<String, dynamic>;

      return WeatherResponse.fromJson(weatherResponse);
    } catch (e) {
      return null; // Return null if parsing fails
    }
  }
}
