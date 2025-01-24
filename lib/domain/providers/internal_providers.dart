// Define a provider for cities
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_you_like_it/domain/models/city_object.dart';

final defaultCitiesProvider = Provider.autoDispose<List<CityObject>>(
  (ref) {
    return [
      CityObject(cityName: 'Berlin', lat: 52.5200, lng: 13.4050),
      CityObject(cityName: 'Dortmund', lat: 51.5136, lng: 7.4653),
      CityObject(cityName: 'Hamburg', lat: 53.5511, lng: 9.9937),
      
    ];
  },
);
