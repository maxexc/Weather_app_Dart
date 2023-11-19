enum QueryParams {
  apiKey('apikey'),
  q('q');

  final String value;

  const QueryParams(this.value);

  Map<String, String> setParams(String params) {
    return {value: params};
  }
}
