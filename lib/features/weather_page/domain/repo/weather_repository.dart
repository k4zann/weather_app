import 'package:weather_app/features/weather_page/data/models/current_weather_model.dart';
import 'package:weather_app/features/weather_page/data/models/forecast_weather_model.dart';

abstract class WeatherRepository {
  Future<CurrentWeatherModel> getCurrentWeather(String city);
  Future<ForecastWeatherModel> getForecastWeather(String city, int days);
}