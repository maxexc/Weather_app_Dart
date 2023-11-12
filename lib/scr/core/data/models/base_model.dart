import 'package:equatable/equatable.dart';

abstract class BaseModel extends Equatable {
  BaseModel.fromJson(Map json);
}
