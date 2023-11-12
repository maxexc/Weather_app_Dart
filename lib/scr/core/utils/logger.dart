import 'package:logger/logger.dart';
import 'package:weather_app_dart/scr/core/di/external_injection_container.dart';

void logDebug(String value) {
  final logger = slExternal<Logger>();
  logger.d(value);
}

void logError(String value) {
  final logger = slExternal<Logger>();
  logger.e(value);
}
