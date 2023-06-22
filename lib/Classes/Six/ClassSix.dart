import 'package:ebook/Classes/Five/EnglishVersion5/EnglishVersion.dart';
import 'package:ebook/Classes/Six/BanglaVersion6/Banglaversion.dart';
import 'package:ebook/Classes/Six/EnglishVersion6/Englishversion.dart';
import 'package:flutter/material.dart';


class Class6 extends StatelessWidget {
  const Class6 ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('ClASS SIX',
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
          Banglaversion6(),
          Englishversion6()
            
          ],
        ),
      ),
    );
  }
}
