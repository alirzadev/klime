import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:klime/custom_widgets/weekly_forecast_chart.dart';
import 'package:klime/custom_widgets/weekly_forecast_list.dart';
import 'package:klime/model/weekly_forecat_model.dart';

import '../components/app_colors.dart';

class WeeklyForecastPage extends StatefulWidget {
  @override
  _WeeklyForecastPageState createState() => _WeeklyForecastPageState();
}

class _WeeklyForecastPageState extends State<WeeklyForecastPage> {
  bool _isLoading = true;
  List<WeeklyForecastModel> _list;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    _list = await WeeklyForecastModel().getWeeklyForecast();
    // print('=========================== ${_list.length}');
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.darkGrey,
        // appBar: AppBar(
        //   elevation: 0,
        //   automaticallyImplyLeading: false,
        //   backgroundColor: AppColors.darkGrey,
        // ),
        body: _isLoading
            ? Center(
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  // backgroundColor: AppColors.white,
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.white),
                ),
              )
            : Column(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: WeeklyForecastChart(
                      date1: _list[0].date,
                      dayTemp1: _list[0].dayTemp,
                      date2: _list[1].date,
                      dayTemp2: _list[1].dayTemp,
                      date3: _list[2].date,
                      dayTemp3: _list[2].dayTemp,
                      date4: _list[3].date,
                      dayTemp4: _list[3].dayTemp,
                      date5: _list[4].date,
                      dayTemp5: _list[4].dayTemp,
                      date6: _list[5].date,
                      dayTemp6: _list[5].dayTemp,
                      date7: _list[6].date,
                      dayTemp7: _list[6].dayTemp,
                    ),
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Divider(
                      thickness: .5,
                      color: AppColors.dimWhite.withOpacity(.25),
                    ),
                  ),
                  SizedBox(height: 2),
                  Expanded(
                    child: WeeklyForecastList(list: _list),
                  ),
                ],
              ),
      ),
    );
  }
}
