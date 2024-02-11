import 'package:geolocator/geolocator.dart';
import 'package:weather_app_dart/scr/core/data/models/location_model.dart';
import 'package:weather_app_dart/scr/core/utils/logger.dart';

class GeolocatorDataSource {
  final Geolocator geolocator = Geolocator();

  Future<bool> isAvailable() async {
    return await Geolocator.isLocationServiceEnabled();
  }

  Future<bool> requestPermission() async {
    final permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      final req = await Geolocator.requestPermission();
      if (req == LocationPermission.unableToDetermine ||
          req == LocationPermission.always) {
        return true;
      }
      return false;
    } else if (permission == LocationPermission.deniedForever) {
      throw LocationPermission.deniedForever;
    }
    logDebug('permission, $permission');
    return true;
  }

  Future<LocationModel> getCurrentPositionCoordinate() async {
    final postion = await Geolocator.getCurrentPosition();
    final LocationModel locationModel =
        LocationModel(longitude: postion.longitude, latitude: postion.latitude);
    return locationModel;
  }
}
