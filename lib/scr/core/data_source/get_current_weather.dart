import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:weather_app_dart/scr/core/data_source/date_weather.dart';

const String api = 'LWFUAhBA7AAmO9xIv0WCUOB9s6jmWr6f';
var currentLocation = '167783';

Future<DataWeatherEntity> fetchWeatherData() async {
  var url = Uri.http(
      'dataservice.accuweather.com', 'currentconditions/v1/$currentLocation', {
    'apikey': api,
  });

  var response = await http.get(url);
  if (response.statusCode == 200) {
    var json = convert.jsonDecode(response.body)[0];
    final dataWeather = DataWeatherEntity.fromJson(json);  
    return dataWeather;
  } else {
    throw 'status code = ${response.statusCode}';
  }
}
