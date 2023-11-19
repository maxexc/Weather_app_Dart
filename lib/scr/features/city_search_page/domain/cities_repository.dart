import 'package:weather_app_dart/scr/core/api/extensions/api_modal_params.dart';
import 'package:weather_app_dart/scr/core/data/data_source/cities_data_source.dart';
import 'package:weather_app_dart/scr/core/domain/base_repository.dart';
import 'package:weather_app_dart/scr/features/city_search_page/domain/city_entity.dart';

abstract class CityRepository extends BaseRepository {
  CityRepository(super.dataSource);

  Future<List<CityEntity>> getListCities(String inputCity);
}

class CityRepositoryImpl extends BaseRepository<CitySearchDataSource> {
  CityRepositoryImpl(super.dataSource);

  Future<List<CityEntity>> getListCities(String inputCity) async {
    final data = await dataSource.fetchData(
      additionalQueryParams: QueryParams.q.setParams(inputCity),
    );
    return data.listCitiesDataModel
        .map(
          (e) => CityEntity(
            cityName: e.cityName,
            key: e.key,
            country: e.country,
          ),
        )
        .toList();
  }
}
