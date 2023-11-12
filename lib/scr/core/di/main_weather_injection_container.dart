import 'package:get_it/get_it.dart';

final slMainWeather = GetIt.instance;

Future<void> init() async {
  // slMainWeather
  //     .registerLazySingleton<WeatherDataSource>(() => WeatherDataSource(
  //           quaryParams: {QueryParams.apiKey.value: apiKey},
  //           path: ApiPath.getWeatherPath(''),
  //           basePath: baseUrl,
  //         ));
}
