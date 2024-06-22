import 'package:weather_app/data/dio_client.dart';
import 'package:weather_app/features/weather_page/data/models/current_weather_model.dart';
import 'package:weather_app/features/weather_page/data/models/forecast_weather_model.dart';

class WeatherApiService {
  WeatherApiService();

  Future<CurrentWeatherModel> getCurrentWeather(String city) async {
    try {
      final response = await dio().get('/current.json', queryParameters: {
        'q': city,
      });
      return CurrentWeatherModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<ForecastWeatherModel> getForecastWeather(String city, int days) async {
    try {
      final response = await dio().get('/forecast.json', queryParameters: {
        'q': city,
        'days': days,
      });
      return ForecastWeatherModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
