import 'package:flutter_screenutil/flutter_screenutil.dart';
import "package:flutter/material.dart";
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Center(
      child: Container(
          height: 150.h,
          width: 150.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              image: DecorationImage(
                  image: AssetImage('assets/cat.jpg',),
                  fit: BoxFit.cover
              )
          )
      ),
    ),
    );
  }
}