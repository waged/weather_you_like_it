import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_you_like_it/app/setup_locator.dart';
import 'package:weather_you_like_it/domain/models/city_object.dart';
import 'package:weather_you_like_it/domain/models/responses.dart';
import 'package:weather_you_like_it/domain/services/app_service.dart';

final getCityWeatherFutureProvider = FutureProvider.autoDispose
    .family<Either<Failure, WeatherResponse?>, CityObject>(
  (ref, cityObject) async {
    return await instanceGetIt
        .get<AppService>()
        .getCurrentWeatherData(lat: cityObject.lat, lng: cityObject.lng);
  },
);
