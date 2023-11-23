import 'package:weather_app_dart/scr/core/data/data_source/weather_data_source.dart';
import 'package:weather_app_dart/scr/features/main_page/domain/entities/weather_entity.dart';
import 'package:weather_app_dart/scr/features/main_page/domain/repository/weather_repository.dart';

class WeatherRepositoryImpl extends WeatherRepository<WeatherSearcDataSource> {
  WeatherRepositoryImpl(super.dataSource);

  @override
  Future<WeatherEntity> getIndexLocationZone(
      {required String indexLocationZone}) async {
    final weatherModel =
        await dataSource.fetchData(additionalPath: indexLocationZone);
    return WeatherEntity(
        weatherText: weatherModel.weatherText,
        temperature: weatherModel.temperature,
        weatherIcon: weatherModel.weatherIcon);
  }
}
