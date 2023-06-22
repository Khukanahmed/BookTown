import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class BBook2 extends StatefulWidget {
  const BBook2({super.key});

  @override
  State<BBook2> createState() => _BBook2State();
}

class _BBook2State extends State<BBook2> {
  final Stream<QuerySnapshot> _users =
      FirebaseFirestore.instance.collection('ClassTwo').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('আমার বাংলা বই'),
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
                        child: SfPdfViewer.network(data['Bangla2b']));
                  }).toList(),
                );
              });
            }));
  }
}
