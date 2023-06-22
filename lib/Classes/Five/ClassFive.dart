import 'package:ebook/Classes/Five/BanglaVersion5/BanglaVersion.dart';
import 'package:ebook/Classes/Five/EnglishVersion5/EnglishVersion.dart';
import 'package:flutter/material.dart';


class ClassFive extends StatelessWidget {
  const ClassFive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('ClASS FIVE',
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
            Banglaversion5(),
            Englishversion5()
            
          ],
        ),
      ),
    );
  }
}
