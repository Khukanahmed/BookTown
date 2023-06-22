import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebook/Science/Bookview/BoroBook.dart';
import 'package:ebook/widget/Allbookdetails.dart';
import 'package:flutter/material.dart';


class Boro_view extends StatefulWidget {
  const Boro_view({Key? key}) : super(key: key);

  @override
  State<Boro_view> createState() => _Boro_viewState();
}

class _Boro_viewState extends State<Boro_view> {
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
                      bookname: data['BoroN'],
                      image: data['BoroP'],
                      description: data['BoroD'],
                      editor: data['BoroE'],
                      onpress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Boro_book()));
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
