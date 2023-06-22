import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebook/Classes/Seven/BanglaVersion7/ArtB.dart';
import 'package:ebook/Classes/Seven/BanglaVersion7/Bangla.dart';
import 'package:ebook/Classes/Seven/BanglaVersion7/DigitalB.dart';
import 'package:ebook/Classes/Seven/BanglaVersion7/English.dart';
import 'package:ebook/Classes/Seven/BanglaVersion7/HelthB.dart';
import 'package:ebook/Classes/Seven/BanglaVersion7/HinduB.dart';
import 'package:ebook/Classes/Seven/BanglaVersion7/HistoryB.dart';
import 'package:ebook/Classes/Seven/BanglaVersion7/IslamicB.dart';
import 'package:ebook/Classes/Seven/BanglaVersion7/LifeB.dart';
import 'package:ebook/Classes/Seven/BanglaVersion7/MathB.dart';
import 'package:ebook/Classes/Seven/BanglaVersion7/ScienceB.dart';
import 'package:ebook/Design/Bookdesign.dart';
import 'package:ebook/Design/color.dart';
import 'package:flutter/material.dart';

class Banglaversion7 extends StatefulWidget {
  const Banglaversion7({super.key});

  @override
  State<Banglaversion7> createState() => _Banglaversion7State();
}

class _Banglaversion7State extends State<Banglaversion7> {
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
                                  text: data['MathN'],
                                  color: BlueColor,
                                  images: data['MathP'],
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MathB7()));
                                  },
                                ),
                                Bookdesign(
                                  text: data['SciN'],
                                  color: GreenColor,
                                  images: data['SciP'],
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ScienceB7()));
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
                                  text: data['HistoryN'],
                                  color: GreenColor,
                                  images: data['HistoryP'],
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HistoryB7()));
                                  },
                                ),
                                Bookdesign(
                                  text: data['IslamN'],
                                  color: BlueColor,
                                  images: data['IslamP'],
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => IslamB7()));
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 50),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Bookdesign(
                                  text: data['HinduN'],
                                  color: BlueColor,
                                  images: data['HinduP'],
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HinduB7()));
                                  },
                                ),
                                Bookdesign(
                                  text: data['DigitalN'],
                                  color: GreenColor,
                                  images: data['DigitalP'],
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => DigitalB7()));
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 50),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Bookdesign(
                                  text: data['HealthN'],
                                  color: GreenColor,
                                  images: data['HealthP'],
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HelthB7()));
                                  },
                                ),
                                Bookdesign(
                                  text: data['LifeN'],
                                  color: BlueColor,
                                  images: data['LifeP'],
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => LifeB7()));
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 50),
                            Bookdesign(
                              text: data['ArtN'],
                              color: GreenColor,
                              images: data['ArtP'],
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => ArtB7()));
                              },
                            ),
                          ])
                    );
              }).toList(),
            );
          }),
    );
  }
}
