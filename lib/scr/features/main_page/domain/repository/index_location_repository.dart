import 'package:weather_app_dart/scr/core/data/data_source/index_local_data_source.dart';
import 'package:weather_app_dart/scr/core/data/models/location_model.dart';
import 'package:weather_app_dart/scr/core/domain/base_repository.dart';
import 'package:weather_app_dart/scr/features/main_page/domain/entities/index_zone_entity.dart';

abstract class IndexLocationRepository<T> extends BaseRepository<T> {
  IndexLocationRepository(super.dataSource);

  Future<IndexZoneEntity> getIndexLocationZone(
      {required LocationModel locationModel});
}

class IndexLocationRepositoryImpl
    extends IndexLocationRepository<IndexLocalDataSource> {
  IndexLocationRepositoryImpl(super.dataSource);

  @override
  Future<IndexZoneEntity> getIndexLocationZone(
      {required LocationModel locationModel}) async {
    final indexZoneData = await dataSource
        .fetchData(additionalQueryParams: {"q": locationModel.toString()});
    return IndexZoneEntity(key: indexZoneData.key);
  }
}
