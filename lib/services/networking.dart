import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/cupertino.dart';
import 'package:klime/services/api.dart';
import 'package:klime/services/api_keys.dart';

class NetworkHelper {
  static Dio client;

  final double longitude;
  final double latitude;

  NetworkHelper({@required this.longitude, this.latitude});

  static Dio getDio() {
    if (client == null) {
      client = Dio();
      client.options.headers['Accept'] = 'application/json';
      client.interceptors.add(DioCacheManager(CacheConfig(
        defaultMaxAge: const Duration(days: 0),
        defaultRequestMethod: 'GET',
      )).interceptor);
    }
    return client;
  }

  Future<dynamic> getCurrentWeatherResponseData() async {
    try {
      String query =
          'lat=${this.latitude}&lon=${this.longitude}&appid=${ApiKeys.apiKey}&units=metric';

      API api = API(query: query);
      // Response response = await Dio().getUri(api.currentWeatherUri());
      Response response = await getDio().getUri(api.currentWeatherUri(),
          options: buildCacheOptions(Duration(days: 1)));
      // print('Coming from the network$res');
      // print(api.currentWeatherUri());
      // print('this is the response $response');
      return response;
    } catch (e) {
      print('this is the exception $e');
    }
  }

  Future<dynamic> getWeeklyForecastResponseData() async {
    try {
      String query =
          'lat=${this.latitude}&lon=${this.longitude}&exclude=minutely,hourly&appid=${ApiKeys.apiKey}&units=metric';

      API api = API(query: query);
      // Response response = await Dio().getUri(api.weeklyWeatherUri());
      Response response = await getDio().getUri(api.weeklyWeatherUri(),
          options: buildCacheOptions(Duration(days: 1)));
      // print(api.weeklyWeatherUri());
      return response;
    } catch (e) {
      print('this is the exception $e');
    }
  }
}
