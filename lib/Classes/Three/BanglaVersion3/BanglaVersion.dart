import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebook/Classes/Three/BanglaVersion3/BGS3.dart';
import 'package:ebook/Classes/Three/BanglaVersion3/Bangla3.dart';
import 'package:ebook/Classes/Three/BanglaVersion3/English3.dart';
import 'package:ebook/Classes/Three/BanglaVersion3/Hindu3.dart';
import 'package:ebook/Classes/Three/BanglaVersion3/Islam3.dart';
import 'package:ebook/Classes/Three/BanglaVersion3/Math3.dart';
import 'package:ebook/Classes/Three/BanglaVersion3/Science.dart';
import 'package:ebook/Design/Bookdesign.dart';
import 'package:ebook/Design/color.dart';
import 'package:flutter/material.dart';

class Banglaversion3 extends StatefulWidget {
  const Banglaversion3({super.key});

  @override
  State<Banglaversion3> createState() => _Banglaversion3State();
}

class _Banglaversion3State extends State<Banglaversion3> {
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
                            text: data['Bangla3n'],
                            color: GreenColor,
                            images: data['Bangla3p'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const BBook3()));
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
                                      builder: (context) => const EBook3()));
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
                            text: data['Mathematics3n'],
                            color: BlueColor,
                            images: data['Mathematics3p'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Math3()));
                            },
                          ),
                          Bookdesign(
                            text: data['Science3n'],
                            color: GreenColor,
                            images: data['Science3p'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Science3()));
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
                            text: data['BGS3n'],
                            color: GreenColor,
                            images: data['BGS3p'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const BGS3()));
                            },
                          ),
                          Bookdesign(
                            text: data['Islam3n'],
                            color: BlueColor,
                            images: data['Islam3p'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Islam3()));
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 50),
                      Bookdesign(
                        text: data['Hindu3n'],
                        color: BlueColor,
                        images: data['Hindu3p'],
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Hindu3()));
                        },
                      ),
                    ]));
              }).toList(),
            );
          }),
    );
  }
}
