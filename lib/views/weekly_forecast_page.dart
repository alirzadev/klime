import 'package:flutter/material.dart';
import 'package:klime/custom_widgets/weekly_forecast_chart.dart';

import '../components/app_colors.dart';

class WeeklyForecastPage extends StatefulWidget {
  @override
  _WeeklyForecastPageState createState() => _WeeklyForecastPageState();
}

class _WeeklyForecastPageState extends State<WeeklyForecastPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkGrey,
      body: Column(
        children: [
          SizedBox(height: 100),
          WeeklyForecastChart(),
        ],
      ),
    );
  }
}
