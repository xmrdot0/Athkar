import 'package:flutter/material.dart';

class AzkarTemplate extends StatefulWidget {
  @override
  _AzkarTemplateState createState() => _AzkarTemplateState();
}

int iterator, count;
Map data;
List azkar;
String assetImage;
class _AzkarTemplateState extends State<AzkarTemplate> {
  @override
  void initState() {
    super.initState();
    iterator = 0;
    data = {};
    azkar = [];
    count = 0;
  }

  @override
  Widget build(BuildContext context) {
    if(data.isEmpty) {
      data = ModalRoute.of(context).settings.arguments;
      assetImage=data['image'];
    }
    assetImage==null? assetImage="assets/home.jpg":null;
    azkar.length == 0 ? azkar = data['list'] : null;

    if (azkar[iterator]["count"] != "") {
      if (count == 0) count = int.parse(azkar[iterator]["count"]);
    } else
      count = 1;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF272727),
      ),
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(assetImage), fit: BoxFit.cover)),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Container(
                color: Color(0xFFF1FAEE).withOpacity(0.3),
                child: Column(
                  children: [
                    Text(
                      " ${azkar[iterator]["zekr"]}",
                      style: TextStyle(
                        fontSize: 30,
                        color: Color(0xFF272727),
                        fontFamily: 'Lemonada',
                        fontWeight: FontWeight.w800,
                        letterSpacing: 5,
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      "${count}",
                      style: TextStyle(
                          fontSize: 40,
                          color: Color(0xFF272727),
                          fontFamily: 'Lemonada'),
                    ),
                    IconButton(
                        icon: Icon(Icons.adjust),
                        color: Color(0xFF272727),
                        iconSize: 150,
                        onPressed: () {
                          setState(() {
                            count--;
                            if (count == 0) iterator++;
                            if (iterator + 1 >= azkar.length) {
                              Navigator.pop(context);
                              data.clear();
                            }
                          });
                        }),
                    SizedBox(height:500 ,)
                  ],
                ),
              );
            },
            itemCount: 1,
          )),
    );
  }
}
