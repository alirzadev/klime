import 'package:flutter/material.dart';
import 'package:klime/model/current_weather_model.dart';
import 'package:klime/views/homepage.dart';
import 'package:klime/views/weekly_forecast_page.dart';

class Nav {
  static void homepage(context, CurrentWeatherModel model) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
            builder: (context) => HomePage(
                  weatherModel: model,
                )),
        (route) => false);
  }

  static void weeklyForecastPage(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => WeeklyForecastPage()),
    );
  }
}
