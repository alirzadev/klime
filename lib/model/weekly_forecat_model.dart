import 'package:dio/dio.dart';
import 'package:klime/services/location.dart';
import 'package:klime/services/networking.dart';

class WeeklyForecastModel {
  double date;
  int day;
  double temperature;

  WeeklyForecastModel({this.date, this.day, this.temperature});

  Future<List<WeeklyForecastModel>> getWeeklyForecast() async {
    Location location = Location();
    await location.getLocation();

    NetworkHelper networkHelper = NetworkHelper(
      longitude: location.longitude,
      latitude: location.latitude,
    );

    Response response;
    var data;

    try {
      response = await networkHelper.getWeeklyForecastResponseData();
      // print('this is the response coming from weather model $response');
      data = response.data;
      // print(data);
    } catch (e) {
      print('Exception caught in getWeeklyForecast function as $e');
    }
    List<WeeklyForecastModel> list = [];

    // print('===========================================${response.statusCode}');

    if (response.statusCode == 200) {
      for (int i = 1; i < 8; i++) {
        list.add(WeeklyForecastModel(
          date: (DateTime.now().day + i).toDouble(),
          day: (DateTime.now().weekday + i),
          temperature: data['daily'][i]['temp']['day'].toDouble(),
        ));
        // print('========================================= ${list.length}');
      }
      return list;
    }
    return list;
  }
}
