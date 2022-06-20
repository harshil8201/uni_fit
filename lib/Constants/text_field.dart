// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:uni_fit/Constants/color.dart';

var inputDecoration = InputDecoration(
  icon: Icon(
    Icons.mail_outline_outlined,
    color: darkWhite,
  ),
  floatingLabelBehavior: FloatingLabelBehavior.never,
  enabledBorder: const UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent),
  ),
  focusedBorder: const UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent),
  ),
  hintStyle: TextStyle(color: darkWhite),
);

