import 'package:athkar/Pages/Azkar.dart';
import 'package:flutter/material.dart';

class Prayer extends StatefulWidget {
  @override
  _PrayerState createState() => _PrayerState();
}

int iterator;
Map data;
final int FAJR=0;
final int DUHR=1;
class _PrayerState extends State<Prayer> {

  List azkar= [
      [
        Azkar("لا إله إلا الله وحده لا شريك له له الملك وله الحمد وهو على كل شيء قدير",10),
        Azkar("سبحان الله" , 3),
        Azkar("الحمد لله" , 3),
        Azkar("ألله أكبر" , 3),
        Azkar("قُلْ هُوَ اللَّهُ أَحَدٌ (1) اللَّهُ الصَّمَدُ (2) لَمْ يَلِدْ وَلَمْ يُولَدْ (3) وَلَمْ يَكُنْ لَهُ كُفُوًا أَحَدٌ (4)", 3),
        Azkar("قُلْ أَعُوذُ بِرَبِّ الْفَلَقِ (1) مِنْ شَرِّ مَا خَلَقَ (2) وَمِنْ شَرِّ غَاسِقٍ إِذَا وَقَبَ (3) وَمِنْ شَرِّ النَّفَّاثَاتِ فِي الْعُقَدِ (4) وَمِنْ شَرِّ حَاسِدٍ إِذَا حَسَدَ (5)", 3),
        Azkar("قُلْ أَعُوذُ بِرَبِّ النَّاسِ (1) مَلِكِ النَّاسِ (2) إِلَهِ النَّاسِ (3) مِنْ شَرِّ الْوَسْوَاسِ الْخَنَّاسِ (4) الَّذِي يُوَسْوِسُ فِي صُدُورِ النَّاسِ (5) مِنَ الْجِنَّةِ وَالنَّاسِ (6)", 3),
        Azkar("اللهُ لاَ إِلَهَ إِلاَّ هُوَ الْحَيُّ الْقَيُّومُ لاَ تَأْخُذُهُ سِنَةٌ وَلاَ نَوْمٌ لَّهُ مَا فِي السَّمَاوَاتِ وَمَا فِي الأَرْضِ مَن ذَا الَّذِي يَشْفَعُ عِنْدَهُ إِلاَّ بِإِذْنِهِ يَعْلَمُ مَا بَيْنَ أَيْدِيهِمْ وَمَا خَلْفَهُمْ وَلاَ يُحِيطُونَ بِشَيْءٍ مِّنْ عِلْمِهِ إِلاَّ بِمَا شَاء وَسِعَ كُرْسِيُّهُ السَّمَاوَاتِ وَالأَرْضَ وَلاَ يَؤُودُهُ حِفْظُهُمَا وَهُوَ الْعَلِيُّ الْعَظِيمُ", 1)
      ],
    [
      Azkar("سبحان الله" , 3),
      Azkar("الحمد لله" , 3),
      Azkar("ألله أكبر" , 3),
      Azkar("قُلْ هُوَ اللَّهُ أَحَدٌ (1) اللَّهُ الصَّمَدُ (2) لَمْ يَلِدْ وَلَمْ يُولَدْ (3) وَلَمْ يَكُنْ لَهُ كُفُوًا أَحَدٌ (4)", 1),
      Azkar("قُلْ أَعُوذُ بِرَبِّ الْفَلَقِ (1) مِنْ شَرِّ مَا خَلَقَ (2) وَمِنْ شَرِّ غَاسِقٍ إِذَا وَقَبَ (3) وَمِنْ شَرِّ النَّفَّاثَاتِ فِي الْعُقَدِ (4) وَمِنْ شَرِّ حَاسِدٍ إِذَا حَسَدَ (5)", 1),
      Azkar("قُلْ أَعُوذُ بِرَبِّ النَّاسِ (1) مَلِكِ النَّاسِ (2) إِلَهِ النَّاسِ (3) مِنْ شَرِّ الْوَسْوَاسِ الْخَنَّاسِ (4) الَّذِي يُوَسْوِسُ فِي صُدُورِ النَّاسِ (5) مِنَ الْجِنَّةِ وَالنَّاسِ (6)", 1),
      Azkar("اللهُ لاَ إِلَهَ إِلاَّ هُوَ الْحَيُّ الْقَيُّومُ لاَ تَأْخُذُهُ سِنَةٌ وَلاَ نَوْمٌ لَّهُ مَا فِي السَّمَاوَاتِ وَمَا فِي الأَرْضِ مَن ذَا الَّذِي يَشْفَعُ عِنْدَهُ إِلاَّ بِإِذْنِهِ يَعْلَمُ مَا بَيْنَ أَيْدِيهِمْ وَمَا خَلْفَهُمْ وَلاَ يُحِيطُونَ بِشَيْءٍ مِّنْ عِلْمِهِ إِلاَّ بِمَا شَاء وَسِعَ كُرْسِيُّهُ السَّمَاوَاتِ وَالأَرْضَ وَلاَ يَؤُودُهُ حِفْظُهُمَا وَهُوَ الْعَلِيُّ الْعَظِيمُ", 1)
    ]
  ];

  @override
  void initState() {
    super.initState();
    iterator=0;
    data={};
  }

  @override
  Widget build(BuildContext context) {
    data.isEmpty? data=ModalRoute.of(context).settings.arguments: null;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF272727),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/prayer.png"), fit: BoxFit.cover)),
        child: ListView.builder(itemBuilder: (context,index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Container(
              color: Color(0xFFF1FAEE).withOpacity(0.4),
              child: Padding(
                padding: EdgeInsets.all(0),
                child: Column(
                  children: [
                    Text("${azkar[data['prayer']][iterator].zekr}",
                        style: TextStyle(
                          fontSize: 55,
                          color: Color(0xFF272727),
                          fontFamily: 'Lemonada',
                          fontWeight: FontWeight.w800,
                          letterSpacing: 5,
                        ),
                      textDirection: TextDirection.rtl,
                    ),
                    SizedBox(height: 40,),
                    Text('${azkar[data['prayer']][iterator].count}', style: TextStyle(fontSize: 40,
                        color: Color(0xFF272727),
                        fontFamily: 'Lemonada'),
                    ),
                    SizedBox(height: 0,),
                    IconButton(
                        icon: Icon(Icons.adjust),
                        color: Color(0xFF272727),
                        iconSize: 150,
                        onPressed: () {
                          setState(() {
                            azkar[data['prayer']][iterator].count--;
                            if (azkar[data['prayer']][iterator].count==0) {
                              if (iterator+1<azkar[data['prayer']].length)
                                iterator++;
                              else
                                Navigator.pop(context);
                            }
                          });
                        }),
                    SizedBox(height: 500,)
                  ],
                ),
              ),
            ),
          );
        },
        itemCount:1,)
      ),
    );
  }
}
