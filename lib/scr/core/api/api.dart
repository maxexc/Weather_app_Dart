import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:weather_app_dart/scr/core/api/extensions/api_modal_params.dart';
import 'package:weather_app_dart/scr/core/api/extensions/api_model_path.dart';
import 'package:weather_app_dart/scr/core/data/models/base_model.dart';

const String apiKey = 'LWFUAhBA7AAmO9xIv0WCUOB9s6jmWr6f';

const baseUrl = 'dataservice.accuweather.com';

class Api {
  Uri getUriWeather({required String indexCity}) {
    return (Uri.http(baseUrl, ApiPath.getWeatherPath(indexCity),
        {QueryParams.apiKey.value: apiKey}));
  }

  Uri getUriIndexCity(required) {
    throw "err";
  }
}
