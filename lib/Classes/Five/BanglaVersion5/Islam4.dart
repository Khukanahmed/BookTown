import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Islam5 extends StatefulWidget {
  const Islam5({super.key});

  @override
  State<Islam5> createState() => _Islam5State();
}

class _Islam5State extends State<Islam5> {
  final Stream<QuerySnapshot> _users =
      FirebaseFirestore.instance.collection('ClassFive').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ইসলাম ও নৈতিক শিক্ষা'),
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
                        child: SfPdfViewer.network(data['Islam5b']));
                  }).toList(),
                );
              });
            }));
  }
}
