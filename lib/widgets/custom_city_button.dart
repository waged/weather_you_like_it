import 'package:flutter/material.dart';
import 'package:weather_you_like_it/domain/models/city_object.dart';

class CustomCityButton extends StatelessWidget {
  final CityObject cityObject;

  const CustomCityButton({
    super.key,
    required this.cityObject,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        // Handle button press
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${cityObject.cityName} selected')),
        );
      },
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(100, 36),
        textStyle: const TextStyle(fontSize: 16),
      ),
      child: Text(cityObject.cityName),
    );
  }
}
