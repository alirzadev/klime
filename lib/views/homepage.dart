import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:klime/components/app_colors.dart';
import 'package:klime/custom_widgets/humidity_bar.dart';
import 'package:klime/model/current_weather_model.dart';
import 'package:klime/nav.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:url_launcher/url_launcher.dart';

extension CapExtension on String {
  String get inCaps => '${this[0].toUpperCase()}${this.substring(1)}';
  String get capitalizeFirstOfEach =>
      this.split(" ").map((str) => str.inCaps).join(" ");
}

class HomePage extends StatefulWidget {
  final CurrentWeatherModel weatherModel;

  HomePage({@required this.weatherModel});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  int temperature;
  String locationName;
  String weatherDescription;
  int humidity;
  double tempFeelsLike;
  double windSpeed;
  IconData icon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkGrey,
      body: SmartRefresher(
        enablePullDown: true,
        header: MaterialClassicHeader(color: AppColors.darkGrey),
        footer: CustomFooter(
          builder: (BuildContext context, LoadStatus mode) {
            Widget body;
            if (mode == LoadStatus.idle) {
              body = Text("pull up load");
            } else if (mode == LoadStatus.loading) {
              body = CupertinoActivityIndicator();
            } else if (mode == LoadStatus.failed) {
              body = Text("Load Failed!Click retry!");
            } else if (mode == LoadStatus.canLoading) {
              body = Text("release to load more");
            } else {
              body = Text("No more Data");
            }
            return Container(
              height: 20.0,
              child: body,
            );
          },
        ),
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 5, right: 12),
                  child: IconButton(
                    onPressed: () {
                      Nav.weeklyForecastPage(context);
                    },
                    icon: FaIcon(
                      FontAwesomeIcons.jsfiddle,
                      color: AppColors.white,
                    ),
                    iconSize: 24,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                      bottom: 15.0, left: 25.0, right: 25.0),
                  child: Column(
                    children: [
                      const Expanded(child: SizedBox(height: 10.0)),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${this.temperature}',
                            style: TextStyle(
                              fontSize: 56,
                              color: AppColors.white,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(bottom: 28.0, left: 5.0),
                            child: Text(
                              '\u00B0',
                              style: TextStyle(
                                fontSize: 32,
                                color: AppColors.white,
                                fontWeight: FontWeight.w100,
                              ),
                            ),
                          ),
                          SizedBox(width: 32.0),
                          FaIcon(
                            this.icon,
                            size: 80,
                            color: AppColors.white,
                          ),
                        ],
                      ),
                      const Expanded(flex: 2, child: SizedBox(height: 10.0)),
                      Column(
                        children: [
                          Text(
                            '${this.locationName}',
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.white,
                            ),
                          ),
                          SizedBox(height: 2.0),
                          Text(
                            '${this.weatherDescription.capitalizeFirstOfEach}',
                            style: TextStyle(
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
                  padding: EdgeInsets.only(
                      top: 10, bottom: 15.0, right: 25.0, left: 25.0),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: SizedBox(height: 10)),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            HumidityBar(currentHumidity: this.humidity),
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
                                        ),
                                      ),
                                      SizedBox(width: 34.0),
                                      Text(
                                        '${this.tempFeelsLike.toInt()}\u00B0',
                                        style: TextStyle(
                                          height: 0.0,
                                          color: AppColors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20.0),
                                Container(
                                  width: 160.0,
                                  child: Row(
                                    children: [
                                      Text(
                                        'Wind Speed:',
                                        style: TextStyle(
                                          height: 0.0,
                                          color:
                                              AppColors.white.withOpacity(0.5),
                                        ),
                                      ),
                                      SizedBox(width: 15.0),
                                      Text(
                                        '${this.windSpeed} km',
                                        style: TextStyle(
                                          height: 0.0,
                                          color: AppColors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Expanded(child: SizedBox(height: 10)),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'klimë v1.0.1',
                            style: TextStyle(
                              color: AppColors.white.withOpacity(.25),
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(width: 10),
                          InkWell(
                            onTap: () {
                              _launchURL('https://github.com/alirzadev/klime');
                            },
                            child: FaIcon(
                              FontAwesomeIcons.github,
                              size: 16,
                              color: AppColors.white.withOpacity(.25),
                            ),
                          ),
                          SizedBox(width: 10),
                          InkWell(
                            onTap: () {
                              _launchURL(
                                  'https://www.linkedin.com/in/alirzadev/');
                            },
                            child: FaIcon(
                              FontAwesomeIcons.linkedinIn,
                              size: 16,
                              color: AppColors.white.withOpacity(.25),
                            ),
                          ),
                          SizedBox(width: 10),
                          InkWell(
                            onTap: () {
                              _launchURL('https://devfolio-ce382.web.app/#/');
                            },
                            child: Text(
                              '@alirzadev',
                              style: TextStyle(
                                color: AppColors.white.withOpacity(.25),
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _updateUI();
  }

  void _updateUI() {
    this.temperature = widget.weatherModel.temperature;
    this.locationName = widget.weatherModel.locationName;
    this.weatherDescription = widget.weatherModel.weatherDescription;
    this.humidity = widget.weatherModel.humidity;
    this.tempFeelsLike = widget.weatherModel.tempFeelsLike;
    this.windSpeed = widget.weatherModel.windSpeed;
    this.icon = widget.weatherModel.icon;
  }

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    if (mounted)
      setState(() {
        _updateUI();
      });
    _refreshController.loadComplete();
  }

  void _launchURL(String urlString) async {
    await launch(urlString);
  }
}
