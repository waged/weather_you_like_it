// ignore_for_file: constant_identifier_names

const String IMAGE_PATH = "assets/images";
const String JSON_PATH = "assets/json";
const String SVG_PATH = "assets/svgs";

class ImageAssets {
  static const String splashLogo = "$IMAGE_PATH/logo.png";
  static const String onboarding1 = "$IMAGE_PATH/onboarding_1.png";
  static const String onboarding2 = "$IMAGE_PATH/onboarding_2.png";
  static const String onboarding3 = "$IMAGE_PATH/onboarding_3.png";
}

class SVGAssets {
  static const String onboarding1 = "$SVG_PATH/background_1.svg";
  static const String onboarding2 = "$SVG_PATH/background_2.svg";
  static const String onboarding3 = "$SVG_PATH/background_3.svg";
  static const String onboarding4 = "$SVG_PATH/background_4.svg";
  static const String berlin = "$SVG_PATH/berlin.svg";
  static const String hamburg = "$SVG_PATH/hamburg.svg";
  static const String dortmund = "$SVG_PATH/dortmund.svg";
  static const String myLocation = "$SVG_PATH/location_pin.svg";

  static const cityIcons = {
    "Berlin": SVGAssets.berlin,
    "Hamburg": SVGAssets.hamburg,
    "Dortmund": SVGAssets.dortmund,
    "My Location": SVGAssets.myLocation,
  };
}

class JsonAssets {
  //moonCloudRain cloudWind moonClouds moon
  static const String clockSand = "$JSON_PATH/clock_sand.json";
  static const String clockTime = "$JSON_PATH/clock_time.json";
  static const String delete = "$JSON_PATH/delete.json";
  static const String empty = "$JSON_PATH/empty.json";
  static const String error = "$JSON_PATH/error.json";
  static const String loading = "$JSON_PATH/loading.json";
  static const String success = "$JSON_PATH/success_paper_plane.json";
  static const String cloud = "$JSON_PATH/cloud.json";
  static const String cloudRainStorm = "$JSON_PATH/cloud_rain_storm.json";
  static const String cloudStorm = "$JSON_PATH/cloud_storm.json";
  static const String cloudSnow = "$JSON_PATH/cloud_snow.json";
  static const String cloudRain = "$JSON_PATH/cloud_rain.json";
  static const String moonClouds = "$JSON_PATH/moon_clouds.json";
  static const String moon = "$JSON_PATH/moon.json";
  static const String cloudWind = "$JSON_PATH/wind_cloud_new.json";
  static const String moonCloudSnow = "$JSON_PATH/moon_cloud_snow.json";
  static const String sun = "$JSON_PATH/sun.json";
  static const String sunClouds = "$JSON_PATH/sun_clouds.json";
  static const String sunCloudWind = "$JSON_PATH/sun_cloud_wind.json";
  static const String sunCloudStormRain =
      "$JSON_PATH/sun_cloud_storm_rain.json";
  static const String sunCloudSnow = "$JSON_PATH/sun_cloud_snow.json";
  static const String sunCloudRain = "$JSON_PATH/sun_cloud_rain.json";
}
