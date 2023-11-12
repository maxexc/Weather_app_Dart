import 'package:http/http.dart' as http;
import 'package:weather_app_dart/scr/core/data/models/base_model.dart';
import 'package:weather_app_dart/scr/core/data/models/list_cities_data_model.dart';
import 'dart:convert' as convert;

import 'package:weather_app_dart/scr/core/utils/logger.dart';

abstract class BaseDataSource<T extends BaseModel> {
  final Map<String, String> queryParams;
  final String basePath;
  final String path;

  BaseDataSource({
    required this.queryParams,
    required this.basePath,
    required this.path,
  });

  Future<T> fetchData({
    String? additionalPath,
    Map<String, String> additionalQueryParams,
  });
}

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
    final path = '${this.path}${additionalPath ?? ''}';

    final queryParams = this.queryParams;
    additionalQueryParams != null
        ? queryParams.addAll(additionalQueryParams)
        : this.queryParams;

    final uri = Uri.http(basePath, path, queryParams);

    final responce = await http.get(uri);

    if (responce.statusCode == 200) {
      var json = convert.jsonDecode(responce.body);
      logDebug(json.toString());
      return ListCitiesDataModel.fromJson(json);
    }
    throw UnimplementedError(responce.statusCode.toString());
  }
}
// final Uri uri = Uri.http(basePath, path, quaryParams);
//     final response = await http.get(uri);
//     if (response.statusCode == 200) {
//       var json = convert.jsonDecode(response.body)[0];
//       var d = DataCitiesModel.fromJson(json);
//
//       final data = (T is BaseModel).fromJson(json);
//       final data = BaseModel.fromJson(json);
//
//       //final data = B.fromJson(json);
//       return T;
