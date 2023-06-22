import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebook/Engineer/DataBase/Databasebook.dart';
import 'package:ebook/Science/Bookview/Roadbook.dart';
import 'package:ebook/widget/Allbookdetails.dart';
import 'package:flutter/material.dart';


class Road_to_view extends StatefulWidget {
  const Road_to_view({Key? key}) : super(key: key);

  @override
  State<Road_to_view> createState() => _Road_to_viewState();
}

class _Road_to_viewState extends State<Road_to_view> {
  final Stream<QuerySnapshot> _Science_fcition =
      FirebaseFirestore.instance.collection('ScienceFcition').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<QuerySnapshot>(
      stream: _Science_fcition,
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
                      bookname: data['RoadN'],
                      image: data['RoadP'],
                      description: data['RoadD'],
                      editor: data['RoadE'],
                      onpress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Road_book()));
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
