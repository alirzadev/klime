import 'package:dio/dio.dart';
import 'package:klime/services/location.dart';
import 'package:klime/services/networking.dart';

class WeeklyForecastModel {
  double date;
  String day;
  double dayTemp;
  double nightTemp;

  WeeklyForecastModel({this.date, this.day, this.dayTemp, this.nightTemp});

  Future<List<WeeklyForecastModel>> getWeeklyForecast() async {
    MyLocation location = MyLocation();
    // await location.getLocation();

    NetworkHelper networkHelper = NetworkHelper(
      longitude: MyLocation.longitude,
      latitude: MyLocation.latitude,
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
          day: compareDays(DateTime.now().weekday + i),
          dayTemp: data['daily'][i]['temp']['day'].toDouble(),
          nightTemp: data['daily'][i]['temp']['night'].toDouble(),
        ));
        // print('===========================${DateTime.now().weekday + i}');
        // print('========================================= ${list.length}');
      }
      return list;
    }
    return list;
  }

  String compareDays(int value) {
    value = value % 7;
    switch (value) {
      case 1:
        return 'Mon';
      case 2:
        return 'Tue';
      case 3:
        return 'Wed';
      case 4:
        return 'Thu';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      case 0:
        return 'Sun ';
    }
    return '';
  }
}
