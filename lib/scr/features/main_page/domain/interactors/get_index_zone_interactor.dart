import 'package:weather_app_dart/scr/core/data/models/location_model.dart';
import 'package:weather_app_dart/scr/core/domain/base_interactor.dart';
import 'package:weather_app_dart/scr/features/main_page/domain/entities/index_zone_entity.dart';
import 'package:weather_app_dart/scr/features/main_page/domain/repository/index_location_repository.dart';

class GetIndexZoneInteractor
    extends BaseInteractor<LocationModel, IndexZoneEntity> {
  final IndexLocationRepository indexLocationRepository;

  GetIndexZoneInteractor(this.indexLocationRepository);

  @override
  Future<IndexZoneEntity> call(LocationModel argument) {
    return indexLocationRepository.getIndexLocationZone(
      locationModel: argument,
    );
  }
}
