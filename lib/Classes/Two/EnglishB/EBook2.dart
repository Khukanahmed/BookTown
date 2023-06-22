import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class EBook2 extends StatefulWidget {
  const EBook2({super.key});

  @override
  State<EBook2> createState() => _EBook2State();
}

class _EBook2State extends State<EBook2> {
  final Stream<QuerySnapshot> _users =
      FirebaseFirestore.instance.collection('ClassTwo').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('English For Today'),
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

              return LayoutBuilder(builder: (_, constraints) {
                return Column(
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data()! as Map<String, dynamic>;
                    return Container(
                        height: constraints.maxHeight,
                        child: SfPdfViewer.network(data['English2b']));
                  }).toList(),
                );
              });
            }));
  }
}
