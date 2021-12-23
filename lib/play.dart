import 'dart:async';
import 'package:flutter/material.dart';
import 'package:uni_fit/color_class.dart';

class PlayPage extends StatefulWidget {
  const PlayPage({Key key}) : super(key: key);

  @override
  _PlayPageState createState() => _PlayPageState();
}

class _PlayPageState extends State<PlayPage> {
  static const maxSecond = 0;
  int second = maxSecond;

  int seco = 15;

  Timer timer;

  int erSecond = erMaxSecond;
  static const erMaxSecond = 20;

  int breakSecond = 20;

  void resetTime() => setState(() {
        second = maxSecond;
        stopTimer();
      });

  void startTime() {
    timer = Timer.periodic(
        const Duration(
          seconds: 1,
        ), (_) {
      if (second >= 0) {
        setState(() => second++);
      } else if (second > 101) {
        stopTimer();
      }
    });
  }

  void secondDecrease() {
    timer = Timer.periodic(
        const Duration(
          seconds: 1,
        ), (_) {
      if (erSecond > 0) {
        setState(() => erSecond--);
      } else if (erSecond == 0) {
        setState(() => erSecond = 19);
      }
    });
  }

  void breakSeason() {
    timer = Timer.periodic(
        const Duration(
          seconds: 1,
        ), (_) {
      if (breakSecond > 0) {
        setState(() => breakSecond--);
      } else if (breakSecond == 0) {
        setState(() => breakSecond = 19);
      }
    });
  }

  void stopTimer() {
    setState(() {
      timer.cancel();
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
        // decoration: const BoxDecoration(
        //     image: DecorationImage(
        //         image: AssetImage('assets/images/bg.png'), fit: BoxFit.cover)),
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
                        color: superDarkGreen,
                        size: 30,
                      ),
                    ),
                  ),
                  Text(
                    'ABS',
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
            if (1 <= second && second <= 20)...[
              breakTime()
            ] else if (21 <= second && second <= 40)...[
              jumpingJacks()
            ] else if (41 <= second && second <= 60)...[
              breakTime()
            ] else if (61 <= second && second <= 80)...[
              abdominalCrunches()
            ] else if (81 <= second && second <= 100 )...[
              breakTime()
            ]else if(second>100)...[
              endWorkout()
            ],
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

  Widget breakTime() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 100),
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
              'Break time..'.toUpperCase(),
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
                  '$breakSecond',
                  style: const TextStyle(
                    fontSize: 40,
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
            "Congratulation !!\n\nYou complete\ntoday's workout",textAlign: TextAlign.center,
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

  Widget jumpingJacks() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 100),
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
              child: const ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: FadeInImage(
                  width: 300,
                  height: 300,
                  image: NetworkImage(
                    'https://firebasestorage.googleapis.com/v0/b/uni-fit-app.appspot.com/o/Beginner%20Abs%2Fjumping%20jacks.gif?alt=media&token=9180ed98-4eb8-44da-9191-a3a90152cb55',
                  ),
                  placeholder: AssetImage(
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
              'Jumping Jacks'.toUpperCase(),
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

  Widget abdominalCrunches() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 100),
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
            const ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: FadeInImage(
                width: 300,
                height: 300,
                image: NetworkImage(
                  'https://firebasestorage.googleapis.com/v0/b/uni-fit-app.appspot.com/o/Beginner%20Abs%2Fabdominals%20crunch.gif?alt=media&token=7117622a-915c-4ead-91f8-c55abbb945a5',
                ),
                placeholder: AssetImage(
                  'assets/images/loading.gif',
                ),
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'abdominal crunches'.toUpperCase(),
              style: TextStyle(
                color: primaryBlack,
                fontSize: 25,
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
        ? Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: stopTimer,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.blue,
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
                            'PAUSE'.toUpperCase(),
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              fontFamily: 'popBold',
                              fontSize: 23,
                              letterSpacing: 2,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: resetTime,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.red,
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
                            'Cancel'.toUpperCase(),
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              fontFamily: 'popBold',
                              fontSize: 23,
                              letterSpacing: 2,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        : InkWell(
            onTap: () {
              startTime();
              secondDecrease();
              breakSeason();
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: primaryGreen,
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
                        style: const TextStyle(
                          fontFamily: 'popBold',
                          fontSize: 23,
                          letterSpacing: 2,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
