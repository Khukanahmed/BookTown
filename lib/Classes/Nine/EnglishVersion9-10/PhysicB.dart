import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PhysicE9 extends StatefulWidget {
  const PhysicE9({super.key});

  @override
  State<PhysicE9> createState() => _PhysicE9State();
}

class _PhysicE9State extends State<PhysicE9> {
  final Stream<QuerySnapshot> _users =
      FirebaseFirestore.instance.collection('Class910').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('পদার্থবিজ্ঞান'),
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
                        child: SfPdfViewer.network(data['PhyEB']));
                  }).toList(),
                );
              });
            }));
  }
}
