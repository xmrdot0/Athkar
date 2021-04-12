import 'package:athkar/Pages/AzkarTemplate.dart';
import 'package:athkar/Pages/Home.dart';
import 'package:athkar/Pages/Loading.dart';
import 'package:athkar/Pages/Prayer.dart';
import 'package:athkar/Pages/PrayerChoiceMenu.dart';
import 'package:flutter/material.dart';


void main() => runApp(MaterialApp(
  home: Loading(),
  routes: {
    '/a': (context) => Loading(),
    '/home': (context) => Home(),
    '/prayer': (context) => Prayer(),
    "/azkar": (context) => AzkarTemplate(),
    "/pc": (context) => PrayerChoiceMenu()
  },
  debugShowCheckedModeBanner: false,

));