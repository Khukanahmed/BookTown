import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebook/Science/Bookview/KohokBook.dart';
import 'package:ebook/widget/Allbookdetails.dart';
import 'package:flutter/material.dart';


class Kohok_view extends StatefulWidget {
  const Kohok_view({Key? key}) : super(key: key);

  @override
  State<Kohok_view> createState() => _Kohok_viewState();
}

class _Kohok_viewState extends State<Kohok_view> {
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
                      bookname: data['KohokN'],
                      image: data['KohokP'],
                      description: data['KohokD'],
                      editor: data['KohokE'],
                      onpress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Kohok_book()));
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
