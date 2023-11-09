import 'package:get_it/get_it.dart';
import 'package:weather_app_dart/scr/core/api/api.dart';
import 'package:weather_app_dart/scr/core/api/extensions/api_modal_params.dart';
import 'package:weather_app_dart/scr/core/api/extensions/api_model_path.dart';
import 'package:weather_app_dart/scr/core/data/data_source/get_current_weather.dart';

final slMainWeather = GetIt.instance;

Future<void> init() async {
  slMainWeather
      .registerLazySingleton<WeatherDataSource>(() => WeatherDataSource(
            quaryParams: {QueryParams.apiKey.value: apiKey},
            path: ApiPath.getWeatherPath(''),
            basePath: baseUrl,
          ));
}
