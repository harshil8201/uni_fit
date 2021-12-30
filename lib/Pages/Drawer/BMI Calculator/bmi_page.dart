import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:uni_fit/Pages/Drawer/BMI%20Calculator/result_screen.dart';
import 'package:uni_fit/color_class.dart';
import 'bmi_model.dart';

class BMIPage extends StatefulWidget {
  const BMIPage({Key key}) : super(key: key);

  @override
  _BMIPageState createState() => _BMIPageState();
}

class _BMIPageState extends State<BMIPage> {
  double _heightOfUser = 0;
  double _weightOfUser = 0;
  double _bmi;
  BMIModel _bmiModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bg.png'), fit: BoxFit.cover)),
        child: Stack(
          children: [
            //-------appbar--------
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
                      height: MediaQuery.of(context).size.height * 0.056,
                      width: MediaQuery.of(context).size.width * 0.125,
                      child: Icon(
                        Icons.arrow_back_rounded,
                        color: superDarkGreen,
                        size: MediaQuery.of(context).size.height * 0.0375,
                      ),
                    ),
                  ),
                  Text(
                    'BMI Calculator',
                    style: TextStyle(
                      color: superDarkGreen,
                      fontSize: MediaQuery.of(context).size.height * 0.0375,
                      fontFamily: 'popBold',
                      //fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.0562,
                    width: MediaQuery.of(context).size.width * 0.125,
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  // height: double.infinity,
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 120, left: 20, right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xff2196f3),
                              Color(0xff4fc3f7),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "HEIGHT (Cm):",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: MediaQuery.of(context).size.height * 0.0375,
                                  fontWeight: FontWeight.w900),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.0187,
                            ),
                            TextFormField(
                              onChanged: (value) {
                                _heightOfUser = double.parse(value);
                              },
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey[200],
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                hintText: "Enter Your Height in cm.",
                                icon: const Icon(
                                  Icons.accessibility_outlined,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.0125,
                            ),
                            const Divider(
                              color: Colors.black,
                              thickness: 2,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.0125,
                            ),
                            Text(
                              "WEIGHT (Kg):",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: MediaQuery.of(context).size.height * 0.0375,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.0187,
                            ),
                            TextFormField(
                              onChanged: (value) {
                                setState(() {
                                  _weightOfUser = double.parse(value);
                                });
                              },
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey[200],
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                hintText: "Enter Your Weight in Kg.",
                                icon: const Icon(
                                  Icons.favorite,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025,
                      ),
                      Container(
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
                        width: MediaQuery.of(context).size.width * 0.555,
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        // ignore: deprecated_member_use
                        child: FlatButton.icon(
                          onPressed: () {
                            setState(() {
                              if ((_heightOfUser == 0 && _weightOfUser == 0) ||
                                  (_heightOfUser == null &&
                                      _weightOfUser == 0) ||
                                  (_heightOfUser == 0 &&
                                      _weightOfUser == null)) {
                                _bmiModel = BMIModel(
                                    bmi: _bmi,
                                    isNormal: false,
                                    comments: "Please Enter & Come Back");
                                print("Entered Nothing : 0");
                              } else {
                                _bmi = (_weightOfUser) /
                                    (_heightOfUser * _heightOfUser / (10000));

                                if (_bmi >= 18.5 && _bmi <= 25) {
                                  _bmiModel = BMIModel(
                                      bmi: _bmi,
                                      isNormal: true,
                                      comments: "You are Totally Fit");
                                } else if (_bmi < 18.5) {
                                  _bmiModel = BMIModel(
                                      bmi: _bmi,
                                      isNormal: false,
                                      comments: "You are Underweight");
                                } else if (_bmi > 25 && _bmi <= 30) {
                                  _bmiModel = BMIModel(
                                      bmi: _bmi,
                                      isNormal: false,
                                      comments: "You are Overweight");
                                } else {
                                  _bmiModel = BMIModel(
                                      bmi: _bmi,
                                      isNormal: false,
                                      comments: "You are Obese");
                                }
                                print("Height = ${_heightOfUser}");
                                print("Weight = ${_weightOfUser}");
                                print("BMI = ${_bmi}");
                              }
                            });

                            Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.rightToLeftWithFade,
                                child: ResultScreen(
                                  bmiModel: _bmiModel,
                                ),
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.whatshot,
                            color: Colors.white,
                          ),
                          label: Text(
                            "CALCULATE",
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.height * 0.02,
                              letterSpacing: 2,
                            ),
                          ),
                          textColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RadiantGradientMask extends StatelessWidget {
  const RadiantGradientMask({this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => RadialGradient(
        center: Alignment.topLeft,
        radius: 0.5,
        colors: [Colors.amber[900], Colors.amber[300]],
        tileMode: TileMode.mirror,
      ).createShader(bounds),
      child: child,
    );
  }
}
