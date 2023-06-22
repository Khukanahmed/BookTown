import 'package:ebook/Classes/Seven/BanglaVersion7/Banglaversion.dart';
import 'package:ebook/Classes/Seven/EnglishVersion7/Englishversion.dart';
import 'package:flutter/material.dart';

class Class7 extends StatelessWidget {
  const Class7({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ClASS SEVEN',
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
            Banglaversion7(),
            Englishversion7()],
        ),
      ),
    );
  }
}
