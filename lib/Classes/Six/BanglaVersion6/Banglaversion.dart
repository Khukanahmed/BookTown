import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebook/Classes/Six/BanglaVersion6/ArtB.dart';
import 'package:ebook/Classes/Six/BanglaVersion6/Bangla.dart';
import 'package:ebook/Classes/Six/BanglaVersion6/DigitalB.dart';
import 'package:ebook/Classes/Six/BanglaVersion6/English.dart';
import 'package:ebook/Classes/Six/BanglaVersion6/HelthB.dart';
import 'package:ebook/Classes/Six/BanglaVersion6/HinduB.dart';
import 'package:ebook/Classes/Six/BanglaVersion6/HistoryB.dart';
import 'package:ebook/Classes/Six/BanglaVersion6/IslamicB.dart';
import 'package:ebook/Classes/Six/BanglaVersion6/LifeB.dart';
import 'package:ebook/Classes/Six/BanglaVersion6/MathB.dart';
import 'package:ebook/Classes/Six/BanglaVersion6/ScienceB.dart';
import 'package:ebook/Design/Bookdesign.dart';
import 'package:ebook/Design/color.dart';
import 'package:flutter/material.dart';

class Banglaversion6 extends StatefulWidget {
  const Banglaversion6({super.key});

  @override
  State<Banglaversion6> createState() => _Banglaversion6State();
}

class _Banglaversion6State extends State<Banglaversion6> {
  final Stream<QuerySnapshot> _classSix =
      FirebaseFirestore.instance.collection('ClassSix').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: _classSix,
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
                            text: data['MathN'],
                            color: BlueColor,
                            images: data['MathP'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MathB6()));
                            },
                          ),
                          Bookdesign(
                            text: data['ScicencNB'],
                            color: GreenColor,
                            images: data['ScicencPB'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ScienceB6()));
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
                                      builder: (context) => HistoryB6()));
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
                                      builder: (context) => IslamB6()));
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
                                      builder: (context) => HinduB6()));
                            },
                          ),
                          Bookdesign(
                            text: data['DigitalN'],
                            color: GreenColor,
                            images: data['DigitalPE'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DigitalB6()));
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
                                      builder: (context) => HelthB6()));
                            },
                          ),
                          Bookdesign(
                            text: data['lifeN'],
                            color: BlueColor,
                            images: data['lifeP'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LifeB6()));
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 50),
                      Bookdesign(
                        text: data['ArtNB'],
                        color: GreenColor,
                        images: data['ArtPB'],
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => ArtB6()));
                        },
                      ),
                    ]));
              }).toList(),
            );
          }),
    );
  }
}
