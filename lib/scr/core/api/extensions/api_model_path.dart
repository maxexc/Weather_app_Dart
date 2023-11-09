class ApiPath {
  static String getWeatherPath(String indexCurrentLocation) =>
      'currentconditions/v1/$indexCurrentLocation';
  static const String getIndexCityPath = 'locations/v1/cities/autocomplete';
}
