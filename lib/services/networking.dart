import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:klime/services/api.dart';
import 'package:klime/services/api_keys.dart';

class NetworkHelper {
  final double longitude;
  final double latitude;

  NetworkHelper({@required this.longitude, this.latitude});

  Future<dynamic> getResponseData() async {
    try {
      String query =
          'lat=${this.latitude}&lon=${this.longitude}&appid=${ApiKeys.apiKey}&units=metric';

      API api = API(query: query);
      Response response = await Dio().getUri(api.currentWeatherUri());
      // print(api.currentWeatherUri());
      // print('this is the response $response');
      return response;
    } catch (e) {
      print('this is the exception $e');
    }
  }
}
