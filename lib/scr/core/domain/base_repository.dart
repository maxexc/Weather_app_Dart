import 'package:weather_app_dart/scr/core/data/data_source/base_data_source.dart';

abstract class BaseRepository<T extends BaseDataSource> {
  final T dataSource;

  BaseRepository(this.dataSource);
}
