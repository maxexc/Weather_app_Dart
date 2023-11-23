import 'package:weather_app_dart/scr/core/domain/base_interactor.dart';
import 'package:weather_app_dart/scr/features/city_search_page/domain/cities_repository.dart';

import 'package:weather_app_dart/scr/features/city_search_page/domain/entities/city_entity.dart';

class GetListCitiesInteractor extends BaseInteractor<String, List<CityEntity>> {
  final CityRepository cityRepository;

  GetListCitiesInteractor(this.cityRepository);
  @override
  Future<List<CityEntity>> call(String argument) async {
    return await cityRepository.getListCities(argument);
  }
}
