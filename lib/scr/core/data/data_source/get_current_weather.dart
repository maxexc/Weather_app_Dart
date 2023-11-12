const String api = 'LWFUAhBA7AAmO9xIv0WCUOB9s6jmWr6f';
var currentLocation = '167783';

// abstract class WeatherDataSource extends BaseDataSource {
//   Future<DataWeatherModel> fetchWeatherData();
//   Future<DataCitiesModel> fetchIndexCity();
// }

// class WeatherDataSourceImplantation extends WeatherDataSource {
//   @override
//   Future<DataCitiesModel> fetchIndexCity() {
//     // TODO: implement fetchIndexCity
//     throw UnimplementedError();
//   }

//   @override
//   Future<DataWeatherModel> fetchWeatherData() {
//     // TODO: implement fetchWeatherData
//     throw UnimplementedError();
//   }
// }

// class WeatherDataSource<DataWeatherModel> extends BaseDataSource{
//   WeatherDataSource({
//     required super.quaryParams,
//     required super.path, required super.basePath,
//   });
//
//
// }

// Future<DataWeatherModel> fetchWeatherData() async {
//   var url = Uri.http(
//       'dataservice.accuweather.com', 'currentonditions/v1/$currentLocation', {
//     'apikey': api,
//   });
//   var response = await http.get(url);
//   if (response.statusCode == 200) {
//     var json = convert.jsonDecode(response.body)[0];
//     final dataWeather = DataWeatherModel.fromJson(json);
//     return dataWeather;
//   } else {
//     throw 'status code = ${response.statusCode}';
//   }
// }
