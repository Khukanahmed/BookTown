import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Science4E extends StatefulWidget {
  const Science4E({super.key});

  @override
  State<Science4E> createState() => _Science4EState();
}

class _Science4EState extends State<Science4E> {
  final Stream<QuerySnapshot> _users =
      FirebaseFirestore.instance.collection('ClassFour').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('প্রাথমিক বিজ্ঞান'),
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
                      child:SfPdfViewer.network(data['Science4b(EV)']));
                }).toList(),
              );
            }));
  }
}
