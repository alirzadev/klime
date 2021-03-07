import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:klime/components/app_colors.dart';

final GlobalKey<AnimatedCircularChartState> _chartKey =
    new GlobalKey<AnimatedCircularChartState>();

class HumidityBar extends StatefulWidget {
  final int currentHumidity;

  HumidityBar({@required this.currentHumidity});

  @override
  _HumidityBarState createState() => _HumidityBarState();
}

class _HumidityBarState extends State<HumidityBar> {
  double currentBarValue;
  double subtotalBarValue;
  int holeLabel;

  @override
  void initState() {
    super.initState();
    setState(() {
      updateBarValues(widget.currentHumidity);
    });
  }

  void updateBarValues(int currentHumidity) {
    double humidityToDouble = currentHumidity.toDouble();
    currentBarValue = humidityToDouble;
    subtotalBarValue = 100 - humidityToDouble;
    holeLabel = currentHumidity.toInt();
    print(holeLabel);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 15.0),
        Text(
          'Humidity',
          style: TextStyle(
            height: 0.0,
            color: AppColors.white,
          ),
        ),
        SizedBox(height: 2.0),
        AnimatedCircularChart(
          key: _chartKey,
          size: Size(125.0, 130.0),
          initialChartData: <CircularStackEntry>[
            CircularStackEntry(
              <CircularSegmentEntry>[
                CircularSegmentEntry(
                  currentBarValue,
                  AppColors.white,
                  rankKey: 'current',
                ),
                CircularSegmentEntry(
                  subtotalBarValue,
                  AppColors.white.withOpacity(0.5),
                  rankKey: 'subTotal',
                ),
                CircularSegmentEntry(
                  20,
                  AppColors.darkGrey,
                  rankKey: 'empty',
                ),
              ],
            ),
          ],
          startAngle: 120,
          holeRadius: 42.0,
          chartType: CircularChartType.Radial,
          holeLabel: '$holeLabel %',
          labelStyle: TextStyle(
            color: AppColors.white,
            fontSize: 24,
            fontWeight: FontWeight.w200,
          ),
          edgeStyle: SegmentEdgeStyle.round,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '0',
              style: TextStyle(
                height: 0.0,
                color: AppColors.white.withOpacity(0.5),
                fontSize: 12.0,
              ),
            ),
            const SizedBox(width: 24.0),
            Text(
              '100',
              style: TextStyle(
                height: 0.0,
                color: AppColors.white.withOpacity(0.5),
                fontSize: 12.0,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
