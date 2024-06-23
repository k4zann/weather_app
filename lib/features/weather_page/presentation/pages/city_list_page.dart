import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/core/constants/app_colors.dart';
import 'package:weather_app/core/constants/app_text_styles.dart';
import 'package:weather_app/core/navigation/routes/app_route_constants.dart';
import 'package:weather_app/features/weather_page/data/data_source/weather_api.dart';
import 'package:weather_app/features/weather_page/data/repo_impl/weather_repository_impl.dart';
import 'package:weather_app/features/weather_page/presentation/widgets/loading_widget.dart';
import 'package:weather_app/features/weather_page/presentation/bloc/weather_bloc.dart';
import 'package:weather_app/features/weather_page/presentation/widgets/weather_tile.dart';

class CityListPage extends StatefulWidget {
  CityListPage({super.key});

  final List<String> cities = [
    'Astana',
    'Almaty',
    'Yakutsk',
  ];

  @override
  State<CityListPage> createState() => _CityListPageState();
}

class _CityListPageState extends State<CityListPage> {
  List<String> get cities => widget.cities;
  Timer? _debounce;

  final TextEditingController _controller = TextEditingController();

  List<String> searchedList = [];

  @override
  void initState() {
    searchedList.addAll(cities);
    super.initState();
  }

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
          )..add(LoadInitialCitiesWeather(cities: searchedList)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Search for a city...',
                  hintStyle: AppTextStyles.searchPlaceholder,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(color: AppColors.greyLight),
                  ),
                  fillColor: AppColors.primaryColor(context),
                  filled: true,
                  prefixIcon: Icon(Icons.search, color: AppColors.grey),
                ),
                style: AppTextStyles.searchPlaceholder,
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
                      setState(() {});
                    });
                  } else {
                    searchedList.clear();
                    searchedList.addAll(cities);
                    setState(() {});
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
                        itemCount: searchedList.length,
                        itemBuilder: (context, index) {
                          final city = searchedList[index];
                          final weather = state.weatherData[city];
                          return InkWell(
                              onTap: () {
                                GoRouter.of(context).pushNamed(
                                    AppRouteConstants.weatherDetails,
                                    pathParameters: {'city': city});
                              },
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              child: WeatherInformation(
                                cityName: city,
                                countryName: weather?.location?.country ?? '',
                                temperature:
                                    weather?.current?.tempC?.toInt() ?? 0,
                                weatherCondition:
                                    weather?.current?.condition?.text ?? '',
                                weatherIcon:
                                    weather?.current?.condition?.icon ?? '',
                              )).paddingOnly(bottom: 16.0);
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
