import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Kolpo_book extends StatefulWidget {
  const Kolpo_book({super.key});

  @override
  State<Kolpo_book> createState() => _Kolpo_bookState();
}

class _Kolpo_bookState extends State<Kolpo_book> {
  final Stream<QuerySnapshot> _users =
      FirebaseFirestore.instance.collection('ScienceFcition').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('কল্প বিজ্ঞানের গল্প'),
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
                        child: SfPdfViewer.network(data['KolpoB']));
                  }).toList(),
                );
              });
            }));
  }
}
