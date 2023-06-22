import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebook/Science/Bookview/KolpoBook.dart';
import 'package:ebook/widget/Allbookdetails.dart';
import 'package:flutter/material.dart';


class Kolpo_view extends StatefulWidget {
  const Kolpo_view({Key? key}) : super(key: key);

  @override
  State<Kolpo_view> createState() => _Kolpo_viewState();
}

class _Kolpo_viewState extends State<Kolpo_view> {
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
                      bookname: data['KolpoN'],
                      image: data['KolpoP'],
                      description: data['KolpoD'],
                      editor: data['KolpoE'],
                      onpress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Kolpo_book()));
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
