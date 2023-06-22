import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebook/Classes/Nine/BanglaVersion9-10/AgricultreB.dart';
import 'package:ebook/Classes/Nine/BanglaVersion9-10/Arobi.dart';
import 'package:ebook/Classes/Nine/BanglaVersion9-10/Bangla.dart';
import 'package:ebook/Classes/Nine/BanglaVersion9-10/Bangla2nd.dart';
import 'package:ebook/Classes/Nine/BanglaVersion9-10/English.dart';
import 'package:ebook/Classes/Nine/BanglaVersion9-10/Hmath.dart';
import 'package:ebook/Classes/Nine/BanglaVersion9-10/ScienceB.dart';
import 'package:ebook/Classes/Nine/EnglishVersion9-10/AccountB.dart';
import 'package:ebook/Classes/Nine/EnglishVersion9-10/ArtB.dart';
import 'package:ebook/Classes/Nine/EnglishVersion9-10/BGPB.dart';
import 'package:ebook/Classes/Nine/EnglishVersion9-10/BhbB.dart';
import 'package:ebook/Classes/Nine/EnglishVersion9-10/Biology.dart';
import 'package:ebook/Classes/Nine/EnglishVersion9-10/BussnissB.dart';
import 'package:ebook/Classes/Nine/EnglishVersion9-10/CareerB.dart';
import 'package:ebook/Classes/Nine/EnglishVersion9-10/ChemistryB.dart';
import 'package:ebook/Classes/Nine/EnglishVersion9-10/EconomyB.dart';
import 'package:ebook/Classes/Nine/EnglishVersion9-10/Geograph.dart';
import 'package:ebook/Classes/Nine/EnglishVersion9-10/HinduB.dart';
import 'package:ebook/Classes/Nine/EnglishVersion9-10/Hmath.dart';
import 'package:ebook/Classes/Nine/EnglishVersion9-10/HomeSciB.dart';
import 'package:ebook/Classes/Nine/EnglishVersion9-10/ICTB.dart';
import 'package:ebook/Classes/Nine/EnglishVersion9-10/IslamicB.dart';
import 'package:ebook/Classes/Nine/EnglishVersion9-10/PhysicB.dart';
import 'package:ebook/Classes/Nine/EnglishVersion9-10/PolicyB.dart';
import 'package:ebook/Classes/Nine/EnglishVersion9-10/SprotB.dart';
import 'package:ebook/Design/Bookdesign.dart';
import 'package:ebook/Design/color.dart';
import 'package:flutter/material.dart';

class Englishversion910 extends StatefulWidget {
  const Englishversion910({super.key});

  @override
  State<Englishversion910> createState() => _Englishversion910State();
}

class _Englishversion910State extends State<Englishversion910> {
  final Stream<QuerySnapshot> _classNine =
      FirebaseFirestore.instance.collection('Class910').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: _classNine,
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
                            text: data['GmathEN'],
                            color: GreenColor,
                            images: data['GmathEP'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HmathB9()));
                            },
                          ),
                          Bookdesign(
                            text: data['ICTEN'],
                            color: BlueColor,
                            images: data['ICTEP'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ICTE9()));
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
                            text: data['ScienceEN'],
                            color: BlueColor,
                            images: data['ScienceEP'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ScienceB9()));
                            },
                          ),
                          Bookdesign(
                            text: data['PhyEN'],
                            color: GreenColor,
                            images: data['PhyEP'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PhysicE9()));
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
                            text: data['CheEN'],
                            color: GreenColor,
                            images: data['CheEP'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ChemistryE9()));
                            },
                          ),
                          Bookdesign(
                            text: data['BioEN'],
                            color: BlueColor,
                            images: data['BioEP'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BiologyE9()));
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Bookdesign(
                            text: data['HmathEN'],
                            color: BlueColor,
                            images: data['HmathEP'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HmathE9()));
                            },
                          ),
                          Bookdesign(
                            text: data['GeoEN'],
                            color: GreenColor,
                            images: data['GeoEP'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BogulE9()));
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Bookdesign(
                            text: data['EconEN'],
                            color: GreenColor,
                            images: data['EconEP'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EcomomyE9()));
                            },
                          ),
                          Bookdesign(
                            text: data['AriculEN'],
                            color: BlueColor,
                            images: data['AriculEP'],
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
                            text: data['HomeEN'],
                            color: BlueColor,
                            images: data['HomeEP'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomesciE9()));
                            },
                          ),
                          Bookdesign(
                            text: data['CiviEN'],
                            color: GreenColor,
                            images: data['CiviEP'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PolicyE9()));
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Bookdesign(
                            text: data['AccountEN'],
                            color: GreenColor,
                            images: data['AccountEP'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AccountE9()));
                            },
                          ),
                          Bookdesign(
                            text: data['BussEN'],
                            color: BlueColor,
                            images: data['BussEP'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BussnisE9()));
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
                            images: data['IslamEP'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => IslamE9()));
                            },
                          ),
                          Bookdesign(
                            text: data['HinduEN'],
                            color: GreenColor,
                            images: data['HinduEP'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HinduE9()));
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Bookdesign(
                            text: data['CareerEN'],
                            color: GreenColor,
                            images: data['CareerEP'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CarreerE9()));
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
                                      builder: (context) => BFPE9()));
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Bookdesign(
                            text: data['ArtEN'],
                            color: BlueColor,
                            images: data['ArtEP'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ArtE9()));
                            },
                          ),
                          Bookdesign(
                            text: data['HBWEN'],
                            color: GreenColor,
                            images: data['HBWEP'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BhbE9()));
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Bookdesign(
                            text: data['SprotEN'],
                            color: GreenColor,
                            images: data['SprotEP'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SprotE9()));
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
