import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getData() async {
    try {
      Response response = await get(Uri.parse(
          'https://raw.githubusercontent.com/osamayy/azkar-db/master/azkar.json'));
      List data = jsonDecode(response.body);
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
    } catch (e) {}
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
