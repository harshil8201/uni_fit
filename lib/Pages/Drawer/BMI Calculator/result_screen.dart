import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uni_fit/color_class.dart';

class ResultScreen extends StatefulWidget {
  final bmiModel;

  ResultScreen({this.bmiModel});

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bg.png'),
                fit: BoxFit.cover
            )
        ),
        child: Stack(
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
                      height: 45,
                      width: 45,
                      child: Icon(
                        Icons.arrow_back_rounded,
                        color: superDarkGreen,
                        size: 30,
                      ),
                    ),
                  ),
                  Text(
                    'BMI Result',
                    style: TextStyle(
                      color: superDarkGreen,
                      fontSize: 30,
                      fontFamily: 'popBold',
                      //fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 45,
                    width: 45,
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
                      ? const Text(
                          "You Entered Nothing.",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,

                            fontWeight: FontWeight.w700,
                          ),
                        )
                      : Text(
                          "YOUR BMI IS ${widget.bmiModel.bmi.round()}.",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 34,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "${widget.bmiModel.comments}.",
                    style: TextStyle(
                      color: Colors.greenAccent[700],
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  widget.bmiModel.isNormal
                      ? const Text(
                          "YOUR BMI IS NORMAL.",
                          style: TextStyle(
                            color: Colors.amberAccent,
                            fontSize: 20,
                            wordSpacing: 3,
                            letterSpacing: 2,
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      : const Text(
                          "YOUR BMI IS NOT NORMAL.",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                            wordSpacing: 4,
                            letterSpacing: 2,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
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
                    child: FlatButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          Container(
                            child: const Text(
                              "LET CALCULATE AGAIN",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 2,
                              ),
                            ),
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => SelectorPage()));
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
