import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/core/constants/app_colors.dart';
import 'package:weather_app/core/constants/app_text_styles.dart';
import 'package:weather_app/core/navigation/routes/app_route_constants.dart';
import 'package:weather_app/features/weather_page/data/data_source/weather_api.dart';
import 'package:weather_app/features/weather_page/data/models/current_weather_model.dart';
import 'package:weather_app/features/weather_page/data/repo_impl/weather_repository_impl.dart';
import 'package:weather_app/features/weather_page/presentation/bloc/weather_bloc.dart';
import 'package:weather_app/features/weather_page/presentation/widgets/loading_widget.dart';
import 'package:weather_app/features/weather_page/presentation/widgets/weather_details_widgets/weather_info.dart';
import 'package:weather_app/features/weather_page/presentation/widgets/weather_details_widgets/weather_tab.dart';

class WeatherDetailsPage extends StatefulWidget {
  const WeatherDetailsPage({super.key, required this.city});
  final String city;

  @override
  State<WeatherDetailsPage> createState() => _WeatherDetailsPageState();
}

class _WeatherDetailsPageState extends State<WeatherDetailsPage>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late WeatherBloc _weatherBloc;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat(reverse: true);

    _weatherBloc = WeatherBloc(
      WeatherRepositoryImpl(weatherApiService: WeatherApiService()),
    );
    _weatherBloc.add(GetForecast(widget.city, 7));
  }

  @override
  void dispose() {
    _controller.dispose();
    _weatherBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => _weatherBloc,
        child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if (state is WeatherLoading) {
              return Container(
                color: AppColors.scaffoldBackgroundColor(context),
                width: double.infinity,
                height: double.infinity,
                child: const LoadingWidget(),
              );
            } else if (state is ForecastWeatherLoaded) {
              return Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.primaryColor(context),
                          AppColors.secondaryColor(context),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: IconButton(
                      onPressed: () {
                        GoRouter.of(context)
                            .pushReplacementNamed(AppRouteConstants.home);
                      },
                      icon: const Icon(Icons.arrow_back),
                      color: Colors.white,
                    ).paddingOnly(top: 24.0),
                  ),
                  SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: WeatherInfo(
                            weather: state.forecastWeather.current as Current,
                            city: widget.city,
                          ),
                        ),
                        WeatherTab(forecast: state.forecastWeather),
                      ],
                    ),
                  ),
                ],
              );
            } else if (state is WeatherError) {
              return Center(
                child: Text(state.message, style: AppTextStyles.error),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
