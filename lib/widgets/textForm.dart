import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget textFormField({String label,TextInputType keyboard,bool secure,TextEditingController controller,
  Function validate,String val}){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SizedBox(
      width: ScreenUtil().setWidth(300),
      child: TextFormField(
          controller: controller,
          keyboardType: keyboard,
          obscureText: secure,
          decoration: InputDecoration(
              labelText: label,
              labelStyle: TextStyle(
                  fontSize: 15
              )
          ),
          validator:validate
      ),
    ),
  );
}