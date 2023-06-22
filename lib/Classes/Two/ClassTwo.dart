import 'package:ebook/Classes/Two/BanglaVersion.dart';
import 'package:ebook/Classes/Two/EnglishVersion.dart';
import 'package:flutter/material.dart';

class ClassTwo extends StatelessWidget {
  const ClassTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('CLASS TWO',
          style: TextStyle(fontWeight: FontWeight.bold)
          ),
          centerTitle: true,
          bottom: const TabBar(
            indicatorColor: Colors.white,
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.cloud_outlined),
                text:'Bangla Version'
              ),
              Tab(
                icon: Icon(Icons.beach_access_sharp),
                text: 'English Version',
              ),
              
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
          Banglaversion(),
          Englishversion()
            
          ],
        ),
      ),
    );
  }
}