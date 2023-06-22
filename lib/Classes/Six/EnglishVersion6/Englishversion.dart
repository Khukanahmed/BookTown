import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebook/Classes/Five/BanglaVersion5/BGS5.dart';
import 'package:ebook/Classes/Five/BanglaVersion5/Bangla5.dart';
import 'package:ebook/Classes/Five/BanglaVersion5/English5.dart';
import 'package:ebook/Classes/Five/BanglaVersion5/Math4.dart';
import 'package:ebook/Classes/Five/BanglaVersion5/Science4.dart';
import 'package:ebook/Classes/Five/EnglishVersion5/BGS5E.dart';
import 'package:ebook/Classes/Five/EnglishVersion5/Hindu5E.dart';
import 'package:ebook/Classes/Five/EnglishVersion5/Islam5E.dart';
import 'package:ebook/Classes/Five/EnglishVersion5/Math5E.dart';
import 'package:ebook/Classes/Five/EnglishVersion5/Science5E.dart';
import 'package:ebook/Classes/Four/BanglaVersion4/Bangla4.dart';
import 'package:ebook/Classes/Four/BanglaVersion4/English4.dart';
import 'package:ebook/Classes/Four/BanglaVersion4/Hindu4.dart';
import 'package:ebook/Classes/Four/BanglaVersion4/Islam4.dart';
import 'package:ebook/Classes/Six/BanglaVersion6/Bangla.dart';
import 'package:ebook/Classes/Six/BanglaVersion6/English.dart';
import 'package:ebook/Classes/Six/EnglishVersion6/ArtE.dart';
import 'package:ebook/Classes/Six/EnglishVersion6/DigitalE.dart';
import 'package:ebook/Classes/Six/EnglishVersion6/HelthE.dart';
import 'package:ebook/Classes/Six/EnglishVersion6/HinduE.dart';
import 'package:ebook/Classes/Six/EnglishVersion6/HistoryE.dart';
import 'package:ebook/Classes/Six/EnglishVersion6/IslamicE.dart';
import 'package:ebook/Classes/Six/EnglishVersion6/LifeE.dart';
import 'package:ebook/Classes/Six/EnglishVersion6/MathE.dart';
import 'package:ebook/Classes/Six/EnglishVersion6/ScienceE.dart';
import 'package:ebook/Design/Bookdesign.dart';
import 'package:ebook/Design/color.dart';
import 'package:flutter/material.dart';

class Englishversion6 extends StatefulWidget {
  const Englishversion6({super.key});

  @override
  State<Englishversion6> createState() => _Englishversion6State();
}

class _Englishversion6State extends State<Englishversion6> {
  final Stream<QuerySnapshot> _classfive =
      FirebaseFirestore.instance.collection('ClassSix').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: _classfive,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('Something went wrong'));
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                return Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 60, horizontal: 10),
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Bookdesign(
                            text: data['BanglaN'],
                            color: GreenColor,
                            images: data['BanglaP'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BBook6()));
                            },
                          ),
                          Bookdesign(
                            text: data['EnglishN'],
                            color: BlueColor,
                            images: data['EnglishP'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => English6()));
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Bookdesign(
                            text: data['MathNE'],
                            color: BlueColor,
                            images: data['MathPE'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MathE6()));
                            },
                          ),
                          Bookdesign(
                            text: data['ScicencNE'],
                            color: GreenColor,
                            images: data['ScicencPE'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ScienceE6()));
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Bookdesign(
                            text: data['HistoryNE'],
                            color: GreenColor,
                            images: data['HistoryPE'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HistoryE6()));
                            },
                          ),
                          Bookdesign(
                            text: data['IslamNE'],
                            color: BlueColor,
                            images: data['IslamPE'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => IslamE6()));
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Bookdesign(
                            text: data['HinduNE'],
                            color: BlueColor,
                            images: data['HinduPE'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HinduE6()));
                            },
                          ),
                           Bookdesign(
                            text: data['DigitalNE'],
                            color: GreenColor,
                            images: data['DigitalP'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DigitalE6()));
                            },
                          ),

                        ],
                      ),
                          SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Bookdesign(
                            text: data['HealthNE'],
                            color: GreenColor,
                            images: data['HealthPE'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HelthE6()));
                            },
                          ),
                           Bookdesign(
                            text: data['lifeNE'],
                            color: BlueColor,
                            images: data['lifePE'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LifeE6()));
                            },
                          ),

                        ],
                      ),
                      SizedBox(height: 50),
                      Bookdesign(
                            text: data['ArtNE'],
                            color: GreenColor,
                            images: data['ArtPE'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ArtE6()));
                            },
                          ),
                    ]));
              }).toList(),
            );
          }),
    );
  }}