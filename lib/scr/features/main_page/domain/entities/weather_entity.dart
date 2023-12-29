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
    this.city,
  });

  @override
  List<Object?> get props => [weatherText, temperature, weatherIcon];

  WeatherEntity copyWith({
    String? weatherText,
    double? temperature,
    int? weatherIcon,
    String? city,
  }) {
    return WeatherEntity(
      weatherText: weatherText ?? this.weatherText,
      temperature: temperature ?? this.temperature,
      weatherIcon: weatherIcon ?? this.weatherIcon,
      city: city ?? this.city,
    );
  }
}
