import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClassDesign extends StatelessWidget {
  String title;
  Color color;
  VoidCallback onTap;
  ClassDesign({Key? key, required this.title, required this.color ,required this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          height: 120.h,
          width: 120.w,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'Asset/Bookicon.png',
                width: 90,
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                title,
                style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ],
          )),
    );
  }
}
