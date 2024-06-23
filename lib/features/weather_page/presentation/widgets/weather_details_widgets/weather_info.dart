import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/core/constants/app_text_styles.dart';
import 'package:weather_app/features/weather_page/data/models/current_weather_model.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({super.key, required this.weather, required this.city});
  final String city;
  final Current weather;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(city,
            style: AppTextStyles.cityName.copyWith(
              fontSize: 36,
            )).paddingOnly(top: 16.0),
        Text(
          '${weather.tempC}°',
          style: AppTextStyles.temperature.copyWith(
            fontSize: 96
          )
        ),
        Text(
          weather.condition!.text!,
          style: AppTextStyles.weatherCondition.copyWith(
            fontSize: 24
            )
        ),
        Image.network(
          'http:${weather.condition!.icon}',
          width: 100,
          height: 100,
          errorBuilder: (context, error, stackTrace) {
            return const Icon(Icons.error, size: 100, color: Colors.white);
          },
        )
      ],
    );
  }
}
