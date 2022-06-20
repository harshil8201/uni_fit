// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:uni_fit/Constants/color.dart';

Widget authButton(BuildContext context,String text) {

  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;
  return Container(
    width: double.infinity,
    height: height * 0.057,
    decoration: BoxDecoration(
      color: primaryWhite,
      borderRadius: BorderRadius.circular(25),
      boxShadow: [
        BoxShadow(
          color: shadowBlack,
          offset: const Offset(0, 0),
          blurRadius: 10.0,
        ),
      ],
    ),
    child: SizedBox(
      width: double.infinity,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: primaryBlack,
            fontSize: height * 0.0187,
            fontFamily: 'popMedium',
            letterSpacing: 2,
          ),
        ),
      ),
    ),
  );
}
