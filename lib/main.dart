import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:weather_app_dart/scr/core/di/main_weather_injection_container.dart'
    as main_weather_injection;
import 'package:weather_app_dart/scr/core/di/external_injection_container.dart'
    as external_enjection;
import 'package:weather_app_dart/scr/core/di/cities_injection_container.dart'
    as cities_injection_container;
import 'package:weather_app_dart/scr/features/main_page/presentation/main_weater_page.dart';
import "package:weather_app_dart/translations/generate/l10n.dart";

void main() async {
  await main_weather_injection.init();
  await external_enjection.init();
  await cities_injection_container.init();
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        IntlLocate.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      locale: const Locale('en'),
      supportedLocales: IntlLocate.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      home: const MainWeatherPage(),
    );
  }
}
