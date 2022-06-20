import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget bgContainer(Widget child) {
  return Container(
    height: double.infinity,
    width: double.infinity,
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/images/bg.png'),
        fit: BoxFit.cover,
      ),
    ),
    child: child,
  );
}

var uniFitImage = ClipOval(
  child: SvgPicture.asset(
    'assets/svg/uni_logo.svg',
    fit: BoxFit.fitHeight,
  ),
);
