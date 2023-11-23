// import 'package:get_it/get_it.dart';
// import 'package:weather_app_dart/scr/core/api/api.dart';
// import 'package:weather_app_dart/scr/core/api/extensions/api_modal_params.dart';
// import 'package:weather_app_dart/scr/core/api/extensions/api_model_path.dart';
// import 'package:weather_app_dart/scr/core/data/data_source/weather_data_source.dart';
// import 'package:weather_app_dart/scr/core/di/external_injection_container.dart';
// // import 'package:weather_app_dart/scr/features/main_page/data/weather_repository_impl.dart';
// // import 'package:weather_app_dart/scr/features/main_page/domain/interactors/get_weather_by_index_zone_interactor.dart';
// import 'package:weather_app_dart/scr/features/main_page/domain/repository/weather_repository.dart';

// final slMainWeather = GetIt.instance;

// Future<void> init() async {
//   slMainWeather.registerLazySingleton<WeatherSearcDataSource>(
//     () => WeatherSearcDataSource(
//       queryParams: {QueryParams.apiKey.value: apiKey},
//       path: ApiPath.getWeatherPath(),
//       basePath: slExternal<Api>().basePath,
//     ),
//   );
//   slMainWeather.registerLazySingleton<WeatherRepository>(
//     () => WeatherRepositoryImpl(slMainWeather<WeatherSearcDataSource>()),
//   );
//   slMainWeather.registerLazySingleton<GetWeatherByIndexZoneInteractor>(
//     () => GetWeatherByIndexZoneInteractor(slMainWeather<WeatherRepository>()),
//   );

//   slMainWeather.registerLazySingleton<GetWeatherByIndexZoneInteractor>(
//     () => GetWeatherByIndexZoneInteractor(
//       slMainWeather<WeatherRepository>(),
//     ),
//   );
// }
