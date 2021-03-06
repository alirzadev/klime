import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:klime/components/app_colors.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkGrey,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(bottom: 15.0),
                child: Column(
                  children: [
                    const Expanded(child: SizedBox(height: 10.0)),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '30',
                          style: TextStyle(
                            fontSize: 56,
                            color: AppColors.white,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(bottom: 28.0, left: 5.0),
                          child: Text(
                            '\u00B0',
                            style: TextStyle(
                              // height: 0.0,
                              fontSize: 24,
                              color: AppColors.white,
                              // fontWeight: FontWeight.w100,
                            ),
                          ),
                        ),
                        SizedBox(width: 32.0),
                        FaIcon(
                          FontAwesomeIcons.rainbow,
                          size: 80,
                          color: AppColors.white,
                        ),
                      ],
                    ),
                    const Expanded(child: SizedBox(height: 10.0)),
                    Column(
                      children: [
                        Text(
                          'Lahore',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.white,
                          ),
                        ),
                        Text(
                          'Haze',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.white.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // HumidityBar(currentHumidity: humidity.toDouble()),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 140.0,
                                child: Row(
                                  children: [
                                    Text(
                                      'Feel Like:',
                                      style: TextStyle(
                                          height: 0.0,
                                          color:
                                              AppColors.white.withOpacity(0.5),
                                          fontSize: 12.0),
                                    ),
                                    SizedBox(width: 37.0),
                                    Text(
                                      '32\u00B0',
                                      style: TextStyle(
                                          height: 0.0,
                                          color: AppColors.white,
                                          fontSize: 12.0),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20.0),
                              Container(
                                width: 140.0,
                                child: Row(
                                  children: [
                                    Text(
                                      'Wind Speed:',
                                      style: TextStyle(
                                          height: 0.0,
                                          color:
                                              AppColors.white.withOpacity(0.5),
                                          fontSize: 12.0),
                                    ),
                                    SizedBox(width: 15.0),
                                    Text(
                                      '14 km',
                                      style: TextStyle(
                                          height: 0.0,
                                          color: AppColors.white,
                                          fontSize: 12.0),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
