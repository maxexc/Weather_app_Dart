import 'package:weather_app_dart/scr/core/data_source/base_entity.dart';

class DataCitiesEntity extends BaseEntity {
  final String cityName;
  final String key;

  DataCitiesEntity.fromJson(super.json)
      : cityName = json['LocalizedName'],
        key = json['Key'],
        super.fromJson();
}
