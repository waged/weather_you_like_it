import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:weather_you_like_it/domain/models/responses.dart';
import 'package:weather_you_like_it/repository/app_repo.dart';

class AppService {
  final IAppRepo appRepo;

  AppService({required this.appRepo});

  // Future<Either<Failure, User>> getWeatherData(Long lat, Long lng) async {
  //   return appRepo.getWeatherData(lat, lng);
  // }
}
