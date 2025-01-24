// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:location/location.dart';
import 'package:weather_you_like_it/app/app_prefs.dart';
import 'package:weather_you_like_it/app/setup_locator.dart';
import 'package:weather_you_like_it/domain/models/city_object.dart';
import 'package:weather_you_like_it/domain/providers/future_providers.dart';
import 'package:weather_you_like_it/domain/providers/internal_providers.dart';
import 'package:weather_you_like_it/generated/l10n.dart';
import 'package:weather_you_like_it/resources/values_manager.dart';
import 'package:weather_you_like_it/widgets/fallback_weather_view.dart';
import 'package:weather_you_like_it/widgets/main_weather_view.dart';

class HomeMainView extends ConsumerWidget {
  CityObject cityObject;

  HomeMainView({super.key, required this.cityObject});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cities = ref.watch(defaultCitiesProvider);

    final updatedCities = [
      ...cities,
      CityObject(
        cityName: S.current.myLocation,
        lat: 0.0,
        lng: 0.0,
      ),
    ];

    final currentIndex = updatedCities.indexWhere(
      (city) =>
          city.cityName == cityObject.cityName &&
          city.lat == cityObject.lat &&
          city.lng == cityObject.lng,
    );

    // Adjust currentIndex to ensure it is valid
    final adjustedIndex =
        currentIndex == -1 ? updatedCities.length - 1 : currentIndex;

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
                        // Save the weather data for offline use
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: adjustedIndex,
        onTap: (index) async {
          final messenger = ScaffoldMessenger.of(context);

          if (index == updatedCities.length - 1) {
            // "My Location" selected, fetch user location
            Location location = Location();

            bool serviceEnabled = await location.serviceEnabled();
            if (!serviceEnabled) {
              serviceEnabled = await location.requestService();
              if (!serviceEnabled) {
                messenger.showSnackBar(
                  SnackBar(
                    content: Text(S.current.locationDisabled),
                    backgroundColor: Colors.red,
                  ),
                );
                return;
              }
            }

            PermissionStatus permissionGranted = await location.hasPermission();
            if (permissionGranted == PermissionStatus.denied) {
              permissionGranted = await location.requestPermission();
              if (permissionGranted != PermissionStatus.granted) {
                messenger.showSnackBar(
                  SnackBar(
                    content: Text(S.current.locationPermissionDenied),
                    backgroundColor: Colors.red,
                  ),
                );
                return;
              }
            }

            final locationData = await location.getLocation();
            if (locationData.latitude != null &&
                locationData.longitude != null) {
              cityObject = CityObject(
                cityName: S.current.myLocation,
                lat: locationData.latitude!,
                lng: locationData.longitude!,
              );

              // Save for offline refresh
              instanceGetIt
                  .get<AppPreferences>()
                  .setFavoriteCity(favCity: cityObject);

              // Refresh provider
              ref.invalidate(getCityWeatherFutureProvider);
            } else {
              messenger.showSnackBar(
                SnackBar(
                  content: Text(S.current.failedToGetLocation),
                  backgroundColor: Colors.red,
                ),
              );
            }
          } else {
            // Handle other cities
            cityObject = updatedCities[index];
            ref.invalidate(getCityWeatherFutureProvider);

            // Save for offline refresh
            instanceGetIt
                .get<AppPreferences>()
                .setFavoriteCity(favCity: cityObject);
          }
        },
        items: updatedCities.map(
          (city) {
            final isSelected = updatedCities.indexOf(city) == adjustedIndex;
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
                    height: isSelected ? AppSize.s28 : AppSize.s24,
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
