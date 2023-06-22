import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Islam4 extends StatefulWidget {
  const Islam4({super.key});

  @override
  State<Islam4> createState() => _Islam4State();
}

class _Islam4State extends State<Islam4> {
  final Stream<QuerySnapshot> _users =
      FirebaseFirestore.instance.collection('ClassFour').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('ইসলাম ও নৈতিক শিক্ষা'),
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
                      child:SfPdfViewer.network(data['Islam4b']));
                }).toList(),
              );
            }));
  }
}
