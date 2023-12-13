import 'package:weather_app_dart/scr/core/domain/base_entity.dart';

class IndexZoneEntity extends BaseEntity {
  final String key;

  IndexZoneEntity({required this.key});

  @override
  List<Object?> get props => [key];
}
