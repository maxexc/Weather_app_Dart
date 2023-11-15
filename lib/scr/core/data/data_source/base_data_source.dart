import 'package:http/http.dart' as http;
import 'package:weather_app_dart/scr/core/data/models/base_model.dart';
import 'dart:convert' as convert;

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

  Future<dynamic> request({
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
      return convert.jsonDecode(responce.body);
    }
    throw UnimplementedError(responce.statusCode.toString());
  }
}
