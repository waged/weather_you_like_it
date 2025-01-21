class CityObject {
  final String cityName;
  final double lat;
  final double lon;

  CityObject({
    required this.cityName,
    required this.lat,
    required this.lon,
  });

  @override
  String toString() => 'CityObject(cityName: $cityName, lat: $lat, lon: $lon)';
}
