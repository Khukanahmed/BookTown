import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebook/Classes/Four/BanglaVersion4/Bangla4.dart';
import 'package:ebook/Classes/Four/BanglaVersion4/English4.dart';
import 'package:ebook/Classes/Four/EnglishVersion4/BGS4E.dart';
import 'package:ebook/Classes/Four/EnglishVersion4/Hindu4E.dart';
import 'package:ebook/Classes/Four/EnglishVersion4/Islam4E.dart';
import 'package:ebook/Classes/Four/EnglishVersion4/Math4E.dart';
import 'package:ebook/Classes/Four/EnglishVersion4/Science4E.dart';
import 'package:ebook/Design/Bookdesign.dart';
import 'package:ebook/Design/color.dart';
import 'package:flutter/material.dart';

class Englishversion4 extends StatefulWidget {
  const Englishversion4({super.key});

  @override
  State<Englishversion4> createState() => _Englishversion4State();
}

class _Englishversion4State extends State<Englishversion4> {
  final Stream<QuerySnapshot> _classfour =
      FirebaseFirestore.instance.collection('ClassFour').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: _classfour,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Center(child: Text('Something went wrong'));
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
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
                            text: data['Bangla4n'],
                            color: GreenColor,
                            images: data['Bangla4p'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const BBook4()));
                            },
                          ),
                          Bookdesign(
                            text: data['English4n'],
                            color: BlueColor,
                            images: data['English4p'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const EBook4()));
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
                            text: data['Math4n(EV)'],
                            color: BlueColor,
                            images: data['Math4p(EV)'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Math4E()));
                            },
                          ),
                          Bookdesign(
                            text: data['Science4n(EV)'],
                            color: GreenColor,
                            images: data['Science4p(EV)'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Science4E()));
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
                            text: data['BGS4n(EV)'],
                            color: GreenColor,
                            images: data['BGS4p(EV)'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BGS4E()));
                            },
                          ),
                          Bookdesign(
                            text: data['Islam4n(EV)'],
                            color: BlueColor,
                            images: data['Islam4p(EV)'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Islam4E()));
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 50),
                      Bookdesign(
                        text: data['Hindu4n(EV)'],
                        color: GreenColor,
                        images: data['Hindu4p(EV)'],
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Hindu4E()));
                        },
                      ),
                    ]));
              }).toList(),
            );
          }),
    );
  }
}
