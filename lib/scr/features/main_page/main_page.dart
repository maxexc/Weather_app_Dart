import 'package:flutter/material.dart';
import 'package:weather_app_dart/scr/core/assets/app_icons.dart';
import 'package:weather_app_dart/scr/core/assets/app_images.dart';
import 'package:weather_app_dart/scr/core/styles/colors/colors.dart';
import 'package:weather_app_dart/scr/core/styles/text_styles/text_styles.dart';
import 'package:weather_app_dart/scr/core/widgets/app_bar_icon_button.dart';
import 'package:weather_app_dart/scr/core/widgets/main_padding.dart';
import 'package:weather_app_dart/scr/features/data_source/get_current_weather.dart';

const conditionalWeather = 'º ☁️';
var temperature = 0.0;
var weatherText = '';
const descriptionWather = 'You will need 🧣 and 🧤 in';
const city = 'London!';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
              Text(
                '$temperature $conditionalWeather',
                style: AppTextStyles.title,
              ),
              const Spacer(),
              Text(
                "$weatherText",
                style: AppTextStyles.subTitle,
                textAlign: TextAlign.right,
              ),
              Text(
                descriptionWather,
                style: AppTextStyles.subTitle,
                textAlign: TextAlign.right,
              ),
              Text(
                city,
                style: AppTextStyles.subTitle,
                textAlign: TextAlign.right,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Text('+'),
          onPressed: () async {
            print('start');
            final weatherData = await fetchWeatherData();
            setState(() {
              temperature = weatherData.temperature;
              weatherText = weatherData.weatherText;
            });
          },
        ),
      ),
    );
  }
}
