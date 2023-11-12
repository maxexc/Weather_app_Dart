import 'package:http/http.dart' as http;
import 'package:weather_app_dart/scr/core/data/models/base_model.dart';
import 'package:weather_app_dart/scr/core/data/models/data_cities_model.dart';
import 'dart:convert' as convert;

abstract class BaseDataSource<T extends BaseModel> {
  final Map<String, String> quaryParams;
  final String basePath;
  final String path;

  BaseDataSource({
    required this.quaryParams,
    required this.basePath,
    required this.path,
  });

  @override
  Future<T> fetchData();
}

class CitySearcDataSource extends BaseDataSource<CityDataModel> {
  CitySearcDataSource(
      {required super.quaryParams,
      required super.basePath,
      required super.path});

  @override
  Future<CityDataModel> fetchData() {
    // TODO: implement fetchData
    throw UnimplementedError();
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
