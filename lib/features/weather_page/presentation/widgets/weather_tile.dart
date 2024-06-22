import 'package:flutter/material.dart';

class WeatherTile extends StatelessWidget {
  final String city;
  final double temperature;
  final String weatherCondition;

  const WeatherTile({
    Key? key,
    required this.city,
    this.temperature = 0.0,
    this.weatherCondition = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 6,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            city,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${temperature.toStringAsFixed(1)}°C',
                style: const TextStyle(fontSize: 18),
              ),
              Text(
                weatherCondition,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
