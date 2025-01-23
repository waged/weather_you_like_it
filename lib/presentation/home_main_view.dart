import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_you_like_it/app/app_prefs.dart';
import 'package:weather_you_like_it/app/setup_locator.dart';
import 'package:weather_you_like_it/domain/models/city_object.dart';
import 'package:weather_you_like_it/domain/models/responses.dart';
import 'package:weather_you_like_it/domain/providers/future_providers.dart';
import 'package:weather_you_like_it/domain/providers/internal_providers.dart';
import 'package:weather_you_like_it/resources/assets_manager.dart';
import 'package:weather_you_like_it/utils/log_utils.dart';
import 'package:weather_you_like_it/utils/ui_utils.dart';
import 'package:weather_you_like_it/widgets/main_weather_view.dart';


class HomeMainView extends ConsumerWidget {
  CityObject cityObject;
  HomeMainView({super.key, required this.cityObject});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cities = ref.watch(defaultCitiesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather You Like it!"),
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Horizontal list of buttons for cities
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: cities.map((city) {
                  // city name returned from the api is not as descriptive as the default names.
                  // comparing with the lat and lng.

                  final isSelected =
                      city.lat == cityObject.lat && city.lng == cityObject.lng;

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isSelected
                            ? Colors.blueAccent
                            : Colors.grey.shade300,
                        foregroundColor:
                            isSelected ? Colors.white : Colors.black,
                      ),
                      onPressed: () async {
                        cityObject = city;
                        logDebug("Selected city: ${city.cityName}");
                        ref.invalidate(getCityWeatherFutureProvider);
                        instanceGetIt
                            .get<AppPreferences>()
                            .setFavoriteCity(favCity: city);
                      },
                      child: Text(city.cityName),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 16),

            Expanded(
              child: ref.watch(getCityWeatherFutureProvider(cityObject)).when(
                    data: (result) => result.fold(
                      (failure) {
                        return FutureBuilder<WeatherResponse?>(
                          future: instanceGetIt
                              .get<AppPreferences>()
                              .getWeatherResponse(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator.adaptive(),
                              );
                            } else if (snapshot.hasData &&
                                snapshot.data != null) {
                              final dataSaved = snapshot.data!;
                              return MainWeatherView(
                                  weatherResponse: dataSaved);
                            } else {
                              return Center(
                                child: getAnimatedImage(
                                    JsonAssets.empty, 300, 300, true),
                              );
                            }
                          },
                        );
                      },
                      (weatherResponse) {
                        // save this object when there's no internet:
                        instanceGetIt.get<AppPreferences>().setWeatherResponse(
                            weatherResponse: weatherResponse);

                        return MainWeatherView(
                          weatherResponse: weatherResponse!,
                        );
                      },
                    ),
                    loading: () => const Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
                    error: (error, stackTrace) {
                      return FutureBuilder<WeatherResponse?>(
                        future: instanceGetIt
                            .get<AppPreferences>()
                            .getWeatherResponse(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator.adaptive(),
                            );
                          } else if (snapshot.hasData &&
                              snapshot.data != null) {
                            final dataSaved = snapshot.data!;
                            return MainWeatherView(
                              weatherResponse: dataSaved,
                            );
                          } else {
                            return Center(
                              child: getAnimatedImage(
                                  JsonAssets.empty, 300, 300, true),
                            );
                          }
                        },
                      );
                    },
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
