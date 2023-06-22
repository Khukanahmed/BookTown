import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebook/Classes/Eight/BanglaVersion8/AgriB.dart';
import 'package:ebook/Classes/Eight/BanglaVersion8/Bangla.dart';
import 'package:ebook/Classes/Eight/BanglaVersion8/Bangla2nd.dart';
import 'package:ebook/Classes/Eight/BanglaVersion8/English.dart';
import 'package:ebook/Classes/Eight/BanglaVersion8/HinduB.dart';
import 'package:ebook/Classes/Eight/BanglaVersion8/HscienceB.dart';
import 'package:ebook/Classes/Eight/BanglaVersion8/WorkB.dart';
import 'package:ebook/Classes/Eight/EnglishVersion8/BGSE.dart';
import 'package:ebook/Classes/Eight/EnglishVersion8/ICTE.dart';
import 'package:ebook/Classes/Eight/EnglishVersion8/IslamicE.dart';
import 'package:ebook/Classes/Eight/EnglishVersion8/MathE.dart';
import 'package:ebook/Classes/Six/EnglishVersion6/DigitalE.dart';
import 'package:ebook/Classes/Six/EnglishVersion6/HelthE.dart';
import 'package:ebook/Classes/Six/EnglishVersion6/HistoryE.dart';
import 'package:ebook/Classes/Six/EnglishVersion6/LifeE.dart';
import 'package:ebook/Design/Bookdesign.dart';
import 'package:ebook/Design/color.dart';
import 'package:flutter/material.dart';

class Englishversion8 extends StatefulWidget {
  const Englishversion8({super.key});

  @override
  State<Englishversion8> createState() => _Englishversion8State();
}

class _Englishversion8State extends State<Englishversion8> {
  final Stream<QuerySnapshot> _classEight =
      FirebaseFirestore.instance.collection('ClassEight').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: _classEight,
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
                                      builder: (context) => BBook18()));
                            },
                          ),
                          Bookdesign(
                            text: data['Bangla2N'],
                            color: BlueColor,
                            images: data['Bangla2P'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BBook2nd8()));
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
                            text: data['EnglishN'],
                            color: BlueColor,
                            images: data['EnglishP'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => English8()));
                            },
                          ),
                          Bookdesign(
                            text: data['MathEN'],
                            color: GreenColor,
                            images: data['MathEP'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MathE8()));
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
                            text: data['English2N'],
                            color: GreenColor,
                            images: data['English2P'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HistoryE6()));
                            },
                          ),
                          Bookdesign(
                            text: data['BGSEN'],
                            color: BlueColor,
                            images: data['BGSEP'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BGSE8()));
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Bookdesign(
                            text: data['IslamEN'],
                            color: BlueColor,
                            images: data['IskamEP'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => IslamE8()));
                            },
                          ),
                          Bookdesign(
                            text: data['HinduN'],
                            color: GreenColor,
                            images: data['HinduP'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HinduB8()));
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Bookdesign(
                            text: data['ICTEN'],
                            color: GreenColor,
                            images: data['ICTEP'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ICTE8()));
                            },
                          ),
                          Bookdesign(
                            text: data['SportEN'],
                            color: BlueColor,
                            images: data['SportEP'],
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Bookdesign(
                            text: data['WorkN'],
                            color: BlueColor,
                            images: data['WorkP'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => WorkB8()));
                            },
                          ),
                          Bookdesign(
                            text: data['ArtEN'],
                            color: GreenColor,
                            images: data['ArtEP'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => WorkB8()));
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Bookdesign(
                            text: data['HsciEN'],
                            color: GreenColor,
                            images: data['HsciEP'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Hscience()));
                            },
                          ),
                          Bookdesign(
                            text: data['AgriN'],
                            color: BlueColor,
                            images: data['AgriP'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AgriB8()));
                            },
                          )
                        ],
                      ),
                    ]));
              }).toList(),
            );
          }),
    );
  }
}
