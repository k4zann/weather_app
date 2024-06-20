import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/core/constants/app_colors.dart';
import 'package:weather_app/core/constants/app_text_styles.dart';
import 'package:weather_app/features/weather_page/presentation/widgets/weather_tile.dart';

class CityListPage extends StatelessWidget {
  CityListPage({super.key});

  static const List<String> cities = [
    'Astana',
    'Almaty',
    'Yakutsk',
  ];
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor(context),
      body: SafeArea(
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
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
              ),
              onChanged: (value) {},
            ).paddingOnly(bottom: 20.0),
            Expanded(
              child: ListView.builder(
                itemCount: cities.length,
                itemBuilder: (context, index) {
                  return WeatherTile(city: cities[index])
                      .paddingOnly(bottom: 16.0);
                },
              ),
            ),
          ],
        ).paddingAll(24.0),
      ),
    );
  }
}
