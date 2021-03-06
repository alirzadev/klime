import 'package:flutter/material.dart';
import 'package:klime/views/homepage.dart';

class Nav {
  static void homepage(context) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => HomePage()), (route) => false);
  }
}
