

bool isCityNameValid(String cityName) {
  final cityNameRegex = RegExp(r'^[a-zA-Z\s\-]+$');
  return cityName.isNotEmpty &&
      cityName.length >= 2 &&
      cityNameRegex.hasMatch(cityName);
}
