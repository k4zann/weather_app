import 'package:weather_app/features/weather_page/data/data_source/weather_api.dart';
import 'package:weather_app/features/weather_page/data/models/current_weather_model.dart';
import 'package:weather_app/features/weather_page/data/models/forecast_weather_model.dart';
import 'package:weather_app/features/weather_page/domain/repo/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherApiService weatherApiService;

  WeatherRepositoryImpl({
    required this.weatherApiService,
  });

  @override
  Future<CurrentWeatherModel> getCurrentWeather(String city) async {
    try {
      final weather = await weatherApiService.getCurrentWeather(city);
      return weather;
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<ForecastWeatherModel> getForecastWeather(String city, int days) async {
    try {
      final weather = await weatherApiService.getForecastWeather(city, days);
      return weather;
    } on Exception {
      rethrow;
    }
  }
}