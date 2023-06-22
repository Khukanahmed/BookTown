import 'package:flutter/material.dart';
import 'BanglaVersion4/BanglaVersion.dart';
import 'EnglishVersion4/EnglishVersion.dart';


class ClassFour extends StatelessWidget {
  const ClassFour({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('CLASS FOUR',
              style: TextStyle(fontWeight: FontWeight.bold)),
          centerTitle: true,
          bottom: const TabBar(
            indicatorColor: Colors.white,
            tabs: <Widget>[
              Tab(icon: Icon(Icons.cloud_outlined), text: 'Bangla Version'),
              Tab(
                icon: Icon(Icons.beach_access_sharp),
                text: 'English Version',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            Banglaversion4(), 
            Englishversion4()
            ],
        ),
      ),
    );
  }
}
