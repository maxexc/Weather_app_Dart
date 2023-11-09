import 'package:flutter/material.dart';
import 'package:weather_app_dart/scr/core/di/main_weather_injection_container.dart'
    as main_weather_injection;
import 'package:weather_app_dart/scr/core/di/external_enjection_container.dart'
    as external_enjection;
import 'package:weather_app_dart/scr/features/main_page/main_weater_page.dart';

void main() {
  main_weather_injection.init();
  external_enjection.init();
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MainWeatherPage());
  }
}
