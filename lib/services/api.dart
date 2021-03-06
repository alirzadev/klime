import 'package:flutter/material.dart';
import 'package:klime/services/api_keys.dart';

class API {
  final String apiKey;
  final String path;

  API({@required this.apiKey, @required this.path});

  factory API.sandbox() => API(apiKey: ApiKeys.apiKey, path: '');

  static const String host = 'api.openweathermap.org';

  Uri currentWeatherUri() => Uri(
        scheme: 'https',
        host: host,
        path: path,
      );
}
