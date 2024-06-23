import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/core/navigation/routes/app_route_constants.dart';
import 'package:weather_app/features/weather_page/presentation/pages/city_list_page.dart';
import 'package:weather_app/features/weather_page/presentation/pages/weather_details_page.dart';

class AppRouter {
  GoRouter router = GoRouter(routes: [
    GoRoute(
      name: AppRouteConstants.home,
      path: '/',
      pageBuilder: (context, state) => MaterialPage(child: CityListPage()),
    ),
    GoRoute(
      name: AppRouteConstants.weatherDetails,
      path: '/details/:city',
      pageBuilder: (context, state) =>
          MaterialPage(child: WeatherDetailsPage(city: state.pathParameters['city']!)),
    )
  ]);
}
