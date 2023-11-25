import 'package:weather_app_dart/scr/core/domain/base_entity.dart';

class WeatherEntity extends BaseEntity {
  final String weatherText;
  final double temperature;
  final int weatherIcon;

  WeatherEntity(
      {required this.weatherText,
      required this.temperature,
      required this.weatherIcon});

  @override
  List<Object?> get props => [weatherText, temperature, weatherIcon];
}
