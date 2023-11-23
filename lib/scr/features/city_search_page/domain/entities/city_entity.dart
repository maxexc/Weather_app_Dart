import 'package:weather_app_dart/scr/core/domain/base_entity.dart';

class CityEntity extends BaseEntity {
  final String cityName;
  final String key;
  final String country;

  CityEntity({
    required this.cityName,
    required this.key,
    required this.country,
  });

  @override
  List<Object?> get props => [cityName, key, country];
}
