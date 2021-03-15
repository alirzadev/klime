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
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      width: width - 20,
      height: 100,
      child: ListView.builder(
        itemCount: widget.list.length,
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
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        index == 0
                            ? 'Tomorrow ${widget.list[index].day}, ${widget.list[index].date.toInt()}'
                            : '${widget.list[index].day}, ${widget.list[index].date.toInt()}',
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
                  thickness: .5,
                  color: AppColors.dimWhite.withOpacity(.25),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
