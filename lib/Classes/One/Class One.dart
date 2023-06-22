import 'package:flutter/material.dart';
import 'BanglaVersion/BanglaVersion.dart';
import 'EnglishVersion/EnglishVersion.dart';

class ClassOne extends StatelessWidget {
  const ClassOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('ClASS ONE',
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
           Bangladesboard(),
            Englishdesboard()
            
          ],
        ),
      ),
    );
  }
}
