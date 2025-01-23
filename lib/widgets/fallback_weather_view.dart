import 'package:flutter/material.dart';
import 'package:weather_you_like_it/app/app_prefs.dart';
import 'package:weather_you_like_it/app/setup_locator.dart';
import 'package:weather_you_like_it/domain/models/responses.dart';
import 'package:weather_you_like_it/generated/l10n.dart';
import 'package:weather_you_like_it/resources/assets_manager.dart';
import 'package:weather_you_like_it/utils/ui_utils.dart';
import 'package:weather_you_like_it/widgets/main_weather_view.dart';

class FallbackWeatherView extends StatelessWidget {
  const FallbackWeatherView({super.key});

  @override
  Widget build(BuildContext context) {
    final appPreferences = instanceGetIt.get<AppPreferences>();

    return FutureBuilder<WeatherResponse?>(
      future: appPreferences.getWeatherResponse(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator.adaptive());
        } else if (snapshot.hasData && snapshot.data != null) {
          final dataSaved = snapshot.data!;
          return MainWeatherView(weatherResponse: dataSaved);
        }
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              getAnimatedImage(JsonAssets.empty, 300, 300, true),
              const SizedBox(height: 16),
              Text(
                S.current.noDataFound,
                style: const TextStyle(fontSize: 16, color: Colors.red),
              ),
            ],
          ),
        );
      },
    );
  }
}
