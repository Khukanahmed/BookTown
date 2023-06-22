import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebook/Classes/One/BanglaVersion/Bangla_book/BBook1.dart';
import 'package:ebook/Design/Bookdetalis.dart';
import 'package:ebook/Classes/One/BanglaVersion/English_book/EnglishBook.dart';
import 'package:ebook/Classes/One/BanglaVersion/Math_book/Ebook.dart';

import 'package:ebook/Design/Bookdesign.dart';
import 'package:ebook/Design/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'English_book/EBook.dart';

class Bangladesboard extends StatefulWidget {
  const Bangladesboard({Key? key}) : super(key: key);

  @override
  State<Bangladesboard> createState() => _BangladesboardState();
}

class _BangladesboardState extends State<Bangladesboard> {
  final Stream<QuerySnapshot> _classone =
      FirebaseFirestore.instance.collection('Class one').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
            stream: _classone,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text('Something went wrong'));
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              return ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    var indexData = snapshot.data.docs[index].data()
                        as Map<String, dynamic>;
                    return Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 60, horizontal: 10),
                        child: Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Bookdesign(
                                text: indexData['Bangla1n'],
                                color: GreenColor,
                                images: indexData['Bangla1p'],
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => BanglaBook()));
                                },
                              ),
                              Bookdesign(
                                text: indexData['English1n'],
                                color: BlueColor,
                                images: indexData['English1p'],
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => EnglishBook()));
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          Bookdesign(
                            text: indexData['Math1n(BV)'],
                            color: GreenColor,
                            images: indexData['Math1p(BV)'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MathBook()));
                            },
                          ),
                        ]));
                  });
            }
                         
            ));
  }
}
