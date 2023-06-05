// ignore_for_file: prefer_const_constructors

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fzregex/utils/fzregex.dart';
import 'package:fzregex/utils/pattern.dart';
import 'package:instagram/shared/Colors.dart';

class SharedTextFormFeild extends StatelessWidget {
  late bool isObscure;
  late String lableName;
  late double badding;
  late TextInputType inputdata;
  late double fontTextsize;
  Function(String)?  Onchange;
  SharedTextFormFeild(
      {super.key,
      required this.Onchange,
      required this.isObscure,
      required this.inputdata,
      required this.lableName,
      required this.badding,
      this.fontTextsize = 16});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      height: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border:
              Border.all(color: Color.fromARGB(83, 70, 70, 70), width: 0.5)),
      child: TextFormField(
          validator:
              (value) => Fzregex.hasMatch('krishna@gmail.com', FzPattern.email) ? null : "Please enter a valid email",
          //     (value) {
          //   if (value == null ||
          //       value.isEmpty ||
          //       !value.contains('@') ||
          //       !value.contains('.')) {
          //     return 'Invalid Email';
          //   }
          //   return null;
          // }
          onChanged: Onchange,
          autocorrect: true,
          obscureText: isObscure,
          keyboardType: inputdata,
          textInputAction: TextInputAction.done,
          style: TextStyle(color: textColor),
          decoration: InputDecoration(
            isDense: true,
            labelText: lableName,
            labelStyle: TextStyle(color: textColor, fontSize: fontTextsize),
            contentPadding: EdgeInsets.all(badding),
            filled: true,
            fillColor: Color.fromARGB(123, 240, 239, 239),
            border: InputBorder.none,
          )),
    );
  }
}
