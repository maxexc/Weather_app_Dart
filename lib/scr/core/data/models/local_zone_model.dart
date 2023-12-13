import 'package:weather_app_dart/scr/core/data/models/base_model.dart';

class LocalZoneModel extends BaseModel {
  final String key;

  LocalZoneModel.fromJson(super.json)
      : key = json['Key'],
        super.fromJson();

  @override
  List<Object?> get props => [key];
}
