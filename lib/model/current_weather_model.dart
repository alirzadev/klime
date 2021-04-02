import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:klime/services/location.dart';
import 'package:klime/services/networking.dart';

class CurrentWeatherModel {
  int temperature;
  String locationName;
  String weatherDescription;
  int humidity;
  double tempFeelsLike;
  double windSpeed;
  IconData icon;

  CurrentWeatherModel({
    this.temperature,
    this.locationName,
    this.weatherDescription,
    this.humidity,
    this.tempFeelsLike,
    this.windSpeed,
    this.icon,
  });

  Future<CurrentWeatherModel> getCurrentWeather() async {
    // if (await GetStorage().getValues() == null) {
    MyLocation location = MyLocation();
    // await location.getLocation();
    // GetStorage().write('lon', location.longitude);
    // GetStorage().write('lat', location.latitude);
    // // }
    // print('===================${GetStorage().getValues()}');
    // final latitude = GetStorage().read('lat');
    // final longitude = GetStorage().read('lat');
    // print('$latitude===============$longitude');
    NetworkHelper networkHelper = NetworkHelper(
      longitude: MyLocation.longitude,
      latitude: MyLocation.latitude,
    );

    Response response;
    var data;
    IconData icon;

    try {
      response = await networkHelper.getCurrentWeatherResponseData();
      // print('this is the response coming from weather model $response');
      data = response.data;
      icon = _getWeatherIcon(data['weather'][0]['description']);
    } catch (e) {
      print(
          'Exception caught in WeatherModel getCurrentWeather function as $e');
    }

    if (response.statusCode != 200) {
      CurrentWeatherModel(
        temperature: 0,
        locationName: 'Unknown',
        weatherDescription: 'Unknown',
        humidity: 0,
        tempFeelsLike: 0,
        windSpeed: 0,
        icon: icon,
      );
    }

    // print(data);
    return CurrentWeatherModel(
      temperature: data['main']['temp'],
      locationName: data['name'],
      weatherDescription: data['weather'][0]['description'],
      humidity: data['main']['humidity'],
      tempFeelsLike: data['main']['feels_like'],
      windSpeed: data['wind']['speed'],
      icon: icon,
    );
  }

  IconData _getWeatherIcon(String description) {
    for (int i = 0; i < weatherIcons.length; i++) {
      if (weatherIcons[i]['condition'] == description) {
        return weatherIcons[i]['icon'];
      }
    }
    return FontAwesomeIcons.cloud;
  }

  var weatherIcons = [
    {
      'condition': 'clear sky',
      'icon': FontAwesomeIcons.solidSun,
    },
    {
      'condition': 'clouds',
      'icon': FontAwesomeIcons.cloud,
    },
    {
      'condition': 'few clouds',
      'icon': FontAwesomeIcons.cloudSun,
    },
    {
      'condition': 'scattered clouds',
      'icon': FontAwesomeIcons.cloud,
    },
    {
      'condition': 'broken clouds',
      'icon': FontAwesomeIcons.cloud,
    },
    {
      'condition': 'rain',
      'icon': FontAwesomeIcons.cloudSunRain,
    },
    {
      'condition': 'shower rain',
      'icon': FontAwesomeIcons.cloudRain,
    },
    {
      'condition': 'thunderstorm',
      'icon': FontAwesomeIcons.pooStorm,
    },
    {
      'condition': 'light rain',
      'icon': FontAwesomeIcons.cloudRain,
    },
    {
      'condition': 'drizzle',
      'icon': FontAwesomeIcons.cloudRain,
    },
    {
      'condition': 'snow',
      'icon': FontAwesomeIcons.snowflake,
    },
    {
      'condition': 'mist',
      'icon': FontAwesomeIcons.smog,
    },
    {
      'condition': 'smoke',
      'icon': FontAwesomeIcons.smog,
    },
    {
      'condition': 'haze',
      'icon': FontAwesomeIcons.smog,
    },
    {
      'condition': 'dust',
      'icon': FontAwesomeIcons.smog,
    },
    {
      'condition': 'fog',
      'icon': FontAwesomeIcons.smog,
    },
    {
      'condition': 'sand',
      'icon': FontAwesomeIcons.smog,
    },
    {
      'condition': 'ash',
      'icon': FontAwesomeIcons.smog,
    },
    {
      'condition': 'squall',
      'icon': FontAwesomeIcons.smog,
    },
    {
      'condition': 'tornado',
      'icon': FontAwesomeIcons.smog,
    },
    {
      'condition': 'clear',
      'icon': FontAwesomeIcons.solidSun,
    },
  ];
}
