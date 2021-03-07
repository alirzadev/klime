import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:klime/components/app_colors.dart';
import 'package:klime/model/current_weather_model.dart';
import 'package:klime/nav.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    CurrentWeatherModel weatherModel;
    weatherModel = await CurrentWeatherModel().getCurrentWeather();
    // print('this is the weather model coming from SPLASHSCREEN$weatherModel');
    Nav.homepage(context, weatherModel);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.darkGrey,
      child: Center(
        child: SpinKitRipple(
          color: AppColors.white,
          size: 100.0,
          borderWidth: 3.0,
        ),
      ),
    );
  }
}
