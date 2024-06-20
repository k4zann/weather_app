import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ThemeProviderNotifier extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeProviderNotifier() {
    SchedulerBinding.instance.platformDispatcher.onPlatformBrightnessChanged =
        _handlePlatformBrightnessChange;
  }

  ThemeMode get themeMode => _themeMode;

  bool get isDarkMode {
    if (_themeMode == ThemeMode.system) {
      final brightness =
          SchedulerBinding.instance.platformDispatcher.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return _themeMode == ThemeMode.dark;
    }
  }

  void toggleTheme(bool isOn) {
    _themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  void _handlePlatformBrightnessChange() {
    if (_themeMode == ThemeMode.system) {
      notifyListeners(); 
    }
  }

  @override
  void dispose() {
    SchedulerBinding.instance.platformDispatcher.onPlatformBrightnessChanged =
        null;
    super.dispose();
  }
}
