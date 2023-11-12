import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:weather_app_dart/scr/core/api/api.dart';

final slExternal = GetIt.instance;

Future<void> init() async {
  slExternal.registerLazySingleton<Logger>(
    () => Logger(
      printer: PrettyPrinter(
        colors: true,
        printEmojis: true,
      ),
    ),
  );
  slExternal.registerLazySingleton<Api>(() => Api());
}
