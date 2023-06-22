import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebook/Classes/Two/BanglaB/BBook2.dart';
import 'package:ebook/Classes/Two/EnglishB/EBook2.dart';
import 'package:ebook/Classes/Two/MathB/MBook2.dart';
import 'package:ebook/Design/Bookdesign.dart';
import 'package:ebook/Design/color.dart';
import 'package:flutter/material.dart';

class Banglaversion extends StatefulWidget {
  const Banglaversion({super.key});

  @override
  State<Banglaversion> createState() => _BanglaversionState();
}

class _BanglaversionState extends State<Banglaversion> {
  final Stream<QuerySnapshot> _classtwo =
      FirebaseFirestore.instance.collection('ClassTwo').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: _classtwo,
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
                            text: data['Bangla2n'],
                            color: GreenColor,
                            images: data['Bangla2p'],
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder:(context)=>BBook2()));
                            },
                          ),
                          Bookdesign(
                            text: data['English2n'],
                            color: BlueColor,
                            images: data['English2p'],
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder:(context)=>EBook2()));
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Bookdesign(
                        text: data['Math2n_BV'],
                        color: GreenColor,
                        images: data['Math2p_BV'],
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder:(context)=>MBook2()));
                        },
                      ),
                    ]));
              }).toList(),
            );
          }),
    );
  }
}
