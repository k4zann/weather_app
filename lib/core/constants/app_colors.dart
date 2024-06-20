import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/features/app/theme_provider.dart';

class AppColors {
  static Color primaryColor(BuildContext context) =>
      Provider.of<ThemeProviderNotifier>(context).isDarkMode
          ? const Color(0xff2196f3)
          : AppColors.black;

  static Color black = const Color(0xff000000);

  static Color white = const Color(0xffffffff);

  static Color grey = const Color(0xff9e9e9e);

  static Color greyLight = const Color(0xffe0e0e0);

  static Color greyDark = const Color(0xff616161);

  static Color blue = const Color(0xff2196f3);

  static Color red = const Color(0xffe57373);

  static Color green = const Color(0xff81c784);

  static Color yellow = const Color(0xffffeb3b);

  static Color scaffoldBackgroundColor(BuildContext context) =>
      Provider.of<ThemeProviderNotifier>(context).isDarkMode
          ? const Color(0xff141414)
          : const Color(0xfff7f7f6);

  static Color backgroundColor(BuildContext context) =>
      Provider.of<ThemeProviderNotifier>(context).isDarkMode
          ? const Color(0xff272727)
          : const Color.fromARGB(255, 236, 236, 236);
}
