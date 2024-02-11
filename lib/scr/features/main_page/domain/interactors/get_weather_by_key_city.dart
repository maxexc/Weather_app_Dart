import 'package:weather_app_dart/scr/core/domain/base_interactor.dart';
import 'package:weather_app_dart/scr/features/city_search_page/domain/entities/city_entity.dart';
import 'package:weather_app_dart/scr/features/main_page/domain/entities/weather_entity.dart';
import 'package:weather_app_dart/scr/features/main_page/domain/repository/weather_repository.dart';

class GetWeatherByKeyCity extends BaseInteractor<CityEntity, WeatherEntity> {
  final WeatherRepository weatherRepository;

  GetWeatherByKeyCity({required this.weatherRepository});

  @override
  Future<WeatherEntity> call(CityEntity argument) async {
    final weatherEntity = (await weatherRepository.getIndexLocationZone(
            indexLocationZone: argument.key))
        .copyWith(
      city: argument.cityName,
    );
    return weatherEntity;
  }
}
