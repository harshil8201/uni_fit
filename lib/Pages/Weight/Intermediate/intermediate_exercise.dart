import 'package:flutter/material.dart';
import 'package:uni_fit/color_class.dart';
import 'intermediate_abs.dart';
import 'intermediate_arms.dart';
import 'intermediate_back.dart';
import 'intermediate_chest.dart';
import 'intermediate_legs.dart';
import 'intermediate_shoulder.dart';

class IntermediateExercise extends StatefulWidget {
  const IntermediateExercise({Key key}) : super(key: key);

  @override
  _IntermediateExerciseState createState() => _IntermediateExerciseState();
}

class _IntermediateExerciseState extends State<IntermediateExercise> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryWhite,
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
                    'INTERMEDIATE',
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
              padding: const EdgeInsets.only(top: 100, bottom: 90),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        '" Your Body can stand almost anything\n its your mind that you have to convince. "',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.0188,
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
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.188),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //-------abs----------
                    exerciseContainer(
                      'Abs',
                      'keep in mind that abdominal exercises alone are unlikely to decrease belly fat',
                      'assets/images/intermediate/absI.jpg',
                      1,
                      const IntermediateAbs(),
                    ),

                    //-------shoulder--------
                    exerciseContainer(
                      'Shoulder',
                      'Shoulder strength training can reduce your risk of injury by strengthening your core muscles',
                      'assets/images/intermediate/shoulderI.jpg',
                      2,
                      const IntermediateShoulder(),
                    ),

                    //---------chest--------
                    exerciseContainer(
                      'Chest',
                      'Working out the chest means working out the pectoral muscles, better known as the “pecs.”',
                      'assets/images/intermediate/chestI.jpg',
                      3,
                      const IntermediateChest(),
                    ),

                    //-----------arms-------
                    exerciseContainer(
                      'Arms',
                      'Strong biceps play an important role in an overall strong and functional upper body',
                      'assets/images/intermediate/armsI.jpg',
                      4,
                      const IntermediateArms(),
                    ),

                    //---------legs--------
                    exerciseContainer(
                      'Legs',
                      'legs is one of our biggest muscles, regularly training legs helps us reduce the risk of injury.',
                      'assets/images/intermediate/legsI.jpg',
                      5,
                      const IntermediateLegs(),
                    ),

                    //-----------back-------
                    exerciseContainer(
                      'Back',
                      'strengthening your back muscles, you are building up the main support structure for your entire body.',
                      'assets/images/intermediate/backI.jpg',
                      6,
                      const IntermediateBack(),
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
