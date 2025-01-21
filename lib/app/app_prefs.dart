// ignore_for_file: constant_identifier_names
import 'package:shared_preferences/shared_preferences.dart';

const String PREFS_KEY_ONBOARDING = "PREFS_KEY_ONBOARDING";
const String PREFS_KEY_AUTH_RESPONSE = "PREFS_KEY_AUTH_RESPONSE";
const String PREFS_KEY_FAV_CITY = "PREFS_KEY_FAV_CITY";
const String PREFS_KEY_PERMISSIONS_DIALOG = "PREFS_KEY_PERMISSIONS_DIALOG";

class AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  Future<void> setOnboardingScreenViewed(bool isOnBoarding) async {
    _sharedPreferences.setBool(PREFS_KEY_ONBOARDING, isOnBoarding);
  }

  Future<bool> isOnboardingScreenViewed() async {
    return _sharedPreferences.getBool(PREFS_KEY_ONBOARDING) ?? false;
  }

  Future<void> setFavoriteCity({required String favCity}) async {
    _sharedPreferences.setString(PREFS_KEY_FAV_CITY, favCity);
  }

  Future<String> getFavoriteCity() async {
    return _sharedPreferences.getString(PREFS_KEY_FAV_CITY) ?? "";
  }

  Future<bool> isPermissionDialogViewed() async {
    return _sharedPreferences.getBool(PREFS_KEY_PERMISSIONS_DIALOG) ?? false;
  }

  Future<void> setPermissionDialogViewed({required bool isShown}) async {
    _sharedPreferences.setBool(PREFS_KEY_PERMISSIONS_DIALOG, isShown);
  }

  void resetUserData() {
    _sharedPreferences.setBool(PREFS_KEY_ONBOARDING, false);
    _sharedPreferences.setBool(PREFS_KEY_PERMISSIONS_DIALOG, false);
    _sharedPreferences.setString(PREFS_KEY_FAV_CITY, "");
  }
}
