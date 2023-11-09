import 'package:equatable/equatable.dart';

class BaseModel extends Equatable {
  BaseModel.fromJson(Map json);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
