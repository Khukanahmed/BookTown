import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Hindu3 extends StatefulWidget {
  const Hindu3({super.key});

  @override
  State<Hindu3> createState() => _Hindu3State();
}

class _Hindu3State extends State<Hindu3> {
  final Stream<QuerySnapshot> _users =
      FirebaseFirestore.instance.collection('ClassThree').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('হিন্দুধর্ম ও নৈতিক শিক্ষা'),
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

              return LayoutBuilder(
                builder: (_, constraints) {

                return Column(
                  children: snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data()! as Map<String, dynamic>;
                    return Container(
                        height: constraints.maxHeight,
                        child:SfPdfViewer.network(data['Hindu3b']));
                  }).toList(),
                );}
              );
            }));
  }
}
