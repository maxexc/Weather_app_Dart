const String apiKey = 'LWFUAhBA7AAmO9xIv0WCUOB9s6jmWr6f';

class Api {
  String get basePath => 'dataservice.accuweather.com';
  String getPathWeather({required String indexCity}) {
    return 'currentonditions/v1/';
  }

  String getPathIndexCity() {
    return 'locations/v1/cities/autocomplete';
  }

  String getPathLocalIndex() {
    return 'locations/v1/cities/geoposition/search';
  }
}
