part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class CurrentWeatherLoaded extends WeatherState {
  final CurrentWeatherModel currentWeather;

  CurrentWeatherLoaded({required this.currentWeather});

  @override
  List<Object> get props => [currentWeather];
}

class ForecastWeatherLoaded extends WeatherState {
  final ForecastWeatherModel forecastWeather;

  ForecastWeatherLoaded({required this.forecastWeather});

  @override
  List<Object> get props => [forecastWeather];
}

class WeatherError extends WeatherState {
  final String message;

  WeatherError({required this.message});

  @override
  List<Object> get props => [message];
}


class CitiesWeatherLoaded extends WeatherState {
  final Map<String, CurrentWeatherModel> weatherData;

  CitiesWeatherLoaded(this.weatherData);

  @override
  List<Object> get props => [weatherData];
}