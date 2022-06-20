import 'package:flutter/material.dart';
import 'package:uni_fit/Constants/color.dart';

var uniFitImgShadow = BoxDecoration(
  shape: BoxShape.circle,
  boxShadow: [
    BoxShadow(
      color: shadowBlack,
      offset: const Offset(0.0, 0.10),
      blurRadius: 20.0,
    ), //BoxShadow
  ],
);

var containerOpacity = BoxDecoration(
  color: shadeWhite.withOpacity(0.60),
  borderRadius: BorderRadius.circular(30),
);
