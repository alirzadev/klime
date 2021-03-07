import 'package:flutter/cupertino.dart';

class API {
  final String query;

  API({@required this.query});

  String host = 'api.openweathermap.org';
  String path = 'data/2.5/weather';

  Uri currentWeatherUri() => Uri(
        scheme: 'https',
        host: host,
        path: path,
        query: query,
      );
}
