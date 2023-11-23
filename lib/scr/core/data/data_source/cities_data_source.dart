import 'package:weather_app_dart/scr/core/data/data_source/base_data_source.dart';
import 'package:weather_app_dart/scr/core/data/models/list_cities_data_model.dart';

class CitySearchDataSource extends BaseDataSource<ListCitiesDataModel> {
  CitySearchDataSource({
    required super.queryParams,
    required super.basePath,
    required super.path,
  });

  @override
  Future<ListCitiesDataModel> fetchData({
    String? additionalPath,
    Map<String, String>? additionalQueryParams,
  }) async {
    final json = await request(
        additionalPath: additionalPath,
        additionalQueryParams: additionalQueryParams);

    return ListCitiesDataModel.fromJson(json);
  }
}
