import 'package:flutter/material.dart';
import 'package:uni_fit/Constants/img_design.dart';
import 'package:uni_fit/Pages/workout/Beginner/Exercise/beginner_abs.dart';
import 'package:uni_fit/Constants/color.dart';
import 'package:uni_fit/Pages/start_page.dart';
import 'Exercise/beginner_arms.dart';
import 'Exercise/beginner_back.dart';
import 'Exercise/beginner_chest.dart';
import 'Exercise/beginner_legs.dart';
import 'Exercise/beginner_shoulder.dart';

class BeginnerExercise extends StatefulWidget {
  const BeginnerExercise({Key key}) : super(key: key);

  @override
  _BeginnerExerciseState createState() => _BeginnerExerciseState();
}

class _BeginnerExerciseState extends State<BeginnerExercise> {
  @override
  Widget build(BuildContext context) {
     var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: bgContainer(
        Stack(
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
                      height: height * 0.0563,
                      width: width * 0.125,
                      child: Icon(
                        Icons.arrow_back_rounded,
                        color: superDarkGreen,
                        size: height * 0.0375,
                      ),
                    ),
                  ),
                  Text(
                    'BEGINNER',
                    style: TextStyle(
                      color: superDarkGreen,
                      fontSize: height * 0.0375,
                      fontFamily: 'popBold',
                      //fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.0563,
                    width: width * 0.125,
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
                  '"Your Body can stand almost anything, its your mind that you have to convince."',
                  style: TextStyle(
                    fontSize: height * 0.0188,
                    fontFamily: 'popLight',
                    color: darkGreen,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: height * 0.188),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //-------abs----------
                    exerciseContainer(
                      'Abs',
                      'keep in mind that abdominal exercises alone are unlikely to decrease belly fat.',
                      'assets/images/beginner/absB.jpg',
                      1,
                      const BeginnerAbs(),
                    ),

                    //-------shoulder--------
                    exerciseContainer(
                      'Shoulder',
                      'Shoulder strength training can reduce your risk of injury by strengthening your core muscles.',
                      'assets/images/beginner/shoulderB.jpg',
                      2,
                      const BeginnerShoulder(),
                    ),

                    //---------chest--------
                    exerciseContainer(
                      'Chest',
                      'Working out the chest means working out the pectoral muscles, better known as the “pecs.”',
                      'assets/images/beginner/chestB.jpg',
                      3,
                      const BeginnerChest(),
                    ),

                    //-----------arms-------
                    exerciseContainer(
                      'Arms',
                      'Strong arms play an important role in an overall strong and functional upper body.',
                      'assets/images/beginner/armsB.jpg',
                      4,
                      const BeginnerArms(),
                    ),

                    //---------legs--------
                    exerciseContainer(
                      'Legs',
                      'legs is one of our biggest muscles, regularly training legs helps us reduce the risk of injury.',
                      'assets/images/beginner/legsB.jpg',
                      5,
                      const BeginnerLegs(),
                    ),

                    //-----------back-------
                    exerciseContainer(
                      'Back',
                      'strengthening your back muscles, you are building up the main support structure for your entire body.',
                      'assets/images/beginner/backB.jpg',
                      6,
                      const BeginnerBack(),
                    ),

                    SizedBox(
                      height: height * 0.0312,
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
     var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
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
          height: height * 0.15,
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
                height: height * 0.15,
                width: width * 0.528,
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
                          fontSize: height * 0.0375,
                          color: primaryGreen,
                          fontFamily: 'popBold',
                        ),
                      ),
                      Text(
                        erDescription,
                        style: TextStyle(
                          fontSize: height * 0.0125,
                          color: primaryGreen,
                          fontFamily: 'popLight',
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.15,
                width: width * 0.333,
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
