import 'package:weather_app_dart/scr/core/domain/base_entity.dart';

class IndexZoneEntity extends BaseEntity {
  final String key;
  final String city;

  IndexZoneEntity({required this.key, required this.city});

  @override
  List<Object?> get props => [key, city];
}
