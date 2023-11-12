import 'package:flutter/material.dart';
import 'package:weather_app_dart/scr/core/assets/app_icons.dart';
import 'package:weather_app_dart/scr/core/assets/app_images.dart';
import 'package:weather_app_dart/scr/core/data/data_source/weather_data_source.dart';
import 'package:weather_app_dart/scr/core/di/main_weather_injection_container.dart';
import 'package:weather_app_dart/scr/core/styles/colors/colors.dart';
import 'package:weather_app_dart/scr/core/styles/text_styles/text_styles.dart';
import 'package:weather_app_dart/scr/core/utils/logger.dart';
import 'package:weather_app_dart/scr/core/widgets/app_bar_icon_button.dart';
import 'package:weather_app_dart/scr/core/widgets/main_padding.dart';
import 'package:weather_app_dart/scr/features/city_search_page/city_search_page.dart';

const conditionalWeather = 'º ';
var temperature = 0.0;
var weatherText = '';
var weatherIconNumber = 1;
const descriptionWather = 'You will need 🧣 and 🧤 in';
const city = 'London!';

class MainWeatherPage extends StatefulWidget {
  const MainWeatherPage({super.key});

  @override
  State<MainWeatherPage> createState() => _MainWeatherPageState();
}

class _MainWeatherPageState extends State<MainWeatherPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: ExactAssetImage(AppImages.locationBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        appBar: AppBar(
          shadowColor: AppColors.transparent,
          backgroundColor: AppColors.transparent,
          leading: AppBarIconButton(
            icon: AppIcons.nearMe,
            onPressed: () {
              //todo add geolocation
            },
          ),
          actions: [
            AppBarIconButton(
              icon: AppIcons.locationCity,
              onPressed: () {
                //todo add list city
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CitySearchPage()),
                );
              },
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
                city,
                style: AppTextStyles().subTitle,
                textAlign: TextAlign.right,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Text('+'),
          onPressed: () async {
            final weatherDataSource = slMainWeather<WeatherSearcDataSource>();
            final weatherData = await weatherDataSource.fetchData(
              additionalPath: '167783',
            );
            logDebug(weatherData.toString());
            setState(() {
              temperature = weatherData.temperature;
              weatherText = weatherData.weatherText;
              weatherIconNumber = weatherData.weatherIcon;
            });
          },
        ),
      ),
    );
  }
}
