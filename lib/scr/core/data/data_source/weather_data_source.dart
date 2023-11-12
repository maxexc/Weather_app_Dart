import 'package:weather_app_dart/scr/core/data/data_source/base_data_source.dart';
import 'package:weather_app_dart/scr/core/data/models/data_weather_model.dart';

class WeatherSearcDataSource extends BaseDataSource<DataWeatherModel> {
  WeatherSearcDataSource(
      {required super.queryParams,
      required super.basePath,
      required super.path});

  @override
  Future<DataWeatherModel> fetchData({
    String? additionalPath,
    Map<String, String>? additionalQueryParams,
  }) async {
    return DataWeatherModel.fromJson(
      await request(
          additionalPath: additionalPath,
          additionalQueryParams: additionalQueryParams),
    );
  }
}
