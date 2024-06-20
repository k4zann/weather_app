import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/features/app/theme_provider.dart';
import 'package:weather_app/features/app/ui/app.dart';

void initApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProviderNotifier()),
      ],
      child: const MyApp(),
    ),
  );
}
