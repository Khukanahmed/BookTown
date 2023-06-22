import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebook/Classes/Nine/BanglaVersion9-10/AccountB.dart';
import 'package:ebook/Classes/Nine/BanglaVersion9-10/AgricultreB.dart';
import 'package:ebook/Classes/Nine/BanglaVersion9-10/Arobi.dart';
import 'package:ebook/Classes/Nine/BanglaVersion9-10/ArtB.dart';
import 'package:ebook/Classes/Nine/BanglaVersion9-10/BGPB.dart';
import 'package:ebook/Classes/Nine/BanglaVersion9-10/Bangla.dart';
import 'package:ebook/Classes/Nine/BanglaVersion9-10/Bangla2nd.dart';
import 'package:ebook/Classes/Nine/BanglaVersion9-10/BhbB.dart';
import 'package:ebook/Classes/Nine/BanglaVersion9-10/Biology.dart';
import 'package:ebook/Classes/Nine/BanglaVersion9-10/BussnissB.dart';
import 'package:ebook/Classes/Nine/BanglaVersion9-10/CareerB.dart';
import 'package:ebook/Classes/Nine/BanglaVersion9-10/ChemistryB.dart';
import 'package:ebook/Classes/Nine/BanglaVersion9-10/EconomyB.dart';
import 'package:ebook/Classes/Nine/BanglaVersion9-10/English.dart';
import 'package:ebook/Classes/Nine/BanglaVersion9-10/Geograph.dart';
import 'package:ebook/Classes/Nine/BanglaVersion9-10/HinduB.dart';
import 'package:ebook/Classes/Nine/BanglaVersion9-10/Hmath.dart';
import 'package:ebook/Classes/Nine/BanglaVersion9-10/HomeSciB.dart';
import 'package:ebook/Classes/Nine/BanglaVersion9-10/ICTB.dart';
import 'package:ebook/Classes/Nine/BanglaVersion9-10/IslamicB.dart';
import 'package:ebook/Classes/Nine/BanglaVersion9-10/PhysicB.dart';
import 'package:ebook/Classes/Nine/BanglaVersion9-10/PolicyB.dart';
import 'package:ebook/Classes/Nine/BanglaVersion9-10/ScienceB.dart';
import 'package:ebook/Classes/Nine/BanglaVersion9-10/SprotB.dart';
import 'package:ebook/Design/Bookdesign.dart';
import 'package:ebook/Design/color.dart';
import 'package:flutter/material.dart';

class Banglaversion910 extends StatefulWidget {
  const Banglaversion910({super.key});

  @override
  State<Banglaversion910> createState() => _Banglaversion910State();
}

class _Banglaversion910State extends State<Banglaversion910> {
  final Stream<QuerySnapshot> _classeight =
      FirebaseFirestore.instance.collection('Class910').snapshots();
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
                            text: data['Bangla'],
                            color: GreenColor,
                            images: data['BanglaP'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BBook19()));
                            },
                          ),
                          Bookdesign(
                            text: data['Bangla2n'],
                            color: BlueColor,
                            images: data['Bangla2p'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BBook2nd9()));
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
                            text: data['Bangla2n'],
                            color: BlueColor,
                            images: data['Bangla2p'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BBook2nd9()));
                            },
                          ),
                          Bookdesign(
                            text: data['English1n'],
                            color: GreenColor,
                            images: data['English1p'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => English9()));
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
                            text: data['GmathN'],
                            color: GreenColor,
                            images: data['GmathP'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HmathB9()));
                            },
                          ),
                          Bookdesign(
                            text: data['ictBN'],
                            color: BlueColor,
                            images: data['ictBP'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ICTB9()));
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
                            text: data['SciBN'],
                            color: BlueColor,
                            images: data['SciBP'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ScienceB9()));
                            },
                          ),
                          Bookdesign(
                            text: data['PhysicBN'],
                            color: GreenColor,
                            images: data['physicBP'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PhysicB9()));
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
                            text: data['ChemistryBN'],
                            color: GreenColor,
                            images: data['ChemistryBP'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ChemistryB9()));
                            },
                          ),
                          Bookdesign(
                            text: data['BiologyBN'],
                            color: BlueColor,
                            images: data['BiologyBP'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BiologyB9()));
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Bookdesign(
                            text: data['HmathBN'],
                            color: BlueColor,
                            images: data['HmathBP'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HmathB9()));
                            },
                          ),
                          Bookdesign(
                            text: data['GeographyBN'],
                            color: GreenColor,
                            images: data['GeographyBP'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Bogul9()));
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Bookdesign(
                            text: data['EconomyBN'],
                            color: GreenColor,
                            images: data['EconomyBP'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EcomomyB9()));
                            },
                          ),
                          Bookdesign(
                            text: data['AgriculturalBN'],
                            color: BlueColor,
                            images: data['AgriculturalBP'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AgriB9()));
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Bookdesign(
                            text: data['HomesciBN'],
                            color: BlueColor,
                            images: data['HomesciBP'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomesciB9()));
                            },
                          ),
                          Bookdesign(
                            text: data['PolicyBN'],
                            color: GreenColor,
                            images: data['PolicyBP'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PolicyB9()));
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Bookdesign(
                            text: data['AccountBN'],
                            color: GreenColor,
                            images: data['AccountBP'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AccountB9()));
                            },
                          ),
                          Bookdesign(
                            text: data['BussnissBN'],
                            color: BlueColor,
                            images: data['BussnissBP'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BussnisB9()));
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Bookdesign(
                            text: data['IslamBN'],
                            color: BlueColor,
                            images: data['IslamBP'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => IslamB9()));
                            },
                          ),
                          Bookdesign(
                            text: data['HinduBN'],
                            color: GreenColor,
                            images: data['HinduBP'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HinduB9()));
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Bookdesign(
                            text: data['CareerBN'],
                            color: GreenColor,
                            images: data['CarreerBP'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CarreerB9()));
                            },
                          ),
                          Bookdesign(
                            text: data['BGPBN'],
                            color: BlueColor,
                            images: data['BGPBP'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BFPB9()));
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Bookdesign(
                            text: data['ArtBN'],
                            color: BlueColor,
                            images: data['ArtBP'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ArtB9()));
                            },
                          ),
                          Bookdesign(
                            text: data['BHBN'],
                            color: GreenColor,
                            images: data['BHBP'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BhbB9()));
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Bookdesign(
                            text: data['SprotBN'],
                            color: GreenColor,
                            images: data['SprotBP'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SprotB9()));
                            },
                          ),
                          Bookdesign(
                            text: data['AirbiN'],
                            color: BlueColor,
                            images: data['AirbiP'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ArobiB9()));
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
