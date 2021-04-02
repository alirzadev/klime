import 'package:date_util/date_util.dart';
import 'package:flutter/material.dart';
import 'package:klime/model/weekly_forecat_model.dart';

import '../components/app_colors.dart';

class WeeklyForecastList extends StatefulWidget {
  final List<WeeklyForecastModel> list;

  WeeklyForecastList({this.list});

  @override
  _WeeklyForecastListState createState() => _WeeklyForecastListState();
}

class _WeeklyForecastListState extends State<WeeklyForecastList> {
  int daysInMonth =
      DateUtil().daysInMonth(DateTime.now().month, DateTime.now().year);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      width: width - 20,
      height: 100,
      child: ListView.builder(
        itemCount: widget.list.length,
        itemBuilder: (BuildContext context, int index) {
          int month =
              DateTime.now().add(Duration(hours: (24 * (index + 1)))).month;

          return Container(
            width: 90,
            height: 43,
            margin: EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        index == 0
                            ? 'Tomorrow ${widget.list[index].day}, ${widget.list[index].date.toInt()} ${compareMonth(month)}'
                            : '${widget.list[index].day}, ${widget.list[index].date.toInt() % daysInMonth} ${compareMonth(month)}',
                        style: TextStyle(
                          color: AppColors.white,
                          // fontSize: 16,
                          // fontWeight: FontWeight.w100,
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '${widget.list[index].dayTemp.toInt()}\u00B0 / ',
                            style: TextStyle(
                              color: AppColors.white,
                              // fontSize: 16,
                              // fontWeight: FontWeight.w100,
                            ),
                          ),
                          Text(
                            '${widget.list[index].nightTemp.toInt()}\u00B0',
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
                  thickness: .25,
                  color: AppColors.dimWhite.withOpacity(.25),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  String compareMonth(int value) {
    value = value % 12;
    switch (value) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 0:
        return 'Dec';
    }
    return '';
  }
}
