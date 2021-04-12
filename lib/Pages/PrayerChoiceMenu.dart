import 'package:flutter/material.dart';

class PrayerChoiceMenu extends StatefulWidget {
  @override
  _PrayerChoiceMenuState createState() => _PrayerChoiceMenuState();
}

class _PrayerChoiceMenuState extends State<PrayerChoiceMenu> {
  List Prayers = ["فجر-مغرب", "ظهر-عصر-عشاء "];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF272727),
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/prayer.png"), fit: BoxFit.cover)),
          child: Container(
             color: Color(0xFF272727).withOpacity(0.4),
            child: ListView.builder(
                padding: EdgeInsets.fromLTRB(0, 80, 0, 80),
                itemCount: Prayers.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/boarder.png"),
                        backgroundColor: Colors.white.withOpacity(0.5),
                        radius: 110,
                        child: ListTile(
                          onTap: () {
                            Navigator.pushReplacementNamed(context, '/prayer',
                                arguments: {'prayer': index});
                          },
                          title: Center(
                            child: Text(
                              Prayers[index],
                              style: TextStyle(
                                fontSize: 35,
                                color: Color(0xFF1D3557),
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Iran',
                                wordSpacing: 2,
                              ),
                            ),
                          ),
                        )),
                  );
                }),
          ),
        ));
  }
}
