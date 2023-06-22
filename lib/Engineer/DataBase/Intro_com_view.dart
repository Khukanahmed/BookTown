import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebook/Engineer/DataBase/Intro_com_book.dart';
import 'package:ebook/widget/Allbookdetails.dart';
import 'package:flutter/material.dart';

class Intro_com_View extends StatefulWidget {
  const Intro_com_View({Key? key}) : super(key: key);

  @override
  State<Intro_com_View> createState() => _Intro_com_ViewState();
}

class _Intro_com_ViewState extends State<Intro_com_View> {
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
                      bookname: data['Intro_comN'],
                      image: data['Intro_comP'],
                      description: data['Intro_comD'],
                      editor: data['Intro_comE'],
                      onpress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Intro_com_book()));
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
