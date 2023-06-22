import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebook/Engineer/DataBase/Data_Struct_Book.dart';
import 'package:ebook/Engineer/DataBase/Numeric_Book.dart';
import 'package:ebook/widget/Allbookdetails.dart';
import 'package:flutter/material.dart';


class Numeric_View extends StatefulWidget {
  const Numeric_View({Key? key}) : super(key: key);

  @override
  State<Numeric_View> createState() => _Numeric_ViewState();
}

class _Numeric_ViewState extends State<Numeric_View> {
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
                      bookname: data['NumericalN'],
                      image: data['NumericalP'],
                      description: data['NumericalD'],
                      editor: data['NumericalE'],
                      onpress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Numerical_book()));
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
