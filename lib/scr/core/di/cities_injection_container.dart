import 'package:get_it/get_it.dart';
import 'package:weather_app_dart/scr/core/api/api.dart';
import 'package:weather_app_dart/scr/core/api/extensions/api_modal_params.dart';
import 'package:weather_app_dart/scr/core/data/data_source/cities_data_source.dart';
import 'package:weather_app_dart/scr/core/di/external_injection_container.dart';
import 'package:weather_app_dart/scr/features/city_search_page/data/repository/city_repository_impl.dart';
import 'package:weather_app_dart/scr/features/city_search_page/domain/cities_repository.dart';
import 'package:weather_app_dart/scr/features/city_search_page/domain/interactors/get_list_cities_interactor.dart';

final slCities = GetIt.instance;

Future<void> init() async {
  slCities.registerLazySingleton(() => CitySearchDataSource(
        queryParams: {QueryParams.apiKey.value: apiKey},
        basePath: slExternal<Api>().basePath,
        path: slExternal<Api>().getPathIndexCity(),
      ));
  slCities.registerLazySingleton<CityRepository>(
    () => CityRepositoryImpl(
      slCities<CitySearchDataSource>(),
    ),
  );
  slCities.registerLazySingleton<GetListCitiesInteractor>(
    () => GetListCitiesInteractor(
      slCities<CityRepository>(),
    ),
  );
}
