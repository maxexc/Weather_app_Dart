import 'dart:math';

import 'package:weather_app_dart/scr/core/data/models/base_model.dart';

class DataCityModel extends BaseModel {
  final String cityName;
  final String key;
  final String country;

  DataCityModel.fromJson(super.json)
      : cityName = json['LocalizedName'],
        key = json['Key'],
        country = json['Country']['LocalizedName'],
        super.fromJson();

  @override
  List<Object?> get props => [cityName, key];
}
