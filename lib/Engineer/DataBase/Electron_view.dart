import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebook/Engineer/DataBase/Electron_book.dart';
import 'package:ebook/widget/Allbookdetails.dart';
import 'package:flutter/material.dart';

class Electron_View extends StatefulWidget {
  const Electron_View({Key? key}) : super(key: key);

  @override
  State<Electron_View> createState() => _Electron_ViewState();
}

class _Electron_ViewState extends State<Electron_View> {
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
                      bookname: data['ElecltorN'],
                      image: data['ElecltorP'],
                      description: data['ElecltorD'],
                      editor: data['ElecltorE'],
                      onpress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Electron_book()));
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
