import 'package:flutter/material.dart';
import 'package:klime/custom_widgets/weekly_forecast_chart.dart';
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
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.darkGrey,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.darkGrey,
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(
                strokeWidth: 3,
                // backgroundColor: AppColors.white,
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.white),
              ),
            )
          : Column(
              children: [
                WeeklyForecastChart(
                  date1: _list[0].date,
                  temp1: _list[0].temperature,
                  date2: _list[1].date,
                  temp2: _list[1].temperature,
                  date3: _list[2].date,
                  temp3: _list[2].temperature,
                  date4: _list[3].date,
                  temp4: _list[3].temperature,
                  date5: _list[4].date,
                  temp5: _list[4].temperature,
                  date6: _list[5].date,
                  temp6: _list[5].temperature,
                  date7: _list[6].date,
                  temp7: _list[6].temperature,
                ),
              ],
            ),
    );
  }
}
