import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebook/Engineer/DataBase/Let_book.dart';
import 'package:ebook/Engineer/DataBase/Oop_book.dart';
import 'package:ebook/Engineer/DataBase/Toc_book.dart';
import 'package:ebook/widget/Allbookdetails.dart';
import 'package:flutter/material.dart';

class Toc_View extends StatefulWidget {
  const Toc_View({Key? key}) : super(key: key);

  @override
  State<Toc_View> createState() => _Toc_ViewState();
}

class _Toc_ViewState extends State<Toc_View> {
  final Stream<QuerySnapshot> _classone =
      FirebaseFirestore.instance.collection('Engineering').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<QuerySnapshot>(
      stream: _classone,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Something went wrong'));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            return Container(
              child: Column(
                children: [
                  BookDetail(
                      bookname: data['TocN'],
                      image: data['TocP'],
                      description: data['TocD'],
                      editor: data['TocE'],
                      onpress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Toc_book()));
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
