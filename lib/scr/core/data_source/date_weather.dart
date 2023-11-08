import 'package:weather_app_dart/scr/core/data_source/base_entity.dart';

class DataWeatherEntity extends BaseEntity {
  final String weatherText;
  final double temperature;
  final int weatherIcon;
  DataWeatherEntity.fromJson(super.json)
      : weatherText = json['WeatherText'],
        temperature = json['Temperature']['Metric']['Value'],
        weatherIcon = json['WeatherIcon'],
        super.fromJson();
}
