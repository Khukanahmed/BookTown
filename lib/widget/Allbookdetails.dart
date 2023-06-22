//import 'dart:html';

import 'package:flutter/material.dart';

class BookDetail extends StatelessWidget {
  String bookname;
  String description;
  String editor;
  VoidCallback onpress;
  String image;

  BookDetail(
      {required this.bookname,
      required this.image,
      required this.description,
      required this.editor,
      required this.onpress});

  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton(
            onPressed: () {
              Navigator.pop(context);
            },
            backgroundColor: Color(0xff4BC6CE),
            child: Icon(Icons.arrow_back),
          ),
        ),
        Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Text(
                  bookname,
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Image.network(
                image,
                width: 150,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 42,
              width: 140,
              decoration: BoxDecoration(
                  color: Color(0xff4BC6CE),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: TextButton(
                  child: Text('Read Book',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: Colors.black)),
                  onPressed: onpress),
            ),
            SizedBox(
              width: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Column(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.file_download_outlined,
                        color: Colors.white,
                        size: 35,
                      )),
                  Text('Download',
                      style: TextStyle(
                          fontWeight: FontWeight.w700, color: Colors.white)),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Description :',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white)),
              Text(description,
                  //textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      // fontWeight: FontWeight.w700,
                      color: Colors.white)),
              SizedBox(
                height: 20,
              ),
              Text('Editons :',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white)),
              Text(editor,
                  style: TextStyle(
                      fontSize: 16,
                      // fontWeight: FontWeight.w700,
                      color: Colors.white))
            ],
          ),
        )
      ],
    );
  }
}
