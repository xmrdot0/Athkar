import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

import 'package:path_provider/path_provider.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  Future<String>_loadFromAsset() async {
    return await rootBundle.loadString("assets/data.json");
  }

  Future getData() async {
    try {
      String jsonString = await _loadFromAsset();
      final data = jsonDecode(jsonString);
      List morning = [], evening = [], sleep = [];
      for (int i = 0; i < data.length; i++) {
        if (data[i]["category"] == "أذكار الصباح")
          morning.add(data[i]);
        else if (data[i]["category"] == "أذكار المساء")
          evening.add(data[i]);
        else if (data[i]["category"] == "أذكار النوم") sleep.add(data[i]);
      }

      Navigator.pushReplacementNamed(context, '/home',
          arguments: {'m': morning, 'e': evening, 's': sleep});
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SpinKitPumpingHeart(
            color: Colors.white,
            size: 200.0,
          ),
          Text(
            "﴿ الَّذِينَ آمَنُوا وَتَطْمَئِنُّ قُلُوبُهُم بِذِكْرِ اللَّهِ ۗ أَلَا بِذِكْرِ اللَّهِ تَطْمَئِنُّ الْقُلُوبُِ ﴾",
            style: TextStyle(color: Colors.white, fontSize: 16),
            textDirection: TextDirection.rtl,
          ),
        ],
      )),
    );
  }
}
