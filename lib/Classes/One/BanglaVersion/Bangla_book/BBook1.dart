import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class BanglaBook extends StatefulWidget {
  const BanglaBook({super.key});

  @override
  State<BanglaBook> createState() => _BanglaBookState();
}

class _BanglaBookState extends State<BanglaBook> {
  final Stream<QuerySnapshot> _users =
      FirebaseFirestore.instance.collection('Class one').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('আমার বাংলা বই'),
        centerTitle: true,
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: _users,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text("Loading");
              }

              return Column(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                  return Container(
                      height: 758,
                      child:SfPdfViewer.network(data['Bangla1b']));
                }).toList(),
              );
            }));
  }
}
