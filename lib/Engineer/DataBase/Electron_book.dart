import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Electron_book extends StatefulWidget {
  const Electron_book({super.key});

  @override
  State<Electron_book> createState() => _Electron_bookState();
}

class _Electron_bookState extends State<Electron_book> {
  final Stream<QuerySnapshot> _users =
      FirebaseFirestore.instance.collection('Engineering').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Electronic Communication'),
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

              return LayoutBuilder(builder: (_, Constraints) {
                return Column(
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data()! as Map<String, dynamic>;
                    return Container(
                        height: Constraints.maxHeight,
                        child: SfPdfViewer.network(data['ElecltorB']));
                  }).toList(),
                );
              });
            }));
  }
}
