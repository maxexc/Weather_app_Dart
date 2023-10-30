class DataWeather {
  final String weatherText;
  final double temperature;
  final int weatherIcon;
  DataWeather.fromJson(Map json)
      : weatherText = json['WeatherText'],
        temperature = json['Temperature']['Metric']['Value'],
        weatherIcon = json['WeatherIcon'] {}
}
