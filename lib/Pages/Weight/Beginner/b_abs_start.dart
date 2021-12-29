import 'dart:async';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uni_fit/Pages/Weight/Beginner/beginner_abs.dart';
import 'package:uni_fit/color_class.dart';
import 'dart:math' as math;

class BeginnerAbsStart extends StatefulWidget {
  const BeginnerAbsStart({Key key}) : super(key: key);

  @override
  _BeginnerAbsStartState createState() => _BeginnerAbsStartState();
}

class _BeginnerAbsStartState extends State<BeginnerAbsStart> {
  static const maxSecond = 0;
  int second = maxSecond;
  Timer timer;
  int erSecond = erMaxSecond;
  static const erMaxSecond = 20;
  int brSecond = 20;

  void resetTimer() => setState(() {
        second = maxSecond;
        // stopTimer();
      });

  void startTime({bool reset = true}) {
    if (reset) {
      resetTimer();
    }
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (second >= 0) {
        setState(() => second++);
      } else if (second > 441) {
        stopTimer(reset: false);
      }
    });
  }

  void exerciseSecond() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (erSecond > 0) {
        setState(() => erSecond--);
      } else if (erSecond == 0) {
        setState(() => erSecond = 19);
      }
    });
  }

  void breakSecond() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (brSecond > 0) {
        setState(() => brSecond--);
      } else if (brSecond == 0) {
        setState(() => brSecond = 19);
      }
    });
  }

  void stopTimer({bool reset = true}) {
    if (reset) {
      resetTimer();
    }
    setState(() {
      timer?.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: backgroundColor,
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
                      height: 45,
                      width: 45,
                      child: Icon(
                        Icons.arrow_back_rounded,
                        color: primaryGreen,
                        size: 30,
                      ),
                    ),
                  ),
                  Text(
                    'ABS',
                    style: TextStyle(
                      color: primaryGreen,
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
            if (second < 1) ...[
              readyContainer()
            ] else if (1 <= second && second <= 20) ...[
              breakTime('jumping jacks')
            ] else if (21 <= second && second <= 40) ...[
              erContainer('jumping jacks')
            ] else if (41 <= second && second <= 60) ...[
              breakTime('abdominals crunch')
            ] else if (61 <= second && second <= 80) ...[
              erContainer('abdominals crunch')
            ] else if (81 <= second && second <= 100) ...[
              breakTime('russin twist')
            ] else if (101 <= second && second <= 120) ...[
              erContainer('russin twist')
            ] else if (121 <= second && second <= 140) ...[
              breakTime('mountain climber')
            ] else if (141 <= second && second <= 160) ...[
              erContainer('mountain climber')
            ] else if (161 <= second && second <= 180) ...[
              breakTime('leg raises')
            ] else if (181 <= second && second <= 200) ...[
              erContainer('leg raises')
            ] else if (201 <= second && second <= 220) ...[
              breakTime('plank')
            ] else if (212 <= second && second <= 240) ...[
              erContainer('plank')
            ] else if (241 <= second && second <= 260) ...[
              breakTime('heel touch')
            ] else if (261 <= second && second <= 280) ...[
              erContainer('heel touch')
            ] else if (281 <= second && second <= 300) ...[
              breakTime('cobra stretch')
            ] else if (301 <= second && second <= 320) ...[
              erContainer('cobra stretch')
            ] else if (321 <= second && second <= 340) ...[
              breakTime('side lying floor stretch left')
            ] else if (341 <= second && second <= 360) ...[
              erContainer('side lying floor stretch left')
            ] else if (361 <= second && second <= 380) ...[
              breakTime('side lying floor stretch right')
            ] else if (381 <= second && second <= 400) ...[
              erContainer('side lying floor stretch right')
            ] else endWorkout(),
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: realButton(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget readyContainer() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 130),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Text(
              "Are you ready for today's workout??",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: superDarkGreen,
                fontSize: 32,
                fontFamily: 'popMedium',
                fontWeight: FontWeight.bold,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'press "start" for exercise',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: primaryGreen,
                  fontSize: 15,
                  fontFamily: 'popMedium',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget breakTime(String erName) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 130),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Break time !!'.toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: superDarkGreen,
                fontSize: 30,
                fontFamily: 'popMedium',
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: shadowBlack,
                        offset: const Offset(0, 0),
                        blurRadius: 20.0,
                      ), //BoxShadow
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    child: FadeInImage(
                      width: 300,
                      height: 300,
                      image: AssetImage(
                        'assets/images/gif/$erName.gif',
                      ),
                      placeholder: const AssetImage(
                        'assets/images/loading.gif',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  erName.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'popBold'),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Start in : $brSecond sec',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 22,
                    color: Colors.teal,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget endWorkout() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 100),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            "Congratulation !!\n\nYou completed\ntoday's workout",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: superDarkGreen,
              fontSize: 27,
              fontFamily: 'popBold',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget erContainer(String erName) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 120),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: shadowBlack,
                    offset: const Offset(0, 0),
                    blurRadius: 20.0,
                  ), //BoxShadow
                ],
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: FadeInImage(
                  width: 300,
                  height: 300,
                  image: AssetImage(
                    'assets/images/gif/$erName.gif',
                  ),
                  placeholder: const AssetImage(
                    'assets/images/loading.gif',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              erName.toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: superDarkGreen,
                fontSize: 27,
                fontFamily: 'popBold',
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Text(
                  '$erSecond',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    height: 130,
                    width: 130,
                    child: CircularProgressIndicator(
                      value: 1 - erSecond / erMaxSecond,
                      valueColor: const AlwaysStoppedAnimation(Colors.white),
                      backgroundColor: Colors.green,
                      strokeWidth: 12,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget realButton() {
    final isRunning = timer == null ? false : timer.isActive;

    return isRunning
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //---------Pause----------
              // InkWell(
              //   onTap: () {
              //     setState(() {
              //       stopTimer(reset: false);
              //     });
              //   },
              //   child: Container(
              //     decoration: BoxDecoration(
              //       boxShadow: [
              //         BoxShadow(
              //           color: shadowBlack,
              //           offset: const Offset(0.5, 0.10),
              //           blurRadius: 20.0,
              //         ), //BoxShadow
              //       ],
              //       shape: BoxShape.circle,
              //       color: Colors.white,
              //     ),
              //     height: 50,
              //     width: 50,
              //     child: const Center(
              //       child: Padding(
              //         padding: EdgeInsets.only(left: 5),
              //         child: FaIcon(
              //           FontAwesomeIcons.play,
              //           color: Colors.blue,
              //           size: 25,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              // const SizedBox(
              //   width: 50,
              // ),

              //----------cancel-------
              InkWell(
                onTap: () {
                  showAlertDialog(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: shadowBlack,
                        offset: const Offset(0.5, 0.10),
                        blurRadius: 20.0,
                      ), //BoxShadow
                    ],
                    shape: BoxShape.circle,
                    color: Colors.redAccent,
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Transform.rotate(
                      angle: -math.pi / 4,
                      child: const FaIcon(
                        FontAwesomeIcons.plus,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )

        //----------- start -------------
        : InkWell(
            onTap: () {
              startTime();
              exerciseSecond();
              breakSecond();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: shadowBlack,
                      offset: const Offset(0, 0),
                      blurRadius: 20.0,
                    ), //BoxShadow
                  ],
                ),
                child: Center(
                  child: Text(
                    'Start'.toUpperCase(),
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: 'popBold',
                      fontSize: 23,
                      letterSpacing: 2,
                      color: primaryGreen,
                    ),
                  ),
                ),
              ),
            ),
          );
  }

  showAlertDialog(BuildContext context) {
    Widget cancelButton = TextButton(
      child: const Text(
        "No",
        style: TextStyle(
          color: Colors.blue,
          fontFamily: 'popBold',
        ),
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: const Text(
        "Yes",
        style: TextStyle(
          color: Colors.red,
          fontFamily: 'popBold',
        ),
      ),
      onPressed: () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const BeginnerAbs()));
        stopTimer();
      },
    );

    AlertDialog alert = AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      title: const Text(
        "Want to cancel?",
        style: TextStyle(
          color: Colors.red,
          fontFamily: 'popBold',
        ),
      ),
      content: const Text(
        "Are you sure ?\nit effect to your progress.",
        style: TextStyle(
          color: Colors.black,
          fontFamily: 'popMedium',
        ),
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
