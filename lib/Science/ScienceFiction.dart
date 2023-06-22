import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ebook/Design/Bookdesign.dart';
import 'package:ebook/Design/color.dart';
import 'package:ebook/Science/Bookview/Boroview.dart';
import 'package:ebook/Science/Bookview/Dagonview.dart';
import 'package:ebook/Science/Bookview/Kohokview.dart';
import 'package:ebook/Science/Bookview/KolpoView.dart';
import 'package:ebook/Science/Bookview/Powerview.dart';
import 'package:ebook/Science/Bookview/Roadviwe.dart';
import 'package:ebook/Science/Bookview/SciView.dart';
import 'package:ebook/Science/Bookview/TheMaskView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScienceFcition extends StatefulWidget {
  const ScienceFcition({Key? key}) : super(key: key);

  @override
  State<ScienceFcition> createState() => _ScienceFcitionState();
}

class _ScienceFcitionState extends State<ScienceFcition> {
  final Stream<QuerySnapshot> _Science =
      FirebaseFirestore.instance.collection('ScienceFcition').snapshots();
  @override
  Widget build(BuildContext context) {
    Connectivity connectivity = Connectivity();
    return Scaffold(
        appBar: AppBar(
          title: Text('Science Fiction Book'),
          centerTitle: true,
        ),
        body: StreamBuilder<ConnectivityResult>(
            stream: connectivity.onConnectivityChanged,
            builder: (_, snapshot) {
              return InternetConnect(
                snapshot: snapshot,
                widget: StreamBuilder(
                    stream: _Science,
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
                              padding: EdgeInsets.only(bottom: 10),
                              child: Column(
                                children: [
                                  Padding(padding: EdgeInsets.only(top: 50)),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Bookdesign(
                                          text: indexData['RoadN'],
                                          color: GreenColor,
                                          images: indexData['RoadP'],
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Road_to_view()));
                                          }),
                                      Bookdesign(
                                          text: indexData['DagonN'],
                                          color: BlueColor,
                                          images: indexData['DagonP'],
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Dagon_view()));
                                          }),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 50,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Bookdesign(
                                          text: indexData['BoroN'],
                                          color: BlueColor,
                                          images: indexData['BoroP'],
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Boro_view()));
                                          }),
                                      Bookdesign(
                                          text: indexData['KohokN'],
                                          color: GreenColor,
                                          images: indexData['KohokP'],
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Kohok_view()));
                                          }),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 50,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Bookdesign(
                                          text: indexData['KolpoN'],
                                          color: GreenColor,
                                          images: indexData['KolpoP'],
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Kolpo_view()));
                                          }),
                                      Bookdesign(
                                          text: indexData['PowerN'],
                                          color: BlueColor,
                                          images: indexData['PowerP'],
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Power_view()));
                                          }),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 50,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Bookdesign(
                                          text: indexData['SciN'],
                                          color: GreenColor,
                                          images: indexData['SciP'],
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Scih_view()));
                                          }),
                                      Bookdesign(
                                          text: indexData['TheMasksN'],
                                          color: BlueColor,
                                          images: indexData['TheMasksP'],
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Mask_view()));
                                          }),
                                    ],
                                  ),
                                ],
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
