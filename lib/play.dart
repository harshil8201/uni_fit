import 'dart:async';
import 'package:flutter/material.dart';
import 'package:uni_fit/color_class.dart';

class PlayPage extends StatefulWidget {
  const PlayPage({Key key}) : super(key: key);

  @override
  _PlayPageState createState() => _PlayPageState();
}

class _PlayPageState extends State<PlayPage> {
  static const maxSecound = 40;
  int sec = maxSecound;
  Timer timer;
  int erSecond = 21;
  static const erMaxSecond = 19;

  void resetTime() => setState(() {
        erSecond = erMaxSecond;
        stopTimer();
      });

  void startTime() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (sec > 0) {
        setState(() => sec--);
      } else if (sec < 0) {
        stopTimer();
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
            // Text(
            //   '$sec',
            //   style: const TextStyle(fontSize: 30),
            // ),
            //
            // Padding(
            //   padding: const EdgeInsets.all(10),
            //   child: SizedBox(
            //     height: 100,
            //     width: 100,
            //     child: CircularProgressIndicator(
            //       value: 1 - sec / maxSecound,
            //       valueColor: const AlwaysStoppedAnimation(Colors.white),
            //       backgroundColor: Colors.green,
            //       strokeWidth: 12,
            //     ),
            //   ),
            // ),
            if (22 <= sec && sec <= 40) ...[
              jumpingJacks()
            ] else if (0 <= sec && sec <= 21) ...[
              abdominalCrunches()
            ],
            //
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
                  'https://firebasestorage.googleapis.com/v0/b/uni-fit-app.appspot.com/o/Beginner%20Abs%2Fjumping%20jacks.gif?alt=media&token=9180ed98-4eb8-44da-9191-a3a90152cb55',
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
              'Jumping Jacks'.toUpperCase(),
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
                  '${erSecond--}',
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
                  '${erSecond--}',
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
            onTap: startTime,
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
