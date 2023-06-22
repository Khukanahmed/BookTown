import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ebook/Classes/Eight/ClassEight.dart';
import 'package:ebook/Classes/Five/ClassFive.dart';
import 'package:ebook/Classes/Four/ClassFour.dart';
import 'package:ebook/Classes/Nine/ClassNineTen.dart';
import 'package:ebook/Classes/Seven/ClassSeven.dart';
import 'package:ebook/Classes/Six/ClassSix.dart';
import 'package:ebook/Classes/Three/ClassThree.dart';
import 'package:ebook/Classes/Two/ClassTwo.dart';
import 'package:ebook/Design/classdesign.dart';
import 'package:ebook/Design/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Classes/One/Class One.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Connectivity connectivity = Connectivity();
    return Scaffold(
        appBar: AppBar(
          title: Text('All Class'),
          centerTitle: true,
        ),
        body: StreamBuilder<ConnectivityResult>(
            stream: connectivity.onConnectivityChanged,
            builder: (_, snapshot) {
              return InternetConnect(
                snapshot: snapshot,
                widget: SingleChildScrollView(
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ClassDesign(
                                    title: 'Class One',
                                    color: Color(0xff3AEE41),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ClassOne()));
                                    },
                                  ),
                                  ClassDesign(
                                    title: 'Class Two',
                                    color: Color(0xff4BC6CE),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ClassTwo()));
                                    },
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ClassDesign(
                                    title: 'Class Three',
                                    color: Color(0xff4BC6CE),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ClassThree()));
                                    },
                                  ),
                                  ClassDesign(
                                    title: 'Class Four',
                                    color: Color(0xff3AEE41),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ClassFour()));
                                    },
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ClassDesign(
                                    title: 'Class Five',
                                    color: Color(0xff3AEE41),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ClassFive()));
                                    },
                                  ),
                                  ClassDesign(
                                    title: 'Class Six',
                                    color: Color(0xff4BC6CE),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Class6()));
                                    },
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ClassDesign(
                                    title: 'Class Seven',
                                    color: Color(0xff4BC6CE),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Class7()));
                                    },
                                  ),
                                  ClassDesign(
                                    title: 'Class Eight',
                                    color: Color(0xff3AEE41),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Class8()));
                                    },
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Class910()));
                                    },
                                    child: Container(
                                        height: 100.h,
                                        width: 180.w,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'Asset/Bookicon.png',
                                              width: 80,
                                            ),
                                            SizedBox(height: 10.h),
                                            Text('Class Nine - Ten',
                                                style: TextStyle(
                                                    fontSize: 15.sp,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white))
                                          ],
                                        ),
                                        decoration: BoxDecoration(
                                          color: GreenColor,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        )),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
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
