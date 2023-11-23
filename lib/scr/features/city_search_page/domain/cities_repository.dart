import 'package:weather_app_dart/scr/core/domain/base_repository.dart';
import 'package:weather_app_dart/scr/features/city_search_page/domain/entities/city_entity.dart';

abstract class CityRepository<T> extends BaseRepository<T> {
  CityRepository(super.dataSource);

  Future<List<CityEntity>> getListCities(String inputCity);
}
