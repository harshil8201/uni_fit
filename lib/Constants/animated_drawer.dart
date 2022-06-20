import 'package:flutter/material.dart';

Widget animatedDrawer(Widget child) {
  double scaleFactor = 1;
  double xOffset = 0;
  double yOffset = 0;
  return AnimatedContainer(
    transform: Matrix4.translationValues(xOffset, yOffset, 0)
      ..scale(scaleFactor),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
    duration: const Duration(milliseconds: 250),
    child: child,
  );
}
