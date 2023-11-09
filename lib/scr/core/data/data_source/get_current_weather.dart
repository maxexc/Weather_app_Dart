import 'package:http/http.dart' as http;
import 'package:weather_app_dart/scr/core/data/data_source/base_data_source.dart';
import 'package:weather_app_dart/scr/core/data/models/data_cities_model.dart';
import 'dart:convert' as convert;

import 'package:weather_app_dart/scr/core/data/models/data_weather_model.dart';
import 'package:weather_app_dart/scr/core/data/models/location_model.dart';
import 'package:weather_app_dart/scr/features/city_search_page/city_search_page.dart';

const String api = 'LWFUAhBA7AAmO9xIv0WCUOB9s6jmWr6f';
var currentLocation = '167783';

// abstract class WeatherDataSource extends BaseDataSource {
//   Future<DataWeatherModel> fetchWeatherData();
//   Future<DataCitiesModel> fetchIndexCity();
// }

// class WeatherDataSourceImplantation extends WeatherDataSource {
//   @override
//   Future<DataCitiesModel> fetchIndexCity() {
//     // TODO: implement fetchIndexCity
//     throw UnimplementedError();
//   }

//   @override
//   Future<DataWeatherModel> fetchWeatherData() {
//     // TODO: implement fetchWeatherData
//     throw UnimplementedError();
//   }
// }

class WeatherDataSource extends BaseDataSource<DataWeatherModel> {
  WeatherDataSource({
    required super.quaryParams,
    required super.path, required super.basePath,
  });


}

// Future<DataWeatherModel> fetchWeatherData() async {
//   var url = Uri.http(
//       'dataservice.accuweather.com', 'currentonditions/v1/$currentLocation', {
//     'apikey': api,
//   });
c
//   var response = await http.get(url);
//   if (response.statusCode == 200) {
//     var json = convert.jsonDecode(response.body)[0];
//     final dataWeather = DataWeatherModel.fromJson(json);
//     return dataWeather;
//   } else {
//     throw 'status code = ${response.statusCode}';
//   }
// }
