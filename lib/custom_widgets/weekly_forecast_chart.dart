import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/app_colors.dart';

class WeeklyForecastChart extends StatefulWidget {
  final double date1;
  final double temp1;
  final double date2;
  final double temp2;
  final double date3;
  final double temp3;
  final double date4;
  final double temp4;
  final double date5;
  final double temp5;
  final double date6;
  final double temp6;
  final double date7;
  final double temp7;

  WeeklyForecastChart({
    this.date1,
    this.temp1,
    this.date2,
    this.temp2,
    this.date3,
    this.temp3,
    this.date4,
    this.temp4,
    this.date5,
    this.temp5,
    this.date6,
    this.temp6,
    this.date7,
    this.temp7,
  });

  @override
  State<StatefulWidget> createState() => WeeklyForecastChartState();
}

class WeeklyForecastChartState extends State<WeeklyForecastChart> {
  bool _isShowingMainData;

  @override
  void initState() {
    super.initState();
    _isShowingMainData = true;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: -5,
          top: -10,
          child: IconButton(
            onPressed: () {
              setState(() {
                _isShowingMainData = !_isShowingMainData;
              });
            },
            icon: Icon(
              Icons.flip,
              size: 20,
              color: Colors.white.withOpacity(_isShowingMainData ? 1.0 : 0.5),
            ),
            // constraints: BoxConstraints(maxWidth: 30),
          ),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: Text(
                'Weekly Forecast',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 24,
                  // fontWeight: FontWeight.w100,
                ),
              ),
            ),
            AspectRatio(
              aspectRatio: 2.0,
              child: Padding(
                padding: const EdgeInsets.only(right: 16.0, left: 6.0),
                child: LineChart(
                  _isShowingMainData ? curvedChart() : pointsChart(),
                  swapAnimationDuration: const Duration(milliseconds: 250),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  LineChartData curvedChart() {
    return LineChartData(
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
        ),
        touchCallback: (LineTouchResponse touchResponse) {},
        handleBuiltInTouches: true,
      ),
      gridData: FlGridData(
        show: false,
      ),
      titlesData: FlTitlesData(
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          getTextStyles: (value) => const TextStyle(color: AppColors.dimWhite),
          margin: 10,
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '${widget.date1.toInt()}';
              case 2:
                return '${widget.date2.toInt()}';
              case 3:
                return '${widget.date3.toInt()}';
              case 4:
                return '${widget.date4.toInt()}';
              case 5:
                return '${widget.date5.toInt()}';
              case 6:
                return '${widget.date6.toInt()}';
              case 7:
                return '${widget.date7.toInt()}';
            }
            return '';
          },
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => const TextStyle(color: AppColors.dimWhite),
          getTitles: (value) {
            switch (value.toInt()) {
              case 10:
                return '10';
              case 20:
                return '20';
              case 30:
                return '30';
              case 40:
                return '40';
              case 50:
                return '50';
            }
            return '';
          },
          margin: 10,
          reservedSize: 20,
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: const Border(
          bottom: BorderSide(
            color: AppColors.dimWhite,
            width: 1,
          ),
          left: BorderSide(
            color: Colors.transparent,
          ),
          right: BorderSide(
            color: Colors.transparent,
          ),
          top: BorderSide(
            color: Colors.transparent,
          ),
        ),
      ),
      minX: 0,
      maxX: 8,
      maxY: 55,
      minY: 0,
      lineBarsData: curvedChartData(),
    );
  }

  List<LineChartBarData> curvedChartData() {
    final LineChartBarData lineChartBarData3 = LineChartBarData(
      spots: [
        FlSpot(1, widget.temp1),
        FlSpot(2, widget.temp2),
        FlSpot(3, widget.temp3),
        FlSpot(4, widget.temp4),
        FlSpot(5, widget.temp5),
        FlSpot(6, widget.temp6),
        FlSpot(7, widget.temp7),
      ],
      isCurved: true,
      colors: const [AppColors.white],
      barWidth: 5,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: false,
      ),
      belowBarData: BarAreaData(
        show: false,
      ),
    );
    return [
      lineChartBarData3,
    ];
  }

  LineChartData pointsChart() {
    return LineChartData(
      lineTouchData: LineTouchData(
        enabled: false,
      ),
      gridData: FlGridData(
        show: false,
      ),
      titlesData: FlTitlesData(
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          getTextStyles: (value) => const TextStyle(color: AppColors.dimWhite),
          margin: 10,
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '${widget.date1.toInt()}';
              case 2:
                return '${widget.date2.toInt()}';
              case 3:
                return '${widget.date3.toInt()}';
              case 4:
                return '${widget.date4.toInt()}';
              case 5:
                return '${widget.date5.toInt()}';
              case 6:
                return '${widget.date6.toInt()}';
              case 7:
                return '${widget.date7.toInt()}';
            }
            return '';
          },
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => const TextStyle(color: AppColors.dimWhite),
          getTitles: (value) {
            switch (value.toInt()) {
              case 10:
                return '10';
              case 20:
                return '20';
              case 30:
                return '30';
              case 40:
                return '40';
              case 50:
                return '50';
            }
            return '';
          },
          margin: 10,
          reservedSize: 20,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: const Border(
            bottom: BorderSide(
              color: AppColors.dimWhite,
              width: 1,
            ),
            left: BorderSide(
              color: Colors.transparent,
            ),
            right: BorderSide(
              color: Colors.transparent,
            ),
            top: BorderSide(
              color: Colors.transparent,
            ),
          )),
      minX: 0,
      maxX: 8,
      maxY: 50,
      minY: 0,
      lineBarsData: pointsChartData(),
    );
  }

  List<LineChartBarData> pointsChartData() {
    return [
      LineChartBarData(
        spots: [
          FlSpot(1, widget.temp1),
          FlSpot(2, widget.temp2),
          FlSpot(3, widget.temp3),
          FlSpot(4, widget.temp4),
          FlSpot(5, widget.temp5),
          FlSpot(6, widget.temp6),
          FlSpot(7, widget.temp7),
        ],
        isCurved: true,
        curveSmoothness: 0,
        colors: const [AppColors.lightPink],
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: FlDotData(show: true),
        belowBarData: BarAreaData(
          show: false,
        ),
      ),
    ];
  }
}
