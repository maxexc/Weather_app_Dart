import 'package:weather_app_dart/scr/core/data/models/base_model.dart';

class LocationModel extends BaseModel {
  final double longitude;
  final double latitude;

  LocationModel({required this.longitude, required this.latitude})
      : super.fromJson({}); // todo implements from json
  LocationModel copyWith({double? longitude, double? latitude}) {
    return LocationModel(
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
    );
  }

  @override
  String toString() => "${latitude.toString()},${longitude.toString()}";

  @override
  List<Object?> get props => [longitude, latitude];
}
