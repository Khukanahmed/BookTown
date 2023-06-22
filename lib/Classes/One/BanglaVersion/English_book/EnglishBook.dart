// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ebook/Classes/One/BanglaVersion/English_book/EBook.dart';
// import 'package:ebook/Design/Bookdesign.dart';
// import 'package:ebook/widget/Allbookdetails.dart';
// import 'package:flutter/material.dart';


// class English extends StatefulWidget {
//   const English({Key? key}) : super(key: key);

//   @override
//   State<English> createState() => _EnglishState();
// }

// class _EnglishState extends State<English> {
//   final Stream<QuerySnapshot> _classone =
//       FirebaseFirestore.instance.collection('Class One').snapshots();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: StreamBuilder<QuerySnapshot>(
//       stream: _classone,
//       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//         if (snapshot.hasError) {
//           return Center(child: Text('Something went wrong'));
//         }

//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(child: CircularProgressIndicator());
//         }
//         return ListView(
//           children: snapshot.data!.docs.map((DocumentSnapshot document) {
//             Map<String, dynamic> data =
//                 document.data()! as Map<String, dynamic>;
//             return Container(
//               child: Column(
//                 children: [
//                   BookDetail(
//                       bookname: data['book_name'],
//                       image: data['image'],
//                       description: data['Description'],
//                       editor: data['Editor'],
//                       onpress: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => EnglishBook()));
//                       })
//                 ],
//               ),
//             );
//           }).toList(),
//         );
//       },
//     ));
//   }
// }
