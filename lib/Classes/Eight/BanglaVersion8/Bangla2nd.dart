import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class BBook2nd8 extends StatefulWidget {
  const BBook2nd8({super.key});

  @override
  State<BBook2nd8> createState() => _BBook2nd8State();
}

class _BBook2nd8State extends State<BBook2nd8> {
  final Stream<QuerySnapshot> _users =
      FirebaseFirestore.instance.collection('ClassEight').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('বাংলা ব্যকরণ ও নির্মিতি'),
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
                        child: SfPdfViewer.network(data['Bangla2B']));
                  }).toList(),
                );
              });
            }));
  }
}
