import 'package:get_it/get_it.dart';
import 'package:weather_app_dart/scr/core/api/api.dart';
import 'package:weather_app_dart/scr/core/api/extensions/api_modal_params.dart';
import 'package:weather_app_dart/scr/core/data/data_source/cities_data_source.dart';
import 'package:weather_app_dart/scr/core/di/external_injection_container.dart';

final slCities = GetIt.instance;

Future<void> init() async {
  slCities.registerLazySingleton(() => CitySearchDataSource(
        queryParams: {QueryParams.apiKey.value: apiKey},
        basePath: slExternal<Api>().basePath,
        path: slExternal<Api>().getPathIndexCity(),
      ));
  // slMainWeather
  //     .registerLazySingleton<WeatherDataSource>(() => WeatherDataSource(
  //           quaryParams: {QueryParams.apiKey.value: apiKey},
  //           path: ApiPath.getWeatherPath(''),
  //           basePath: baseUrl,
  //         ));
}
