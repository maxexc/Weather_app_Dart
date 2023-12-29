import 'package:weather_app_dart/scr/core/data/data_source/base_data_source.dart';
import 'package:weather_app_dart/scr/core/data/models/local_zone_model.dart';

class IndexLocalDataSource extends BaseDataSource<LocalZoneModel> {
  IndexLocalDataSource(
      {required super.queryParams,
      required super.basePath,
      required super.path});

  @override
  Future<LocalZoneModel> fetchData({
    String? additionalPath,
    Map<String, String>? additionalQueryParams,
  }) async {
    final json = await request(
        additionalPath: additionalPath,
        additionalQueryParams: additionalQueryParams);

    return LocalZoneModel.fromJson(json);
  }
}
