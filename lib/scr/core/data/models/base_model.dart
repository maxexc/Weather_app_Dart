import 'package:equatable/equatable.dart';

abstract class BaseModel extends Equatable {
  const BaseModel.fromJson(dynamic json);
}
