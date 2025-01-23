import 'package:flutter/cupertino.dart';
import 'package:weather_you_like_it/domain/models/responses.dart';

class MainWeatherView extends StatelessWidget {
  final WeatherResponse? weatherResponse;
  const MainWeatherView({super.key, required this.weatherResponse});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "City: ${weatherResponse?.name}\n"
        "Temperature: ${weatherResponse?.main.temp}°C\n"
        "Condition: ${weatherResponse?.weather.first.description}",
        textAlign: TextAlign.center,
      ),
    );
  }
}
