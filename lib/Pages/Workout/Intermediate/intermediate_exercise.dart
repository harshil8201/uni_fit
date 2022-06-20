import 'package:flutter/material.dart';
import 'package:uni_fit/Constants/img_design.dart';
import 'package:uni_fit/Constants/color.dart';
import 'package:uni_fit/Pages/start_page.dart';
import 'Exercise/intermediate_abs.dart';
import 'Exercise/intermediate_arms.dart';
import 'Exercise/intermediate_back.dart';
import 'Exercise/intermediate_chest.dart';
import 'Exercise/intermediate_legs.dart';
import 'Exercise/intermediate_shoulder.dart';

class IntermediateExercise extends StatefulWidget {
  const IntermediateExercise({Key key}) : super(key: key);

  @override
  _IntermediateExerciseState createState() => _IntermediateExerciseState();
}

class _IntermediateExerciseState extends State<IntermediateExercise> {
  @override
  Widget build(BuildContext context) {
     var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: primaryWhite,
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
                    'INTERMEDIATE',
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
                  '“Once you are exercising regularly, the hardest thing is to stop it.”',
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
                      'Strength does not come from physical capacity. It comes from an indomitable will.',
                      'assets/images/intermediate/absI.jpg',
                      1,
                      const IntermediateAbs(),
                    ),

                    //-------shoulder--------
                    exerciseContainer(
                      'Shoulder',
                      'Success usually comes to those who are too busy to be looking for it.',
                      'assets/images/intermediate/shoulderI.jpg',
                      2,
                      const IntermediateShoulder(),
                    ),

                    //---------chest--------
                    exerciseContainer(
                      'Chest',
                      'If you want something you’ve never had, you must be willing to do something you’ve never done.',
                      'assets/images/intermediate/chestI.jpg',
                      3,
                      const IntermediateChest(),
                    ),

                    //-----------arms-------
                    exerciseContainer(
                      'Arms',
                      'Once you are exercising regularly, the hardest thing is to stop it.',
                      'assets/images/intermediate/armsI.jpg',
                      4,
                      const IntermediateArms(),
                    ),

                    //---------legs--------
                    exerciseContainer(
                      'Legs',
                      'If you don’t make time for exercise, you’ll probably have to make time for illness.',
                      'assets/images/intermediate/legsI.jpg',
                      5,
                      const IntermediateLegs(),
                    ),

                    //-----------back-------
                    exerciseContainer(
                      'Back',
                      'Dead last finish is greater than did not finish, which trumps did not start.',
                      'assets/images/intermediate/backI.jpg',
                      6,
                      const IntermediateBack(),
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
                    tag: 'intermediate-image-$listImage',
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
