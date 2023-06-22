
import 'package:ebook/Classes/Eight/BanglaVersion8/Banglaversion.dart';
import 'package:ebook/Classes/Eight/EnglishVersion8/Englishversion.dart';

import 'package:flutter/material.dart';


class Class8 extends StatelessWidget {
  const Class8 ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('ClASS EIGHT',
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
        body: TabBarView(
          children: <Widget>[
          Banglaversion8(),
          Englishversion8()
            
          ],
        ),
      ),
    );
  }
}
