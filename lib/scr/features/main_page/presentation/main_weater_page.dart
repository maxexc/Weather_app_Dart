import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
import 'package:weather_app_dart/scr/features/main_page/domain/interactors/get_index_zone_interactor.dart';
import 'package:weather_app_dart/translations/generate/l10n.dart';

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

  // CityEntity city = CityEntity(cityName: '', key: '', country: '');
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
                final indexDataZone =
                    await slMainWeather<GetIndexZoneInteractor>().call(coord);
                if (kDebugMode) {
                  print('Key alilua ${indexDataZone.key}');
                }
                await _getWeatherByKey(indexDataZone.key);
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
                IntlLocate.of(context).describeWeather,
                style: AppTextStyles().subTitle,
                textAlign: TextAlign.right,
              ),
              Text(
                city?.cityName ??
                    'city undefine', // if city == null, then 'city undefine'

                // city.cityName.isNotEmpty ? city.cityName : 'city undefine',
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
    await _getWeatherByKey(city?.key);
    setState(() {});
  }

  Future<void> _getWeatherByKey(String? key) async {
    try {
      final weatherDataSource = slMainWeather<WeatherSearcDataSource>();
      final weatherData = await weatherDataSource.fetchData(
        additionalPath: key,
      );
      logDebug(weatherData.toString());

      temperature = weatherData.temperature;
      weatherText = weatherData.weatherText;
      weatherIconNumber = weatherData.weatherIcon;
      // city = city.copyWith(cityName: weatherData.city);
    } catch (e) {
      logDebug(e);
    }
  }
}
