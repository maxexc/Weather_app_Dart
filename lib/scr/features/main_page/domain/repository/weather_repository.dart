import 'package:weather_app_dart/scr/core/domain/base_repository.dart';
import 'package:weather_app_dart/scr/features/main_page/domain/entities/weather_entity.dart';

abstract class WeatherRepository<T> extends BaseRepository {
  WeatherRepository(super.dataSource);

  Future<WeatherEntity> getIndexLocationZone(
      {required String indexLocationZone});
}
