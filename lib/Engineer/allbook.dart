import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ebook/Design/Bookdesign.dart';
import 'package:ebook/Design/color.dart';
import 'package:ebook/Engineer/DataBase/Data_Struct_view.dart';
import 'package:ebook/Engineer/DataBase/Datadetais.dart';
import 'package:ebook/Engineer/DataBase/Digital_view.dart';
import 'package:ebook/Engineer/DataBase/Electron_view.dart';
import 'package:ebook/Engineer/DataBase/Intro_com_view.dart';
import 'package:ebook/Engineer/DataBase/Intro_view.dart';
import 'package:ebook/Engineer/DataBase/Let_view.dart';
import 'package:ebook/Engineer/DataBase/Numeric_View.dart';
import 'package:ebook/Engineer/DataBase/Oop_view.dart';
import 'package:ebook/Engineer/DataBase/Toc_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Engineering extends StatefulWidget {
  const Engineering({Key? key}) : super(key: key);

  @override
  State<Engineering> createState() => _EngineeringState();
}

class _EngineeringState extends State<Engineering> {
  final Stream<QuerySnapshot> _engineering =
      FirebaseFirestore.instance.collection('Engineering').snapshots();
  @override
  Widget build(BuildContext context) {
    Connectivity connectivity = Connectivity();
    return Scaffold(
        appBar: AppBar(
          title: Text('Engineering Book'),
          centerTitle: true,
        ),
        body: StreamBuilder<ConnectivityResult>(
            stream: connectivity.onConnectivityChanged,
            builder: (_, snapshot) {
              return InternetConnect(
                snapshot: snapshot,
                widget: StreamBuilder(
                    stream: _engineering,
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
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Column(
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(
                                      top: 50,
                                    )),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Bookdesign(
                                            text: indexData['NumericalN'],
                                            color: GreenColor,
                                            images: indexData['NumericalP'],
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Numeric_View()));
                                            }),
                                        Bookdesign(
                                            text: indexData['Data_StructN'],
                                            color: PinkColor,
                                            images: indexData['Data_StructP'],
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Data_Struct_View()));
                                            }),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 50,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Bookdesign(
                                            text: indexData['LetN'],
                                            color: LightBColor,
                                            images: indexData['LetP'],
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Let_View()));
                                            }),
                                        Bookdesign(
                                            text: indexData['IntroN'],
                                            color: BlueColor,
                                            images: indexData['IntroP'],
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Intro_View()));
                                            }),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 50,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Bookdesign(
                                            text: indexData['ElecltorN'],
                                            color: GreenColor,
                                            images: indexData['ElecltorP'],
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Electron_View()));
                                            }),
                                        Bookdesign(
                                            text: indexData['Intro_comN'],
                                            color: PinkColor,
                                            images: indexData['Intro_comP'],
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Intro_com_View()));
                                            }),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 50,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Bookdesign(
                                            text: indexData['OopN'],
                                            color: LightBColor,
                                            images: indexData['OopP'],
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Oop_View()));
                                            }),
                                        Bookdesign(
                                            text: indexData['TocN'],
                                            color: BlueColor,
                                            images: indexData['TocP'],
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Toc_View()));
                                            }),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 50,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Bookdesign(
                                            text: indexData['SoftwareName'],
                                            color: GreenColor,
                                            images:
                                                indexData['SoftwareEngineer'],
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Database()));
                                            }),
                                        Bookdesign(
                                            text: indexData['DigitalN'],
                                            color: PinkColor,
                                            images: indexData['DigitalP'],
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Digital_View()));
                                            }),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    }),
              );
            }));
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
