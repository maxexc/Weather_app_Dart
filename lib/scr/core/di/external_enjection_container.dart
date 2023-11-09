import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

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
}
