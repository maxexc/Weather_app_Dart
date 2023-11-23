import 'package:weather_app_dart/scr/core/domain/base_repository.dart';
import 'package:weather_app_dart/scr/features/main_page/domain/entity/weather_entity.dart';

abstract class WeatherRepository<T> extends BaseRepository<T> {
  WeatherRepository(super.dataSource);

  Future<WeatherEntity> getWeatherIndexLocationZone({
    required String indexLocationZone,
  });
}
