import 'package:flutter/cupertino.dart';
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
  List<String> weekDays = [];

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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: WeeklyForecastChart(
                    date1: _list[0].date,
                    temp1: _list[0].dayTemp,
                    date2: _list[1].date,
                    temp2: _list[1].dayTemp,
                    date3: _list[2].date,
                    temp3: _list[2].dayTemp,
                    date4: _list[3].date,
                    temp4: _list[3].dayTemp,
                    date5: _list[4].date,
                    temp5: _list[4].dayTemp,
                    date6: _list[5].date,
                    temp6: _list[5].dayTemp,
                    date7: _list[6].date,
                    temp7: _list[6].dayTemp,
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Divider(
                    thickness: .5,
                    color: AppColors.dimWhite.withOpacity(.25),
                  ),
                ),
                SizedBox(height: 2),
                Expanded(
                  child: Container(
                    width: width - 20,
                    height: 100,
                    child: ListView.builder(
                      itemCount: _list.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          width: 90,
                          height: 40,
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      index == 0
                                          ? 'Tomorrow ${_list[index].day}, ${_list[index].date.toInt()}'
                                          : '${_list[index].day}, ${_list[index].date.toInt()}',
                                      style: TextStyle(
                                        color: AppColors.white,
                                        // fontSize: 16,
                                        // fontWeight: FontWeight.w100,
                                      ),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          '${_list[index].dayTemp.toInt()}\u00B0 / ',
                                          style: TextStyle(
                                            color: AppColors.white,
                                            // fontSize: 16,
                                            // fontWeight: FontWeight.w100,
                                          ),
                                        ),
                                        Text(
                                          '${_list[index].nightTemp.toInt()}\u00B0',
                                          style: TextStyle(
                                            color: AppColors.dimWhite,
                                            // fontSize: 16,
                                            // fontWeight: FontWeight.w100,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 4),
                              Divider(
                                thickness: .5,
                                color: AppColors.dimWhite.withOpacity(.25),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
