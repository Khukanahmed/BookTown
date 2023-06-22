import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class BGS3 extends StatefulWidget {
  const BGS3({super.key});

  @override
  State<BGS3> createState() => _BGS3State();
}

class _BGS3State extends State<BGS3> {
  final Stream<QuerySnapshot> _users =
      FirebaseFirestore.instance.collection('ClassThree').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('বাংলাদেশ ও বিশ্বপরিচয়'),
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

              return LayoutBuilder(builder: (_, constraints) {
                return Column(
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data()! as Map<String, dynamic>;
                    return Container(
                        height: constraints.maxHeight,
                        child: SfPdfViewer.network(data['BGS3b']));
                  }).toList(),
                );
              });
            }));
  }
}
