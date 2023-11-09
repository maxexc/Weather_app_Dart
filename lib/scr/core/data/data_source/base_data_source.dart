import 'package:http/http.dart' as http;
import 'package:weather_app_dart/scr/core/data/data_source/base_data_source.dart';
import 'package:weather_app_dart/scr/core/data/models/base_model.dart';
import 'package:weather_app_dart/scr/core/data/models/data_cities_model.dart';
import 'dart:convert' as convert;

import 'package:weather_app_dart/scr/core/data/models/data_weather_model.dart';

class BaseDataSource<T extends BaseModel> {
  final Map<String, String> quaryParams;
  final String basePath;
  final String path;

  BaseDataSource({
    required this.quaryParams,
    required this.basePath,
    required this.path,
  });

  @override
  Future<Type> fetchData() async {
    final Uri uri = Uri.http(basePath, path, quaryParams);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      var json = convert.jsonDecode(response.body)[0];
      T.fromJson(json);
      final data = BaseModel.fromJson(json);

      //final data = B.fromJson(json);
      return T;
    }

    throw 'status code = ${response.statusCode}';
  }
}
