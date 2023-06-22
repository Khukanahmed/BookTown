import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebook/Science/Bookview/TheMaskBook.dart';
import 'package:ebook/widget/Allbookdetails.dart';
import 'package:flutter/material.dart';


class Mask_view extends StatefulWidget {
  const Mask_view({Key? key}) : super(key: key);

  @override
  State<Mask_view> createState() => _Mask_viewState();
}

class _Mask_viewState extends State<Mask_view> {
  final Stream<QuerySnapshot> _Science_fcition =
      FirebaseFirestore.instance.collection('ScienceFcition').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<QuerySnapshot>(
      stream: _Science_fcition,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text('Something went wrong'));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            return Container(
              child: Column(
                children: [
                  BookDetail(
                      bookname: data['TheMasksN'],
                      image: data['TheMasksP'],
                      description: data['TheMasksD'],
                      editor: data['TheMasksE'],
                      onpress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const TheMaks_book()));
                      })
                ],
              ),
            );
          }).toList(),
        );
      },
    ));
  }
}
