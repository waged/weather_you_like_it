import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_you_like_it/domain/services/app_service.dart';
import 'package:weather_you_like_it/repository/app_repo.dart';
import 'package:weather_you_like_it/repository/app_repo_impl.dart';
import 'package:weather_you_like_it/resources/routes_manager.dart';
import 'app_prefs.dart';

final instanceGetIt = GetIt.instance;
Future<void> setupLocator() async {
  // Initialize SharedPreferences
  final sharedPrefs = await SharedPreferences.getInstance();

  // Fetch async values
  final appPreferences = AppPreferences(sharedPrefs);
  final isOnboarding = await appPreferences.isOnboardingScreenViewed();

  // Register dependencies
  instanceGetIt
    ..registerLazySingleton<SharedPreferences>(() => sharedPrefs)
    ..registerLazySingleton<AppPreferences>(() => appPreferences)
    ..registerLazySingleton<RoutesManager>(() {
      return RoutesManager(
        isOnBoarding: isOnboarding,
      );
    })
    ..registerLazySingleton<AppService>(
      () => AppService(appRepo: instanceGetIt<IAppRepo>()),
    )
    ..registerLazySingleton<IAppRepo>(() => AppRepoImpl());
}
