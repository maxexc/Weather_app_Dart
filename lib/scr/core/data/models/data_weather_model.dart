import 'package:weather_app_dart/scr/core/data/models/base_model.dart';

class DataWeatherModel extends BaseModel {
  final String weatherText;
  final double temperature;
  final int weatherIcon;
  final String? city;
  DataWeatherModel.fromJson(super.json)
      : weatherText = json[0]['WeatherText'],
        temperature = json[0]['Temperature']['Metric']['Value'],
        weatherIcon = json[0]['WeatherIcon'],
        city = "json[0]['AdministrativeArea']['EnglishName']",
        super.fromJson();

  @override
  List<Object?> get props => [weatherIcon, weatherText, temperature];
}
