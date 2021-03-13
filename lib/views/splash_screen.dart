import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:klime/components/app_colors.dart';
import 'package:klime/model/current_weather_model.dart';
import 'package:klime/nav.dart';
import 'package:klime/services/permissions_checker.dart';

import '../services/location.dart';
import '../services/networking.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    Location loc = Location();
    await loc.getLocation();
    NetworkHelper net =
        NetworkHelper(longitude: loc.longitude, latitude: loc.latitude);
    net.getWeeklyForecastResponseData();

    if (await PermissionsChecker.checkInternet() == false) {
      Future.delayed(Duration(seconds: 2)).then((_) {
        Fluttertoast.showToast(msg: 'No Internet', gravity: ToastGravity.TOP);
        SystemNavigator.pop(animated: true);
      });
    }
    CurrentWeatherModel weatherModel;
    weatherModel = await CurrentWeatherModel().getCurrentWeather();
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
