import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebook/Classes/Five/BanglaVersion5/BGS5.dart';
import 'package:ebook/Classes/Five/BanglaVersion5/Bangla5.dart';
import 'package:ebook/Classes/Five/BanglaVersion5/English5.dart';
import 'package:ebook/Classes/Five/BanglaVersion5/Math4.dart';
import 'package:ebook/Classes/Five/BanglaVersion5/Science4.dart';
import 'package:ebook/Classes/Four/BanglaVersion4/Hindu4.dart';
import 'package:ebook/Classes/Four/BanglaVersion4/Islam4.dart';
import 'package:ebook/Design/Bookdesign.dart';
import 'package:ebook/Design/color.dart';
import 'package:flutter/material.dart';

class Banglaversion5 extends StatefulWidget {
  const Banglaversion5({super.key});

  @override
  State<Banglaversion5> createState() => _Banglaversion5State();
}

class _Banglaversion5State extends State<Banglaversion5> {
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
                            text: data['Bangla5n'],
                            color: GreenColor,
                            images: data['Bangla5p'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BBook5()));
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
                                      builder: (context) => EBook5()));
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
                            text: data['Math5n'],
                            color: BlueColor,
                            images: data['Math5p'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Math5()));
                            },
                          ),
                          Bookdesign(
                            text: data['Science5n'],
                            color: GreenColor,
                            images: data['Science5p'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Science5()));
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
                            text: data['BGS5n'],
                            color: GreenColor,
                            images: data['BGS5p'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BGS5()));
                            },
                          ),
                          Bookdesign(
                            text: data['Islam5n'],
                            color: BlueColor,
                            images: data['Islam5p'],
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
