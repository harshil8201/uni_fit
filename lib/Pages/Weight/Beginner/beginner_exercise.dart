import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:uni_fit/Pages/Weight/Beginner/beginner_abs.dart';
import 'package:uni_fit/color_class.dart';

import 'beginner_arms.dart';
import 'beginner_back.dart';
import 'beginner_chest.dart';
import 'beginner_legs.dart';
import 'beginner_shoulder.dart';

class BeginnerExercise extends StatefulWidget {
  const BeginnerExercise({Key key}) : super(key: key);

  @override
  _BeginnerExerciseState createState() => _BeginnerExerciseState();
}

class _BeginnerExerciseState extends State<BeginnerExercise> {
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
                    child: Container(
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
                    'BEGINNER',
                    style: TextStyle(
                      color: superDarkGreen,
                      fontSize: 30,
                      fontFamily: 'popBold',
                      //fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    height: 45,
                    width: 45,
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 100, bottom: 90),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Container(
                      width: double.infinity,
                      child: Text(
                        '" Your Bod can stand almost anything\n its your mind that you have to convince. "',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'popLight',
                          color: darkGreen,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 150),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //-------abs----------
                    exerciseContainer(
                      'Abs',
                      'keep in mind that abdominal exercises alone are unlikely to decrease belly fat',
                      'assets/images/beginner/absB.jpg',
                      1,
                      BeginnerAbs(),
                    ),

                    //-------shoulder--------
                    exerciseContainer(
                      'Shoulder',
                      'Shoulder strength training can reduce your risk of injury by strengthening your core muscles',
                      'assets/images/beginner/shoulderB.jpg',
                      2,
                      BeginnerShoulder(),
                    ),

                    //---------chest--------
                    exerciseContainer(
                      'Chest',
                      'Working out the chest means working out the pectoral muscles, better known as the “pecs.”',
                      'assets/images/beginner/chestB.jpg',
                      3,
                      BeginnerChest(),
                    ),

                    //-----------arms-------
                    exerciseContainer(
                      'Arms',
                      'Strong biceps play an important role in an overall strong and functional upper body',
                      'assets/images/beginner/armsB.jpg',
                      4,
                      BeginnerArms(),
                    ),

                    //---------legs--------
                    exerciseContainer(
                      'Legs',
                      'legs is one of our biggest muscles, regularly training legs helps us reduce the risk of injury.',
                      'assets/images/beginner/legsB.jpg',
                      5,
                      BeginnerLegs(),
                    ),

                    //-----------back-------
                    exerciseContainer(
                      'Back',
                      'strengthening your back muscles, you are building up the main support structure for your entire body.',
                      'assets/images/beginner/backB.jpg',
                      6,
                      BeginnerBack(),
                    ),

                    SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget exerciseContainer(
    String erName,
    String erDescription,
    String erImage,
    int listImage,
    dynamic routeName,
  ) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 15),
      child: InkWell(
        onTap: () {
          // want to add navigation here-----------------
          Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 700),
              pageBuilder: (_, __, ___) => routeName,
            ),
          );
        },
        child: Container(
          //color: Colors.blue,
          height: 120,
          width: double.infinity,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: shadowBlack,
                offset: const Offset(0, 0),
                blurRadius: 20.0,
              ), //BoxShadow
            ],
            color: primaryWhite,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 120,
                width: 190,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        erName,
                        style: TextStyle(
                          fontSize: 30,
                          color: primaryGreen,
                          fontFamily: 'popBold',
                        ),
                      ),
                      Text(
                        erDescription,
                        style: TextStyle(
                          fontSize: 10,
                          color: primaryGreen,
                          fontFamily: 'popLight',
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: 120,
                width: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Hero(
                    tag: 'beginner-image-$listImage',
                    child: Image(
                      fit: BoxFit.cover,
                      image: AssetImage(erImage),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
