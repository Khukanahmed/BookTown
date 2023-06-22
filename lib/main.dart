import 'package:ebook/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _future = Firebase.initializeApp(
      name: 'com.book.town',
      options: FirebaseOptions(
          apiKey: "AIzaSyAkElMPjp22LFjhbRs2MP_XfbA06KkTYio",
          appId: "1:1033203448021:android:24e601147f62c3e0120a5c",
          messagingSenderId: "1033203448021",
          projectId: "bangla-ebook-7f388"));

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: _future,
      builder:(context, snapshot) {
        if (snapshot.hasError){

          return Center(
            child:CircularProgressIndicator(),
          );
        }
        if (snapshot.connectionState == ConnectionState.done){
         //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(
      //designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'First Method',
          // You can use the library anywhere in the app even in theme
          theme: ThemeData(
            appBarTheme: const AppBarTheme(color: Color(0xff4BC6CE)),
            scaffoldBackgroundColor: const Color(0xff63839c),
            primarySwatch: Colors.green,
            // textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          home: HomePage(),
        );
      },
    );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      });
    
  }
}