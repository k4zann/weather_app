import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/features/app/theme_provider.dart';
import 'package:weather_app/features/weather_page/presentation/pages/city_list_page.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather Application',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      themeMode: Provider.of<ThemeProviderNotifier>(context).themeMode,
      home: CityListPage(),
    );
  }
}
