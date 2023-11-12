import 'package:weather_app_dart/scr/core/data/data_source/base_data_source.dart';
import 'package:weather_app_dart/scr/core/data/models/list_cities_data_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:weather_app_dart/scr/core/utils/logger.dart';

class CitySearcDataSource extends BaseDataSource<ListCitiesDataModel> {
  CitySearcDataSource(
      {required super.queryParams,
      required super.basePath,
      required super.path});

  @override
  Future<ListCitiesDataModel> fetchData({
    String? additionalPath,
    Map<String, String>? additionalQueryParams,
  }) async {
    return ListCitiesDataModel.fromJson(
      await request(
          additionalPath: additionalPath,
          additionalQueryParams: additionalQueryParams),
    );
  }
}
