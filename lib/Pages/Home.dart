import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};



  @override
  void initState() {
    super.initState();
  }

  static List Morning = [], Evening = [], Sleep = [];
  int x;
  List b=[];
  List<Map> cardData = [
    {'route':'/pc', 'text': "صلاة "},
    {'route':'/azkar', 'text': "صباح ", 'image': "assets/morning.png", 'list':Morning},
    {'route':'/azkar', 'text': "مساء", 'image': "assets/evening.png", 'list': Evening},
    {'route':'/azkar', 'text': "نوم", 'image': "assets/night.png", 'list': Sleep},
  ];

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) {
      data = ModalRoute.of(context).settings.arguments;
      cardData[1]['list'] = data['m'];
      cardData[2]['list'] = data['e'];
      cardData[3]['list'] = data['s'];
    }
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/home.jpg"), fit: BoxFit.cover)),
          child: ListView.builder(
              itemCount: cardData.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(45),
                  child: CircleAvatar(
                    backgroundColor: Colors.white.withOpacity(0.5),
                    radius: 50,
                    child: ListTile(
                      onTap: () {
                        if(index == 0)
                          Navigator.pushNamed(context, cardData[index]["route"]);
                        else
                          Navigator.pushNamed(context, cardData[index]["route"], arguments: {
                          'list': cardData[index]['list'],
                          'image': cardData[index]['image']
                        });
                      },
                  title: Center(
                            child: Text(
                              cardData[index]['text'],
                              style: TextStyle(
                                fontSize: 40,
                                color: Color(0xFF1D3557),
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Iran',
                                wordSpacing: 2,
                              ),
                            ),
                          ),
                        ),
                  ),
                );
          }),
        ));
  }
}
