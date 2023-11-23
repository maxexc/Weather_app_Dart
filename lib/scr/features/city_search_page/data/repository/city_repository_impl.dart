import 'package:weather_app_dart/scr/core/api/extensions/api_modal_params.dart';
import 'package:weather_app_dart/scr/core/data/data_source/cities_data_source.dart';
import 'package:weather_app_dart/scr/features/city_search_page/domain/cities_repository.dart';
import 'package:weather_app_dart/scr/features/city_search_page/domain/entities/city_entity.dart';

class CityRepositoryImpl extends CityRepository<CitySearchDataSource> {
  CityRepositoryImpl(super.dataSource);

  @override
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
