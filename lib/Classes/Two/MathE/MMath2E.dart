import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class MBook2E extends StatefulWidget {
  const MBook2E({super.key});

  @override
  State<MBook2E> createState() => _MBook2EState();
}

class _MBook2EState extends State<MBook2E> {
  final Stream<QuerySnapshot> _users =
      FirebaseFirestore.instance.collection('ClassTwo').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Mathematics'),
        centerTitle: true,
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: _users,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text("Loading");
              }

              return LayoutBuilder(
                builder: (context, constraints)
                {
                return Column(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                  return Container(
                      height:constraints.maxHeight,
                      child:SfPdfViewer.network(data['Math2b_EV']));
                }).toList());
                });
            }));
  }
}
