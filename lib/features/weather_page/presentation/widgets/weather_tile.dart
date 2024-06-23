import 'package:flutter/material.dart';
import 'package:weather_app/core/constants/app_colors.dart';
import 'package:weather_app/core/constants/app_text_styles.dart';

class WeatherInformation extends StatelessWidget {
  final int temperature;
  final String cityName;
  final String countryName;
  final String weatherCondition;
  final String weatherIcon;

  const WeatherInformation({
    super.key,
    required this.temperature,
    required this.cityName,
    required this.countryName,
    required this.weatherCondition,
    required this.weatherIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.primaryColor(context),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('$temperature°', style: AppTextStyles.temperature),
              const SizedBox(height: 8),
              Text('$cityName, $countryName', style: AppTextStyles.cityName),
              const SizedBox(height: 8),
              Text(weatherCondition, style: AppTextStyles.weatherCondition)
            ],
          ),
          const Spacer(),
          Image.network(
            'http:$weatherIcon',
            width: 100,
            height: 100,
            errorBuilder: (context, error, stackTrace) {
              return const Icon(Icons.error, size: 100, color: Colors.white);
            },
          ),
        ],
      ),
    );
  }
}
