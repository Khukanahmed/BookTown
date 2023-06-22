import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebook/Classes/Seven/BanglaVersion7/Bangla.dart';
import 'package:ebook/Classes/Seven/BanglaVersion7/English.dart';
import 'package:ebook/Classes/Seven/EnglishVersion7/ArtE.dart';
import 'package:ebook/Classes/Seven/EnglishVersion7/DigitalE.dart';
import 'package:ebook/Classes/Seven/EnglishVersion7/HelthE.dart';
import 'package:ebook/Classes/Seven/EnglishVersion7/HinduE.dart';
import 'package:ebook/Classes/Seven/EnglishVersion7/HistoryE.dart';
import 'package:ebook/Classes/Seven/EnglishVersion7/IslamicE.dart';
import 'package:ebook/Classes/Seven/EnglishVersion7/LifeE.dart';
import 'package:ebook/Classes/Seven/EnglishVersion7/MathE.dart';
import 'package:ebook/Classes/Seven/EnglishVersion7/ScienceE.dart';
import 'package:ebook/Design/Bookdesign.dart';
import 'package:ebook/Design/color.dart';
import 'package:flutter/material.dart';

class Englishversion7 extends StatefulWidget {
  const Englishversion7({super.key});

  @override
  State<Englishversion7> createState() => _Englishversion7State();
}

class _Englishversion7State extends State<Englishversion7> {
  final Stream<QuerySnapshot> _classSeven =
      FirebaseFirestore.instance.collection('Class7').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: _classSeven,
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
                                      builder: (context) => BBook7()));
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
                                      builder: (context) => English7()));
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
                                      builder: (context) => MathE7()));
                            },
                          ),
                          Bookdesign(
                            text: data['SciEN'],
                            color: GreenColor,
                            images: data['SciEP'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ScienceE7()));
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
                            text: data['HistoryEN'],
                            color: GreenColor,
                            images: data['HistoryEP'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HistoryE7()));
                            },
                          ),
                          Bookdesign(
                            text: data['IslamEN'],
                            color: BlueColor,
                            images: data['IslamEP'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => IslamE7()));
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Bookdesign(
                            text: data['HinduEN'],
                            color: BlueColor,
                            images: data['HinduEP'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HinduE7()));
                            },
                          ),
                          Bookdesign(
                            text: data['DigitalEN'],
                            color: GreenColor,
                            images: data['DigitalEP'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DigitalE7()));
                            },
                          ),
                        ],
                      ),
                          SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Bookdesign(
                            text: data['HealthEN'],
                            color: GreenColor,
                            images: data['HealthEP'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HelthE7()));
                            },
                          ),
                           Bookdesign(
                            text: data['LifeEN'],
                            color: BlueColor,
                            images: data['LifeEP'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LifeE7()));
                            },
                          ),

                        ],
                      ),
                      SizedBox(height: 50),
                      Bookdesign(
                            text: data['ArtEN'],
                            color: GreenColor,
                            images: data['ArtEP'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ArtE7()));
                            },
                          ),
                    ]));
              }).toList(),
            );
          }),
    );
  }
}
