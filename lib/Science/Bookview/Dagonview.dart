import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebook/Science/Bookview/DagonBook.dart';
import 'package:ebook/widget/Allbookdetails.dart';
import 'package:flutter/material.dart';


class Dagon_view extends StatefulWidget {
  const Dagon_view({Key? key}) : super(key: key);

  @override
  State<Dagon_view> createState() => _Dagon_viewState();
}

class _Dagon_viewState extends State<Dagon_view> {
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
                      bookname: data['DagonN'],
                      image: data['DagonP'],
                      description: data['DagonD'],
                      editor: data['DagonE'],
                      onpress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Dagon_book()));
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
