import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebook/Classes/Eight/BanglaVersion8/AgriB.dart';
import 'package:ebook/Classes/Eight/BanglaVersion8/ArtB.dart';
import 'package:ebook/Classes/Eight/BanglaVersion8/BGSB.dart';
import 'package:ebook/Classes/Eight/BanglaVersion8/Bangla.dart';
import 'package:ebook/Classes/Eight/BanglaVersion8/Bangla2nd.dart';
import 'package:ebook/Classes/Eight/BanglaVersion8/English.dart';
import 'package:ebook/Classes/Eight/BanglaVersion8/English2nd.dart';
import 'package:ebook/Classes/Eight/BanglaVersion8/Happy.dart';
import 'package:ebook/Classes/Eight/BanglaVersion8/HelthB.dart';
import 'package:ebook/Classes/Eight/BanglaVersion8/HinduB.dart';
import 'package:ebook/Classes/Eight/BanglaVersion8/HscienceB.dart';
import 'package:ebook/Classes/Eight/BanglaVersion8/ICTB.dart';
import 'package:ebook/Classes/Eight/BanglaVersion8/IslamicB.dart';
import 'package:ebook/Classes/Eight/BanglaVersion8/MathB.dart';
import 'package:ebook/Classes/Eight/BanglaVersion8/ScienceB.dart';
import 'package:ebook/Classes/Eight/BanglaVersion8/WorkB.dart';
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

class Banglaversion8 extends StatefulWidget {
  const Banglaversion8({super.key});

  @override
  State<Banglaversion8> createState() => _Banglaversion8State();
}

class _Banglaversion8State extends State<Banglaversion8> {
  final Stream<QuerySnapshot> _classeight =
      FirebaseFirestore.instance.collection('ClassEight').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: _classeight,
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
                            text: data['MathN'],
                            color: GreenColor,
                            images: data['MathP'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MathB8()));
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
                            text: data['SciEN'],
                            color: BlueColor,
                            images: data['SciEP'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ScienceB8()));
                            },
                          ),
                          Bookdesign(
                            text: data['English2N'],
                            color: GreenColor,
                            images: data['English2P'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => English2nd8()));
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
                            text: data['BGSN'],
                            color: GreenColor,
                            images: data['BGSP'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BGSB8()));
                            },
                          ),
                          Bookdesign(
                            text: data['HappyN'],
                            color: BlueColor,
                            images: data['HappyP'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>BBook3rd8()));
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
                            text: data['IslamN'],
                            color: GreenColor,
                            images: data['IslamP'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => IslamB8()));
                            },
                          ),
                          Bookdesign(
                            text: data['HinduN'],
                            color: BlueColor,
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
                            text: data['ICTN'],
                            color: BlueColor,
                            images: data['ICTP'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ICTB8()));
                            },
                          ),
                          Bookdesign(
                            text: data['SportN'],
                            color: GreenColor,
                            images: data['SportP'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HelthB8()));
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
                            color: GreenColor,
                            images: data['WorkP'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => WorkB8()));
                            },
                          ),
                          Bookdesign(
                            text: data['HsciN'],
                            color: BlueColor,
                            images: data['HsciP'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Hscience()));
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Bookdesign(
                            text: data['AgriN'],
                            color: GreenColor,
                            images: data['AgriP'],
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => AgriB8()));
                            },
                          ),
                          Bookdesign(
                            text: data['CaroN'],
                            color: GreenColor,
                            images: data['CaroP'],
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => ArtB6()));
                            },
                          ),
                        ],
                      ),
                    ]));
              }).toList(),
            );
          }),
    );
  }
}
