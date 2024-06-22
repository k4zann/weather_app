part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetCurrentWeather extends WeatherEvent {
  final String city;

  GetCurrentWeather(this.city);

  @override
  List<Object> get props => [city];
}

class GetForecast extends WeatherEvent {
  final String city;
  final int days;

  GetForecast(this.city, this.days);

  @override
  List<Object> get props => [city, days];
}

class LoadInitialCitiesWeather extends WeatherEvent {
  final List<String> cities;

  LoadInitialCitiesWeather({required this.cities});

  @override
  List<Object> get props => [cities];
}
