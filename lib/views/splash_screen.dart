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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      width: width,
      height: height,
      color: AppColors.darkGrey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: SizedBox(height: 5)),
          SizedBox(height: 60.0),
          Image.asset('images/klimeLogo.png', width: 2 * width / 5),
          Expanded(child: SizedBox(height: 5)),
          SpinKitRipple(
            color: AppColors.white,
            size: 60.0,
            borderWidth: 3.0,
          ),
          SizedBox(height: 60.0),
        ],
      ),
    );
  }
}
