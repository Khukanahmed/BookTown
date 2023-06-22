import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebook/Classes/Three/BanglaVersion3/Bangla3.dart';
import 'package:ebook/Classes/Three/BanglaVersion3/English3.dart';
import 'package:ebook/Classes/Three/EnglishVersion3/BGS3E.dart';
import 'package:ebook/Classes/Three/EnglishVersion3/Hindu3E.dart';
import 'package:ebook/Classes/Three/EnglishVersion3/Islam3E.dart';
import 'package:ebook/Classes/Three/EnglishVersion3/Math3E.dart';
import 'package:ebook/Classes/Three/EnglishVersion3/Science3E.dart';
import 'package:ebook/Design/Bookdesign.dart';
import 'package:ebook/Design/color.dart';
import 'package:flutter/material.dart';

class Englishversion3 extends StatefulWidget {
  const Englishversion3({super.key});

  @override
  State<Englishversion3> createState() => _Englishversion3State();
}

class _Englishversion3State extends State<Englishversion3> {
  final Stream<QuerySnapshot> _classthree =
      FirebaseFirestore.instance.collection('ClassThree').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: _classthree,
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
                            text: data['Bangla3n'],
                            color: GreenColor,
                            images: data['Bangla3p'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BBook3()));
                            },
                          ),
                          Bookdesign(
                            text: data['English3n'],
                            color: BlueColor,
                            images: data['English3p'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EBook3()));
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
                            text: data['Mathematics3n(EV)'],
                            color: BlueColor,
                            images: data['Mathematics3p(EV)'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Math3E()));
                            },
                          ),
                          Bookdesign(
                            text: data['Science3n(EV)'],
                            color: GreenColor,
                            images: data['Science3p(EV)'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Science3E()));
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
                            text: data['BGS3n(EV)'],
                            color:GreenColor ,
                            images: data['BGS3p(EV)'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BGS3E()));
                            },
                          ),
                          Bookdesign(
                            text: data['Islam3n(EV)'],
                            color: BlueColor,
                            images: data['Islam3p(EV)'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Islam3E()));
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 50),
                      Bookdesign(
                        text: data['Hindu3n(EV)'],
                        color: GreenColor,
                        images: data['Hindu3p(EV)'],
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Hindu3E()));
                        },
                      ),
                    ]));
              }).toList(),
            );
          }),
    );
  }
}
