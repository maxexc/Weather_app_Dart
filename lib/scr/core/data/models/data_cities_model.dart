import 'package:weather_app_dart/scr/core/data/models/base_model.dart';

class DataCitiesModel extends BaseModel {
  final String cityName;
  final String key;

  DataCitiesModel.fromJson(super.json)
      : cityName = json['LocalizedName'],
        key = json['Key'],
        super.fromJson();

  @override
  List<Object?> get props => [cityName, key];
}
