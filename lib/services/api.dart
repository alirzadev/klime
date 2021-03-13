import 'package:flutter/cupertino.dart';

class API {
  final String query;

  API({@required this.query});

  String host = 'api.openweathermap.org';
  String currentWeatherPath = 'data/2.5/weather';
  String weeklyForecastPath = 'data/2.5/onecall';

  Uri currentWeatherUri() => Uri(
        scheme: 'https',
        host: host,
        path: currentWeatherPath,
        query: query,
      );
  Uri weeklyWeatherUri() => Uri(
        scheme: 'https',
        host: host,
        path: weeklyForecastPath,
        query: query,
      );
}
