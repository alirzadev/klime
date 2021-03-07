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
    Location location = Location();
    await location.getLocation();
    // print('${location.latitude}===============${location.longitude}');

    NetworkHelper networkHelper = NetworkHelper(
      longitude: location.longitude,
      latitude: location.latitude,
    );
    Response response = await networkHelper.getResponseData();
    // print('this is the response coming from weather model $response');
    var data = response.data;
    var icon = _getWeatherIcon(data['weather'][0]['description']);

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
    return FontAwesomeIcons.bomb;
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

//
//
//
// class WeatherModel {
//   Future<dynamic> getLocationWeather() async {
//     Location location = Location();
//     await location.getLocation();
//
//     NetworkHelper networkHelper = NetworkHelper(
//         url:
//         '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
//
//     var weatherData = await networkHelper.getResponseData();
//     // print(weatherData);
//     return weatherData;
//   }
//
//
// }
