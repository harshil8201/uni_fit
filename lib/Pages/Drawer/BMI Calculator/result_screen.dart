// ignore_for_file: prefer_typing_uninitialized_variables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:uni_fit/Constants/img_design.dart';
import 'package:uni_fit/Constants/color.dart';

class ResultScreen extends StatefulWidget {
  final bmiModel;

  const ResultScreen({this.bmiModel});

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: bgContainer(
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50, right: 10, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SizedBox(
                      height: height * 0.056,
                      width: width * 0.125,
                      child: Icon(
                        Icons.arrow_back_rounded,
                        color: superDarkGreen,
                        size: height * 0.0375,
                      ),
                    ),
                  ),
                  Text(
                    'BMI Result',
                    style: TextStyle(
                      color: superDarkGreen,
                      fontSize: height * 0.0375,
                      fontFamily: 'popBold',
                      //fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.0563,
                    width: height * 0.125,
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  widget.bmiModel.bmi == null || widget.bmiModel.bmi == 0
                      ? Text(
                          "You Entered Nothing.",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: height * 0.0375,
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      : Text(
                          "YOUR BMI IS ${widget.bmiModel.bmi.round()}.",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: height * 0.0425,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                  SizedBox(
                    height: height * 0.025,
                  ),
                  Text(
                    "${widget.bmiModel.comments}.",
                    style: TextStyle(
                      color: Colors.greenAccent[700],
                      fontSize: height * 0.0312,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.0375,
                  ),
                  widget.bmiModel.isNormal
                      ? Text(
                          "YOUR BMI IS NORMAL.",
                          style: TextStyle(
                            color: Colors.amberAccent,
                            fontSize: height * 0.025,
                            wordSpacing: 3,
                            letterSpacing: 2,
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      : Text(
                          "YOUR BMI IS NOT NORMAL.",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: height * 0.025,
                            wordSpacing: 4,
                            letterSpacing: 2,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  Container(
                    width: double.infinity,
                    height: height * 0.0625,
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Color(0xffff6f00),
                          Color(0xffffd54f),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    // ignore: deprecated_member_use
                    child: ElevatedButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: height * 0.005,
                          ),
                          Text(
                            "LET CALCULATE AGAIN",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: height * 0.02,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 2,
                            ),
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
