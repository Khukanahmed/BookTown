import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebook/Engineer/DataBase/Data_Struct_Book.dart';
import 'package:ebook/widget/Allbookdetails.dart';
import 'package:flutter/material.dart';

class Data_Struct_View extends StatefulWidget {
  const Data_Struct_View({Key? key}) : super(key: key);

  @override
  State<Data_Struct_View> createState() => _Data_Struct_ViewState();
}

class _Data_Struct_ViewState extends State<Data_Struct_View> {
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
                      bookname: data['Data_StructN'],
                      image: data['Data_StructP'],
                      description: data['Data_StructD'],
                      editor: data['Data_StructE'],
                      onpress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Data_Struct_book()));
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
