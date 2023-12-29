import 'package:weather_app_dart/scr/core/data/models/location_model.dart';
import 'package:weather_app_dart/scr/core/domain/base_interactor.dart';
import 'package:weather_app_dart/scr/features/main_page/domain/entities/weather_entity.dart';
import 'package:weather_app_dart/scr/features/main_page/domain/repository/index_location_repository.dart';
import 'package:weather_app_dart/scr/features/main_page/domain/repository/weather_repository.dart';

class GetWeatherByIndexZoneInteractor
    extends BaseInteractor<LocationModel, WeatherEntity> {
  final WeatherRepository weatherRepository;
  final IndexLocationRepository indexLocationRepository;

  GetWeatherByIndexZoneInteractor(
      this.weatherRepository, this.indexLocationRepository);

  @override
  Future<WeatherEntity> call(LocationModel argument) async {
    final indexLocationZone = await indexLocationRepository
        .getIndexLocationZone(locationModel: argument);
    final weather = (await weatherRepository.getIndexLocationZone(
            indexLocationZone: indexLocationZone.key))
        .copyWith(city: indexLocationZone.city);
    return weather;
  }
}
