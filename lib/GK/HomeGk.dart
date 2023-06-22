import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ebook/Design/Bookdesign.dart';
import 'package:ebook/Design/color.dart';
import 'package:ebook/GK/10min.dart';
import 'package:ebook/GK/Bbc.dart';
import 'package:ebook/GK/Birth.dart';
import 'package:ebook/GK/Biya.dart';
import 'package:ebook/GK/Day.dart';
import 'package:ebook/GK/EasyEnglishBook.dart';
import 'package:ebook/GK/Majab.dart';
import 'package:ebook/GK/Mascala1.dart';
import 'package:ebook/GK/Meye.dart';
import 'package:ebook/GK/Namaj.dart';
import 'package:ebook/GK/Roho.dart';
import 'package:ebook/GK/Shajid1.dart';
import 'package:ebook/GK/Shajid2.dart';
import 'package:ebook/GK/Taohid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GKHome extends StatefulWidget {
  const GKHome({Key? key}) : super(key: key);

  @override
  State<GKHome> createState() => _GKHomeState();
}

class _GKHomeState extends State<GKHome> {
  final Stream<QuerySnapshot> _islamic =
      FirebaseFirestore.instance.collection('GK+islamic').snapshots();
  @override
  Widget build(BuildContext context) {
    Connectivity connectivity = Connectivity();
    return Scaffold(
        appBar: AppBar(
          title: Text('GK || ISLAMIC'),
          centerTitle: true,
        ),
        body:
        StreamBuilder<ConnectivityResult>(
            stream: connectivity.onConnectivityChanged,
            builder: (_, snapshot) {
              return InternetConnect(
                snapshot: snapshot,
                widget:
         StreamBuilder(
            stream: _islamic,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text('Something went wrong'));
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              return ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    var indexData = snapshot.data.docs[index].data()
                        as Map<String, dynamic>;
                    return Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 60, horizontal: 10),
                        child: Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Bookdesign(
                                text: indexData['10minN'],
                                color: GreenColor,
                                images: indexData['10minP'],
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => TenMinBook()));
                                },
                              ),
                              Bookdesign(
                                text: indexData['BbbcN'],
                                color: BlueColor,
                                images: indexData['BbcP'],
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => BBCBook()));
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Bookdesign(
                                text: indexData['EasyN'],
                                color: BlueColor,
                                images: indexData['EasyP'],
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              EasyEnglishBook()));
                                },
                              ),
                              Bookdesign(
                                text: indexData['MeyeN'],
                                color: GreenColor,
                                images: indexData['MeyeP'],
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MeyeBook()));
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Bookdesign(
                                text: indexData['islamicbiyaN'],
                                color: GreenColor,
                                images: indexData['islamicbiyaP'],
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => BibahoBook()));
                                },
                              ),
                              Bookdesign(
                                text: indexData['Pera1N'],
                                color: BlueColor,
                                images: indexData['Pera1P'],
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Shajid1Book()));
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Bookdesign(
                                text: indexData['Pera2N'],
                                color: BlueColor,
                                images: indexData['Pera2P'],
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Shajid2Book()));
                                },
                              ),
                              Bookdesign(
                                text: indexData['DayN'],
                                color: GreenColor,
                                images: indexData['DayP'],
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DayBook()));
                                },
                              ),
                            ],
                          ),

                          SizedBox(
                            height: 40.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Bookdesign(
                                text: indexData['BirthN'],
                                color: GreenColor,
                                images: indexData['BirthP'],
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => BrithBook()));
                                },
                              ),
                              Bookdesign(
                                text: indexData['FotoyaN'],
                                color: GreenColor,
                                images: indexData['FotoyaP'],
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Macala1Book()));
                                },
                              ),
                            ],
                          ),
                            SizedBox(
                            height: 40.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Bookdesign(
                                text: indexData['MajabN'],
                                color: GreenColor,
                                images: indexData['MajabP'],
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MajabBook()));
                                },
                              ),
                              Bookdesign(
                                text: indexData['NamajN'],
                                color: GreenColor,
                                images: indexData['NamajP'],
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => NamajBook()));
                                },
                              ),
                            ],
                          ),

                           SizedBox(
                            height: 40.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Bookdesign(
                                text: indexData['TaohidN'],
                                color: GreenColor,
                                images: indexData['TaohidP'],
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => TaohidBook()));
                                },
                              ),
                              Bookdesign(
                                text: indexData['RohoN'],
                                color: GreenColor,
                                images: indexData['RohoP'],
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => RohoBook()));
                                },
                              ),
                            ],
                          ),
                        ]));
                  });
            }));
  }) 
            );
  }
}


class InternetConnect extends StatelessWidget {
  final AsyncSnapshot<ConnectivityResult> snapshot;
  final Widget widget;

  const InternetConnect(
      {super.key, required this.snapshot, required this.widget});

  @override
  Widget build(BuildContext context) {
    switch (snapshot.connectionState) {
      case ConnectionState.active:
        final state = snapshot.data!;
        switch (state) {
          case ConnectivityResult.none:
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "Asset/5865574.png",
                  height: 160.h,
                ),
                SizedBox(height: 25.h),
                Text(
                  "No Internet",
                  style: TextStyle(fontSize: 20.sp, color: Colors.white),
                )
              ],
            ));
          default:
            return widget;
        }
      default:
        return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "Asset/5865574.png",
                  height: 160.h,
                ),
                SizedBox(height: 25.h),
                Text(
                  "No Internet",
                  style: TextStyle(fontSize: 20.sp, color: Colors.white),
                )
              ],
            ));
    }
  }
}