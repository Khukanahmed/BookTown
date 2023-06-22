import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class DatabaseBook extends StatefulWidget {
  const DatabaseBook({super.key});

  @override
  State<DatabaseBook> createState() => _DatabaseBookState();
}

class _DatabaseBookState extends State<DatabaseBook> {
  final Stream<QuerySnapshot> _classone =
      FirebaseFirestore.instance.collection('Engineering').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Database Management System'),
          centerTitle: true,
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: _classone,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text('Something went wrong'));
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              return Column(
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                return Column(
                  children: [
                    Container(
                      height: 614.h,
                      child: Expanded(
                          flex: 10,
                          child: SfPdfViewer.network(
                            data['SoftwareBook'],
                          )),
                    ),
                  ],
                );
              }).toList());
            }));
  }
}
