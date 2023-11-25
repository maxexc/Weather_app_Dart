import 'package:flutter/material.dart';
import 'package:weather_app_dart/scr/core/assets/app_icons.dart';
import 'package:weather_app_dart/scr/core/assets/app_images.dart';
import 'package:weather_app_dart/scr/core/data/data_source/geolocator_data_source.dart';
import 'package:weather_app_dart/scr/core/data/data_source/weather_data_source.dart';
import 'package:weather_app_dart/scr/core/di/main_weather_injection_container.dart';
import 'package:weather_app_dart/scr/core/styles/colors/colors.dart';
import 'package:weather_app_dart/scr/core/styles/text_styles/text_styles.dart';
import 'package:weather_app_dart/scr/core/utils/logger.dart';
import 'package:weather_app_dart/scr/core/widgets/app_bar_icon_button.dart';
import 'package:weather_app_dart/scr/core/widgets/background_widget.dart';
import 'package:weather_app_dart/scr/core/widgets/main_padding.dart';
import 'package:weather_app_dart/scr/features/city_search_page/domain/entities/city_entity.dart';
import 'package:weather_app_dart/scr/features/city_search_page/presentation/city_search_page.dart';

const conditionalWeather = 'º ';
var temperature = 0.0;
var weatherText = '';
var weatherIconNumber = 1;
const descriptionWather = 'You will need 🧣 and 🧤 in';
// const city = 'London!';

class MainWeatherPage extends StatefulWidget {
  const MainWeatherPage({super.key});

  @override
  State<MainWeatherPage> createState() => _MainWeatherPageState();
}

class _MainWeatherPageState extends State<MainWeatherPage> {
  CityEntity? city;
  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      assetBackGroundImage: AppImages.locationBackground,
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        appBar: AppBar(
          shadowColor: AppColors.transparent,
          backgroundColor: AppColors.transparent,
          leading: AppBarIconButton(
            icon: AppIcons.nearMe,
            onPressed: () async {
              //todo add geolocation
              final geolocatorDataSource =
                  slMainWeather<GeolocatorDataSource>();
              final isAvailable = await geolocatorDataSource.isAvailable();
              logDebug(isAvailable);
              final permission = await geolocatorDataSource.requestPermission();
              if (permission == true) {
                final coord =
                    await geolocatorDataSource.getCurrentPositionCoordinate();
                logDebug(
                    'ccord: longitude ${coord.longitude}, latitude ${coord.latitude} ');
              }
            },
          ),
          actions: [
            AppBarIconButton(
              icon: AppIcons.locationCity,
              onPressed: _getWeatherByLocalCode,
            ),
          ],
        ),
        body: MainPadding(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              Row(
                children: [
                  Text(
                    '$temperature $conditionalWeather',
                    style: AppTextStyles().title,
                  ),
                  Image.asset('assets/icons/$weatherIconNumber-s.png')
                ],
              ),
              const Spacer(),
              Text(
                weatherText,
                style: AppTextStyles().subTitle,
                textAlign: TextAlign.right,
              ),
              Text(
                descriptionWather,
                style: AppTextStyles().subTitle,
                textAlign: TextAlign.right,
              ),
              Text(
                city?.cityName ??
                    'city undefine', // if city == null, then 'city undefine'
                style: AppTextStyles().subTitle,
                textAlign: TextAlign.right,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _getWeatherByLocalCode() async {
    city = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CitySearchPage()),
    );
    setState(() {});
    logDebug(city);

    try {
      final weatherDataSource = slMainWeather<WeatherSearcDataSource>();
      final weatherData = await weatherDataSource.fetchData(
        additionalPath: city!.key,
      );
      logDebug(weatherData.toString());
      setState(() {
        temperature = weatherData.temperature;
        weatherText = weatherData.weatherText;
        weatherIconNumber = weatherData.weatherIcon;
      });
    } catch (e) {
      logDebug(e);
    }
  }
}
