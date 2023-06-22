import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebook/Classes/Four/BanglaVersion4/BGS4.dart';
import 'package:ebook/Classes/Four/BanglaVersion4/Bangla4.dart';
import 'package:ebook/Classes/Four/BanglaVersion4/English4.dart';
import 'package:ebook/Classes/Four/BanglaVersion4/Hindu4.dart';
import 'package:ebook/Classes/Four/BanglaVersion4/Islam4.dart';
import 'package:ebook/Classes/Four/BanglaVersion4/Math4.dart';
import 'package:ebook/Classes/Four/BanglaVersion4/Science4.dart';
import 'package:ebook/Design/Bookdesign.dart';
import 'package:ebook/Design/color.dart';
import 'package:flutter/material.dart';

class Banglaversion4 extends StatefulWidget {
  const Banglaversion4({super.key});

  @override
  State<Banglaversion4> createState() => _Banglaversion4State();
}

class _Banglaversion4State extends State<Banglaversion4> {
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
                            text: data['Bangla4n'],
                            color: GreenColor,
                            images: data['Bangla4p'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BBook4()));
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
                                      builder: (context) => EBook4()));
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
                            text: data['Math4n'],
                            color: BlueColor,
                            images: data['Math4p'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Math4()));
                            },
                          ),
                          Bookdesign(
                            text: data['Science4n'],
                            color: GreenColor,
                            images: data['Science4p'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Science4()));
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
                            text: data['BGS4n'],
                            color: GreenColor,
                            images: data['BGS4p'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BGS4()));
                            },
                          ),
                          Bookdesign(
                            text: data['Islam4n'],
                            color: BlueColor,
                            images: data['Islam4p'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Islam4()));
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 50),
                      Bookdesign(
                        text: data['Hindu4n'],
                        color: BlueColor,
                        images: data['Hindu4p'],
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Hindu4()));
                        },
                      ),
                    ]));
              }).toList(),
            );
          }),
    );
  }
}
