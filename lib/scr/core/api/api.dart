const String apiKey = 'LWFUAhBA7AAmO9xIv0WCUOB9s6jmWr6f';

class Api {
  String get basePath => 'dataservice.accuweather.com';
  String getPathWeather({required String indexCity}) {
    return 'currentonditions/v1/';
  }
  // Uri getPathWeather({required String indexCity}) {
  //   return (Uri.http(baseUrl, ApiPath.getWeatherPath(indexCity),
  //       {QueryParams.apiKey.value: apiKey}));
  // }

  String getPathIndexCity() {
    return 'locations/v1/cities/autocomplete';
  }
}
