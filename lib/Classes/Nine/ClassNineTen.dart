import 'package:ebook/Classes/Nine/BanglaVersion9-10/Banglaversion.dart';
import 'package:ebook/Classes/Nine/EnglishVersion9-10/Englishversion.dart';
import 'package:flutter/material.dart';

class Class910 extends StatelessWidget {
  const Class910({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('ClASS NINE || TEN',
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
        body: TabBarView(
          children: <Widget>[Banglaversion910(), Englishversion910()],
        ),
      ),
    );
  }
}
