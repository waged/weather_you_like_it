// ignore_for_file: constant_identifier_names, depend_on_referenced_packages
import 'package:dartz/dartz.dart';
import 'package:weather_you_like_it/api/api_keys.dart';
import 'package:weather_you_like_it/app/app_prefs.dart';
import 'package:weather_you_like_it/app/setup_locator.dart';
import 'package:weather_you_like_it/domain/models/responses.dart';
import 'package:weather_you_like_it/repository/app_repo.dart';
import 'package:weather_you_like_it/repository/services/api_request_helper.dart';
import 'package:weather_you_like_it/resources/url_manager.dart';

class AppRepoImpl implements IAppRepo {
  AppRepoImpl();

  @override
  Future<Either<Failure, WeatherResponse>> getCurrentWeatherData(
    double lat,
    double lon,
  ) async {
    String unit = await instanceGetIt.get<AppPreferences>().isMetric()
        ? "metric"
        : "standard";
    String? language = await instanceGetIt.get<AppPreferences>().getLanguage();
    final url =
        '${UrlManager.baseCurrentWeatherUrl}?lat=$lat&lon=$lon&lang=$language&units=$unit&appid=${APIKeys.openWeatherAPIKey}';
    return await ApiRequestHelper.getRequest<WeatherResponse>(
      url: url,
      fromJson: (json) => WeatherResponse.fromJson(json),
    );
  }
}
