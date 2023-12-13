import 'package:weather_app_dart/scr/core/domain/base_entity.dart';

class WeatherEntity extends BaseEntity {
  final String weatherText;
  final double temperature;
  final int weatherIcon;
  final String? city;

  WeatherEntity({
    required this.weatherText,
    required this.temperature,
    required this.weatherIcon,
    required this.city,
  });

  @override
  List<Object?> get props => [weatherText, temperature, weatherIcon];
}
