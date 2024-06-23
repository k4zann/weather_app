import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/features/weather_page/data/models/current_weather_model.dart';
import 'package:weather_app/features/weather_page/data/models/forecast_weather_model.dart';
import 'package:weather_app/features/weather_page/domain/repo/weather_repository.dart';

part 'weather_state.dart';
part 'weather_event.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc(this.weatherRepository) : super(WeatherInitial()) {
    on<GetCurrentWeather>(_onGetCurrentWeather);
    on<GetForecast>(_onGetForecast);
    on<LoadInitialCitiesWeather>(_onLoadInitialCitiesWeather);
  }

  Future<void> _onLoadInitialCitiesWeather(
      LoadInitialCitiesWeather event, Emitter<WeatherState> emit) async {
    emit(WeatherLoading());
    try {
      final Map<String, CurrentWeatherModel> weatherData = {};
      for (String city in event.cities) {
        final currentWeather = await weatherRepository.getCurrentWeather(city);
        weatherData[city] = currentWeather;
      }
      emit(CitiesWeatherLoaded(weatherData));
    } catch (e) {
      emit(WeatherError(message: e.toString()));
    }
  }

  Future<void> _onGetCurrentWeather(
      GetCurrentWeather event, Emitter<WeatherState> emit) async {
    emit(WeatherLoading());
    try {
      final currentWeather =
          await weatherRepository.getCurrentWeather(event.city);
      emit(CurrentWeatherLoaded(currentWeather: currentWeather));
    } catch (e) {
      emit(WeatherError(message: e.toString()));
    }
  }

  Future<void> _onGetForecast(
      GetForecast event, Emitter<WeatherState> emit) async {
    emit(WeatherLoading());
    try {
      final forecastWeather =
          await weatherRepository.getForecastWeather(event.city, event.days);
      emit(ForecastWeatherLoaded(forecastWeather: forecastWeather));
    } catch (e) {
      emit(WeatherError(message: e.toString()));
    }
  }
}
