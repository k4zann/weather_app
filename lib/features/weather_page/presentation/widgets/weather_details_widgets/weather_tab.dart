import 'package:flutter/material.dart';
import 'package:weather_app/features/weather_page/data/models/forecast_weather_model.dart';
import 'package:weather_app/features/weather_page/presentation/widgets/weather_details_widgets/hourly_forecast_tab.dart';
import 'package:weather_app/features/weather_page/presentation/widgets/weather_details_widgets/weekly_forecast_tab.dart';

class WeatherTab extends StatelessWidget {
  const WeatherTab({super.key, required this.forecast});

  final ForecastWeatherModel forecast;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: 'Hourly Forecast'),
              Tab(text: 'Weekly Forecast'),
            ],
          ),
          SizedBox(
            height: 200,
            child: TabBarView(
              children: [
                HourlyForecastTab(forecast: forecast),
                WeeklyForecastTab(forecast: forecast),
              ],
            ),
          ),
        ],
      ),
    );
  }
}