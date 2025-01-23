import 'package:dartz/dartz.dart';
import 'package:weather_you_like_it/domain/models/responses.dart';

abstract class IAppRepo {
  Future<Either<Failure, WeatherResponse>> getCurrentWeatherData(
    double lat,
    double lon,
  );
}
