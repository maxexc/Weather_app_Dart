import 'package:weather_app_dart/scr/core/data/models/base_model.dart';

class LocalZoneModel extends BaseModel {
  final String key;
  final String city;

  LocalZoneModel.fromJson(super.json)
      : key = json['Key'],
        city = json['AdministrativeArea']['EnglishName'],
        super.fromJson();

  @override
  List<Object?> get props => [key];
}
