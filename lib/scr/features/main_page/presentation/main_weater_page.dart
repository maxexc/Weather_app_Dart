import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:weather_app_dart/scr/core/assets/app_icons.dart';
import 'package:weather_app_dart/scr/core/assets/app_images.dart';
import 'package:weather_app_dart/scr/core/data/data_source/geolocator_data_source.dart';
import 'package:weather_app_dart/scr/core/di/main_weather_injection_container.dart';
import 'package:weather_app_dart/scr/core/styles/colors/colors.dart';
import 'package:weather_app_dart/scr/core/styles/text_styles/text_styles.dart';
import 'package:weather_app_dart/scr/core/utils/logger.dart';
import 'package:weather_app_dart/scr/core/widgets/app_bar_icon_button.dart';
import 'package:weather_app_dart/scr/core/widgets/background_widget.dart';
import 'package:weather_app_dart/scr/core/widgets/main_padding.dart';
import 'package:weather_app_dart/scr/features/city_search_page/presentation/city_search_page.dart';
import 'package:weather_app_dart/scr/features/main_page/domain/entities/weather_entity.dart';
import 'package:weather_app_dart/scr/features/main_page/domain/interactors/get_weather_by_index_zone_interactor.dart';
import 'package:weather_app_dart/scr/features/main_page/domain/interactors/get_weather_by_key_city.dart';
import 'package:weather_app_dart/translations/generate/l10n.dart';

const conditionalWeather = 'º ';
const descriptionWather = '';
var weatherEntity = WeatherEntity(
  weatherText: descriptionWather,
  temperature: 0,
  weatherIcon: 1,
);

class MainWeatherPage extends StatefulWidget {
  const MainWeatherPage({super.key});

  @override
  State<MainWeatherPage> createState() => _MainWeatherPageState();
}

class _MainWeatherPageState extends State<MainWeatherPage> {
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
              final geolocatorDataSource =
                  slMainWeather<GeolocatorDataSource>();
              final isAvailable = await geolocatorDataSource.isAvailable();
              logDebug(isAvailable);
              final permission = await geolocatorDataSource.requestPermission();
              if (permission == true) {
                final coord =
                    await geolocatorDataSource.getCurrentPositionCoordinate();
                final getWeatherInteractor =
                    slMainWeather<GetWeatherByIndexZoneInteractor>();
                weatherEntity = await getWeatherInteractor.call(coord);
                setState(() {});
              }
            },
          ),
          actions: [
            AppBarIconButton(
              icon: AppIcons.locationCity,
              onPressed: _getWeatherByLocalCode,
            ),
            Padding(
                padding: const EdgeInsets.only(right: 20),
                child: AppBarIconButton(
                    onPressed: () {
                      final currenLanguage = Intl.getCurrentLocale();
                      final listLanguages = IntlLocate.delegate.supportedLocales
                          .map((e) => e.languageCode)
                          .toList();
                      for (var i = 0; i < listLanguages.length; i++) {
                        if (currenLanguage == listLanguages[i]) {
                          IntlLocate.load(Locale(i == listLanguages.length - 1
                              ? listLanguages[0]
                              : listLanguages[i + 1]));
                        }
                      }
                      setState(() {});
                    },
                    icon: Icons.language)),
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
                    '${weatherEntity.temperature} $conditionalWeather',
                    style: AppTextStyles().title,
                  ),
                  Image.asset('assets/icons/${weatherEntity.weatherIcon}-s.png')
                ],
              ),
              const Spacer(),
              Text(
                weatherEntity.weatherText,
                style: AppTextStyles().subTitle,
                textAlign: TextAlign.right,
              ),
              Text(
                IntlLocate.of(context).describeWeather,
                style: AppTextStyles().subTitle,
                textAlign: TextAlign.right,
              ),
              Text(
                weatherEntity.city ??
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
    final cityEntity = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CitySearchPage()),
    );
    setState(() {});
    final getWeatherByKeyCity = slMainWeather<GetWeatherByKeyCity>();
    weatherEntity = await getWeatherByKeyCity.call(cityEntity);

    setState(() {});
  }
}
