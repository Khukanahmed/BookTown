import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebook/Classes/Five/BanglaVersion5/Bangla5.dart';
import 'package:ebook/Classes/Five/BanglaVersion5/English5.dart';
import 'package:ebook/Classes/Five/EnglishVersion5/BGS5E.dart';
import 'package:ebook/Classes/Five/EnglishVersion5/Hindu5E.dart';
import 'package:ebook/Classes/Five/EnglishVersion5/Islam5E.dart';
import 'package:ebook/Classes/Five/EnglishVersion5/Math5E.dart';
import 'package:ebook/Classes/Five/EnglishVersion5/Science5E.dart';
import 'package:ebook/Design/Bookdesign.dart';
import 'package:ebook/Design/color.dart';
import 'package:flutter/material.dart';

class Englishversion5 extends StatefulWidget {
  const Englishversion5({super.key});

  @override
  State<Englishversion5> createState() => _Englishversion5State();
}

class _Englishversion5State extends State<Englishversion5> {
  final Stream<QuerySnapshot> _classfive =
      FirebaseFirestore.instance.collection('ClassFive').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: _classfive,
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
                            text: data['Bangla5n'],
                            color: GreenColor,
                            images: data['Bangla5p'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const BBook5()));
                            },
                          ),
                          Bookdesign(
                            text: data['English5n'],
                            color: BlueColor,
                            images: data['English5p'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const EBook5()));
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
                            text: data['Math5n(EV)'],
                            color: BlueColor,
                            images: data['Math5p(EV)'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Math5E()));
                            },
                          ),
                          Bookdesign(
                            text: data['Science5n(EV)'],
                            color: GreenColor,
                            images: data['Science5p(EV)'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Science5E()));
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
                            text: data['BGS5n(EV)'],
                            color: GreenColor,
                            images: data['BGS5p(EV)'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BGS5E()));
                            },
                          ),
                          Bookdesign(
                            text: data['Islam5n(EV)'],
                            color: BlueColor,
                            images: data['Islam5p(EV)'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Islam5E()));
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
                                  builder: (context) => Hindu5E()));
                        },
                      ),
                    ]));
              }).toList(),
            );
          }),
    );
  }
}
