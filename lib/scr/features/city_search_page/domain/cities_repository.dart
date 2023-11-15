import 'package:weather_app_dart/scr/core/data/data_source/cities_data_source.dart';
import 'package:weather_app_dart/scr/core/domain/base_repository.dart';
import 'package:weather_app_dart/scr/features/city_search_page/domain/city_entity.dart';

abstract class CityRepository extends BaseRepository {
  CityRepository(super.dataSource);

  List<CityEntity> getListCities(String inputCity);
}

class CityRepositoryImpl<CitySearchDataSource> extends CityRepository {
  CityRepositoryImpl(super.dataSource);

  @override
  List<CityEntity> getListCities(String inputCity) {
    throw UnimplementedError();
  }
}
