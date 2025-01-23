class CityObject {
  final String cityName;
  final double lat;
  final double lng;

  CityObject({
    required this.cityName,
    required this.lat,
    required this.lng,
  });

// for saving user's favorite city to be shown at the begining.
//toJson
  Map<String, dynamic> toJson() {
    return {
      'cityName': cityName,
      'lat': lat,
      'lng': lng,
    };
  }

  // Create from JSON
  factory CityObject.fromJson(Map<String, dynamic> json) {
    return CityObject(
      cityName: json['cityName'],
      lat: json['lat'],
      lng: json['lng'],
    );
  }

  @override
  String toString() => 'CityObject(cityName: $cityName, lat: $lat, lng: $lng)';
}
