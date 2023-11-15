import 'package:equatable/equatable.dart';
import 'package:weather_app_dart/scr/core/utils/logger.dart';

abstract class BaseModel extends Equatable {
  BaseModel.fromJson(dynamic json) {
    logDebug(json);
  }
}
