import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Hindu4E extends StatefulWidget {
  const Hindu4E({super.key});

  @override
  State<Hindu4E> createState() => _Hindu4EState();
}

class _Hindu4EState extends State<Hindu4E> {
  final Stream<QuerySnapshot> _users =
      FirebaseFirestore.instance.collection('ClassFour').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Hindu Religion And Moral Education'),
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
                      child:SfPdfViewer.network(data['Hindu4b(EV)']));
                }).toList(),
              );
            }));
  }
}
