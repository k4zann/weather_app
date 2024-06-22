import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:weather_app/core/constants/app_colors.dart';
import 'package:weather_app/core/constants/app_text_styles.dart';
import 'package:weather_app/features/weather_page/data/data_source/weather_api.dart';
import 'package:weather_app/features/weather_page/data/repo_impl/weather_repository_impl.dart';
import 'package:weather_app/features/weather_page/presentation/widgets/loading_widget.dart';
import 'package:weather_app/features/weather_page/presentation/widgets/weather_tile.dart';
import 'package:weather_app/features/weather_page/presentation/bloc/weather_bloc.dart';

class CityListPage extends StatelessWidget {
  CityListPage({super.key});

  static const List<String> cities = [
    'Astana',
    'Almaty',
    'Yakutsk',
  ];
  Timer? _debounce;
  final TextEditingController _controller = TextEditingController();
  final List<String> searchedList = cities;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor(context),
      body: SafeArea(
        child: BlocProvider(
          create: (context) => WeatherBloc(
            WeatherRepositoryImpl(
              weatherApiService: WeatherApiService(),
            ),
          )..add(LoadInitialCitiesWeather(cities: cities)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Today', style: AppTextStyles.todayTitle)
                  .paddingOnly(bottom: 16.0),
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Search for a location',
                  hintStyle: AppTextStyles.searchPlaceholder,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: AppColors.backgroundColor(context),
                  filled: true,
                  prefixIcon: Icon(Icons.search, color: AppColors.grey),
                ),
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    if (_debounce?.isActive ?? false) _debounce!.cancel();
                    _debounce = Timer(const Duration(milliseconds: 300), () {
                      searchedList.clear();
                      for (final city in cities) {
                        if (city.toLowerCase().contains(value.toLowerCase())) {
                          searchedList.add(city);
                        }
                      }
                      context
                          .read<WeatherBloc>()
                          .add(LoadInitialCitiesWeather(cities: searchedList));
                    });
                  } else {
                    context
                        .read<WeatherBloc>()
                        .add(LoadInitialCitiesWeather(cities: cities));
                  }
                },
              ).paddingOnly(bottom: 20.0),
              Expanded(
                child: BlocBuilder<WeatherBloc, WeatherState>(
                  builder: (context, state) {
                    if (state is WeatherLoading) {
                      return const LoadingWidget();
                    } else if (state is CitiesWeatherLoaded) {
                      return ListView.builder(
                        itemCount: cities.length,
                        itemBuilder: (context, index) {
                          final city = cities[index];
                          final weather = state.weatherData[city];
                          if (weather != null) {
                            return WeatherTile(
                              city: city,
                              temperature: weather.current?.tempC ?? 0,
                              weatherCondition:
                                  weather.current?.condition?.text ?? '',
                            ).paddingOnly(bottom: 16.0);
                          } else {
                            return const LoadingWidget()
                                .paddingOnly(bottom: 16.0);
                          }
                        },
                      );
                    } else if (state is WeatherError) {
                      return Center(
                        child: Text(
                          'Error: ${state.message}',
                          style: AppTextStyles.error,
                        ).paddingOnly(bottom: 16.0),
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
              ),
            ],
          ).paddingAll(24.0),
        ),
      ),
    );
  }
}
