import 'package:weather_app_dart/scr/core/data/models/base_model.dart';

class DataCityModel extends BaseModel {
  final String cityName;
  final String key;

  DataCityModel.fromJson(super.json)
      : cityName = json['LocalizedName'],
        key = json['Key'],
        super.fromJson();

  @override
  List<Object?> get props => [cityName, key];
}
