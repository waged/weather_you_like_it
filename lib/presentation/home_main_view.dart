// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_you_like_it/app/app_prefs.dart';
import 'package:weather_you_like_it/app/setup_locator.dart';
import 'package:weather_you_like_it/domain/models/city_object.dart';
import 'package:weather_you_like_it/domain/providers/future_providers.dart';
import 'package:weather_you_like_it/domain/providers/internal_providers.dart';
import 'package:weather_you_like_it/resources/assets_manager.dart';
import 'package:weather_you_like_it/resources/values_manager.dart';
import 'package:weather_you_like_it/widgets/fallback_weather_view.dart';
import 'package:weather_you_like_it/widgets/main_weather_view.dart';

class HomeMainView extends ConsumerWidget {
  CityObject cityObject;

  HomeMainView({super.key, required this.cityObject});

  final cityIcons = {
    "Berlin": SVGAssets.berlin,
    "Hamburg": SVGAssets.hamburg,
    "Dortmund": SVGAssets.dortmund,
  };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cities = ref.watch(defaultCitiesProvider);
    final currentIndex = cities.indexWhere(
      (city) => city.lat == cityObject.lat && city.lng == cityObject.lng,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather You Like It!"),
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),
            // Weather information or loading/error state
            Expanded(
              child: ref.watch(getCityWeatherFutureProvider(cityObject)).when(
                    data: (result) => result.fold(
                      (failure) => const FallbackWeatherView(),
                      (weatherResponse) {
                        instanceGetIt.get<AppPreferences>().setWeatherResponse(
                            weatherResponse: weatherResponse);

                        return MainWeatherView(
                            weatherResponse: weatherResponse!);
                      },
                    ),
                    loading: () => const Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
                    error: (error, stackTrace) => const FallbackWeatherView(),
                  ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Your action here
        },
        child: const Icon(
            Icons.location_on_outlined), // Optional: Customize the color
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          cityObject = cities[index];
          ref.invalidate(getCityWeatherFutureProvider);
          instanceGetIt
              .get<AppPreferences>()
              .setFavoriteCity(favCity: cityObject);
        },
        items: cities.map(
          (city) {
            final isSelected = cities.indexOf(city) == currentIndex;
            return BottomNavigationBarItem(
              icon: Stack(
                alignment: Alignment.center,
                children: [
                  if (isSelected)
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue[100],
                      ),
                    ),
                  SvgPicture.asset(
                    cityIcons[city.cityName]!,
                    width: isSelected ? AppSize.s28 : AppSize.s24,
                    height: isSelected ? 28 : 24,
                  ),
                ],
              ),
              label: city.cityName,
            );
          },
        ).toList(),
        selectedItemColor: Colors.blue[900],
        unselectedItemColor: Colors.black,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 12,
        ),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white70,
      ),
    );
  }
}
