// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:uni_fit/Constants/color.dart';

Widget userData(BuildContext context, String userData) {
  
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;
  var text = MediaQuery.of(context).size.height;
  
  return Text(
    userData,
    style: TextStyle(
      color: superDarkGreen,
      fontSize: height * 0.0187,
      fontFamily: 'popBold',
    ),
  );
}
