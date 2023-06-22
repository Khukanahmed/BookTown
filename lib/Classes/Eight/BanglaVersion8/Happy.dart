import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class BBook3rd8 extends StatefulWidget {
  const BBook3rd8({super.key});

  @override
  State<BBook3rd8> createState() => _BBook3rd8State();
}

class _BBook3rd8State extends State<BBook3rd8> {
  final Stream<QuerySnapshot> _users =
      FirebaseFirestore.instance.collection('ClassEight').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('আনন্দ পাঠ(বাংলা দ্রুত পঠন)'),
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
                        child: SfPdfViewer.network(data['HappyB']));
                  }).toList(),
                );
              });
            }));
  }
}
