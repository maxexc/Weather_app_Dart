import 'package:weather_app_dart/scr/core/data/models/base_model.dart';
import 'package:weather_app_dart/scr/core/data/models/data_cities_model.dart';

class ListCitiesDataModel extends BaseModel {
  final List<DataCityModel> listCitiesDataModel;

  ListCitiesDataModel.fromJson(dynamic json)
      : listCitiesDataModel = List<DataCityModel>.generate(
            (json as List).length,
            (index) => DataCityModel.fromJson((json)[index])),
        super.fromJson(json);
  //       {
  //   final lenght = (json as List).length;
  //   final List<DataCityModel> list = [];
  //   for (int i = 0; i < lenght; i++) {
  //     list.add(DataCityModel.fromJson((json as List)[i]));
  //   }
  // }

  @override
  List<Object?> get props => [ListCitiesDataModel];
}
