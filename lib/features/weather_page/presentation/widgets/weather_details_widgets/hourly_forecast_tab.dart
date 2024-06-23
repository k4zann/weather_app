import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/core/utils/dateFormatter.dart';
import 'package:weather_app/features/weather_page/data/models/forecast_weather_model.dart';

class HourlyForecastTab extends StatelessWidget {
  const HourlyForecastTab({super.key, required this.forecast});

  final ForecastWeatherModel forecast;

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: forecast.forecast!.forecastday![0].hour!.map((hour) {
        return Column(
          children: [
            Text(
              timeFormat(hour.time!),
              style: const TextStyle(color: Colors.white),
            ).paddingOnly(bottom: 4.0),
            Image.network('http:${hour.condition!.icon!}',
                    width: 36, height: 36)
                .paddingOnly(bottom: 4.0),
            Text(
              '${hour.tempC}°',
              style: const TextStyle(color: Colors.white),
            ).paddingOnly(bottom: 4.0),
            Text(
              '${hour.chanceOfRain}%',
              style: const TextStyle(color: Colors.white54),
            ),
          ],
        ).paddingAll(8.0);
      }).toList(),
    );
  }
}
