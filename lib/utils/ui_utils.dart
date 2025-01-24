import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_you_like_it/resources/assets_manager.dart';
import 'package:weather_you_like_it/utils/log_utils.dart';

void scrollToFirst(ScrollController scrollController) {
  scrollController.animateTo(
    scrollController.position.minScrollExtent,
    duration: const Duration(milliseconds: 500),
    curve: Curves.easeOut,
  );
}

void scrollToEnd(ScrollController scrollController) {
  scrollController.animateTo(
    scrollController.position.maxScrollExtent,
    duration: const Duration(milliseconds: 500),
    curve: Curves.easeOut,
  );
}

Widget getAnimatedImage(
    String animationName, double height, double widht, bool isLoop) {
  return SizedBox(
    height: height,
    width: widht,
    child: Lottie.asset(
      animationName,
    ), //json picture
  );
}

Widget loadingEffect(BuildContext context) {
  return Expanded(
    child: SingleChildScrollView(
      child: Shimmer.fromColors(
        baseColor: Colors.grey[500]!,
        highlightColor: Colors.grey[700]!,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: double.infinity, height: 80.0, color: Colors.grey),
              const SizedBox(height: 8.0),
              Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: 80.0,
                  color: Colors.grey),
              const SizedBox(height: 8.0),
              Container(
                  width: double.infinity, height: 80.0, color: Colors.grey),
              const SizedBox(height: 8.0),
              Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: 80.0,
                  color: Colors.grey),
            ],
          ),
        ),
      ),
    ),
  );
}

/*


01d	Clear Sky (Day)	sun.json
01n	Clear Sky (Night)	moon.json
09d	Shower Rain	cloud_rain_storm.json
13d	Snow	cloud_snow.json
11n	Thunderstorm (Night)	cloud_storm.json

 */

String getWeatherAnimation(String? icon) {
  logDebug("the icon is : $icon");
  switch (icon) {
    case '01d': // Clear sky (day)
      return JsonAssets.sun;
    case '01n': // Clear sky (night)
      return JsonAssets.moon;
    case '02d': // Few clouds (day)
      return JsonAssets.sunClouds;
    case '02n': // Few clouds (night)
      return JsonAssets.moonClouds;
    case '03d': // Scattered clouds
    case '03n':
      return JsonAssets.cloud;
    case '04d':
      return JsonAssets.sunClouds;
    case '04n':
      return JsonAssets.cloudWind;
    case '09d':
      return JsonAssets.sunCloudRain;
    case '09n':
      return JsonAssets.cloudRainStorm;
    case '10d': // Rain (day)
      return JsonAssets.sunCloudRain;
    case '10n': // Rain (night)
      return JsonAssets.cloudRain;
    case '11d': // Thunderstorm (day)
      return JsonAssets.sunCloudStormRain;
    case '11n': // Thunderstorm (day)
      return JsonAssets.cloudRainStorm;
    case '13d': // Snow (day)
      return JsonAssets.sunCloudSnow;
    case '13n': // Snow (dnightay)
      return JsonAssets.moonCloudSnow;
    case '50d': // Mist
    case '50n':
      return JsonAssets.cloudWind;
    default:
      return JsonAssets.cloud;
  }
}
