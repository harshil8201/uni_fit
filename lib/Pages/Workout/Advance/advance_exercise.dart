import 'package:flutter/material.dart';
import 'package:uni_fit/Constants/color.dart';
import 'package:uni_fit/Pages/Workout/Advance/Exercise/advance_abs.dart';
import 'package:uni_fit/Pages/Workout/Advance/Exercise/advance_arms.dart';
import 'package:uni_fit/Pages/Workout/Advance/Exercise/advance_back.dart';
import 'package:uni_fit/Pages/Workout/Advance/Exercise/advance_chest.dart';
import 'package:uni_fit/Pages/Workout/Advance/Exercise/advance_leg.dart';
import 'package:uni_fit/Pages/Workout/Advance/Exercise/advance_shoulder.dart';
import 'package:uni_fit/Pages/start_page.dart';

class AdvanceExercise extends StatefulWidget {
  const AdvanceExercise({Key key}) : super(key: key);

  @override
  _AdvanceExerciseState createState() => _AdvanceExerciseState();
}

class _AdvanceExerciseState extends State<AdvanceExercise> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const StartPage()));
                    },
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.0563,
                      width: MediaQuery.of(context).size.width * 0.125,
                      child: Icon(
                        Icons.arrow_back_rounded,
                        color: superDarkGreen,
                        size: MediaQuery.of(context).size.height * 0.0375,
                      ),
                    ),
                  ),
                  Text(
                    'ADVANCE',
                    style: TextStyle(
                      color: superDarkGreen,
                      fontSize: MediaQuery.of(context).size.height * 0.0375,
                      fontFamily: 'popBold',
                      //fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.0563,
                    width: MediaQuery.of(context).size.width * 0.125,
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 100, bottom: 90),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  '“If you change the way you look at things, the things you look at change.”',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.0188,
                    fontFamily: 'popLight',
                    color: darkGreen,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.188),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //-------abs----------
                    exerciseContainer(
                      'Abs',
                      'Never give up on a dream just because of the time it will take to accomplish it. The time will pass anyway.',
                      'assets/images/advance/absA.jpg',
                      1,
                      const AdvanceAbs(),
                    ),

                    //-------shoulder--------
                    exerciseContainer(
                      'Shoulder',
                      'I don’t count my sit-ups. I only start counting when it starts hurting because they’re the only ones that count.',
                      'assets/images/advance/shoulderA.jpg',
                      2,
                      const AdvanceShoulder(),
                    ),

                    //---------chest--------
                    exerciseContainer(
                      'Chest',
                      'If you change the way you look at things, the things you look at change.”',
                      'assets/images/advance/chestA.jpg',
                      3,
                      const AdvanceChest(),
                    ),

                    //-----------arms-------
                    exerciseContainer(
                      'Arms',
                      'Your health account, your bank account, they’re the same thing. The more you put in, the more you can take out.',
                      'assets/images/advance/armsA.jpg',
                      4,
                      const AdvanceArms(),
                    ),

                    //---------legs--------
                    exerciseContainer(
                      'Legs',
                      'There are two types of pain in this world: pain that hurts you, and pain that changes you.',
                      'assets/images/advance/legsA.jpg',
                      5,
                      const AdvanceLegs(),
                    ),

                    //-----------back-------
                    exerciseContainer(
                      'Back',
                      'To keep the body in good health is a duty… otherwise we shall not be able to keep our mind strong and clear',
                      'assets/images/advance/backA.jpg',
                      6,
                      const AdvanceBack(),
                    ),

                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.0312,
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
              transitionDuration: const Duration(milliseconds: 700),
              pageBuilder: (_, __, ___) => routeName,
            ),
          );
        },
        child: Container(
          //color: Colors.blue,
          height: MediaQuery.of(context).size.height * 0.15,
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
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width * 0.528,
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
                          fontSize: MediaQuery.of(context).size.height * 0.0375,
                          color: primaryGreen,
                          fontFamily: 'popBold',
                        ),
                      ),
                      Text(
                        erDescription,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.0125,
                          color: primaryGreen,
                          fontFamily: 'popLight',
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width * 0.333,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Hero(
                    tag: 'advance-image-$listImage',
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
