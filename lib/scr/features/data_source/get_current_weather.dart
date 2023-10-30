import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:weather_app_dart/scr/features/data_source/date_weather.dart';

const String api = 'rYV6RIu503f0dI4vSwuX8QfoygoNZrYq';
var currentLocation = '167783';

Future<DataWeather> fetchWeatherData() async {
  var url = Uri.http(
      'dataservice.accuweather.com', 'currentconditions/v1/$currentLocation', {
    'apikey': api,
  });

  var response = await http.get(url);
  if (response.statusCode == 200) {
    var json = convert.jsonDecode(response.body)[0];
    final dataWeather = DataWeather.fromJson(json);
    return dataWeather;
  } else {
    print('Request failed with status: ${response.statusCode}.');
    throw 'status code = ${response.statusCode}';
  }
}
