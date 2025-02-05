import 'package:flutter/material.dart';
import 'package:weather_you_like_it/domain/models/responses.dart';
import 'package:weather_you_like_it/resources/values_manager.dart';
import 'package:weather_you_like_it/utils/ui_utils.dart';

class MainWeatherView extends StatelessWidget {
  final WeatherResponse? weatherResponse;

  const MainWeatherView({super.key, required this.weatherResponse});

  @override
  Widget build(BuildContext context) {
    // Get rounded temperature
    final roundedTemp = weatherResponse?.main.temp != null
        ? weatherResponse!.main.temp.round()
        : null;

    // Get condition description
    final condition = weatherResponse?.weather.first.description ?? "Unknown";

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // City Name
            Text(
              weatherResponse?.name ?? "Unknown City",
              style: const TextStyle(
                fontSize: AppSize.s50,
                fontWeight: FontWeight.bold,
              ),
            ),

            getAnimatedImage(
                getWeatherAnimation(weatherResponse?.weather.first.icon),
                300,
                300,
                true),
            Text(
              condition,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            if (roundedTemp != null)
              Center(
                child: Text(
                  " $roundedTemp°",
                  style: TextStyle(
                    fontSize: AppSize.s100,
                    fontWeight: FontWeight.bold,
                    color: roundedTemp < 16 ? Colors.blueAccent : Colors.orange,
                  ),
                ),
              ),

            Text(
              "Min. ${weatherResponse!.main.tempMin.round()}° & Max. ${weatherResponse!.main.tempMax.round()}°",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: AppMargin.m20,
            ),

            Text(
              "${weatherResponse!.main.humidity} %",
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.lightBlueAccent),
              textAlign: TextAlign.center,
            ),

            const SizedBox(
              width: AppMargin.m12,
            ),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
