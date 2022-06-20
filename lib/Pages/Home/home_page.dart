// ignore_for_file: unused_local_variable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:uni_fit/Constants/img_design.dart';
import 'package:uni_fit/Constants/color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uni_fit/Pages/Diet/high_calories.dart';
import 'package:uni_fit/Pages/Diet/low_calories.dart';
import 'package:uni_fit/Pages/Diet/muscle_gain.dart';
import 'package:uni_fit/Pages/Diet/normal_diet.dart';
import 'package:uni_fit/Pages/Diet/weight_loss.dart';
import 'package:uni_fit/Pages/workout/Beginner/Exercise/beginner_abs.dart';
import 'package:uni_fit/Pages/workout/Beginner/Exercise/beginner_chest.dart';
import 'package:uni_fit/Pages/workout/Beginner/Exercise/beginner_shoulder.dart';
import 'package:uni_fit/Pages/workout/Intermediate/Exercise/intermediate_abs.dart';
import 'package:uni_fit/Pages/workout/Intermediate/Exercise/intermediate_legs.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;

  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
     var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      duration: const Duration(milliseconds: 250),
      child: Scaffold(
        body: bgContainer(
          Stack(
            children: [
              //-------appbar------
              Padding(
                padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: shadowBlack,
                            offset: const Offset(0.5, 0.10),
                            blurRadius: 20.0,
                          ), //BoxShadow
                        ],
                        shape: BoxShape.circle,
                        color: primaryGreen,
                      ),
                      height:  height * 0.056,
                      width:  height * 0.056,
                      child: Center(
                        child: isDrawerOpen
                            ? InkWell(
                                onTap: () {
                                  setState(() {
                                    xOffset = 0;
                                    yOffset = 0;
                                    scaleFactor = 1;
                                    isDrawerOpen = false;
                                  });
                                },
                                child: Icon(
                                  Icons.arrow_back,
                                  color: primaryWhite,
                                  size:  height *
                                      0.038,
                                ),
                              )
                            : InkWell(
                                onTap: () {
                                  setState(() {
                                    xOffset = 280;
                                    yOffset = 100;
                                    scaleFactor = 0.7;
                                    isDrawerOpen = true;
                                  });
                                },
                                child: FaIcon(
                                  FontAwesomeIcons.listUl,
                                  color: primaryWhite,
                                  size:  height *
                                      0.028,
                                ),
                              ),
                      ),
                    ),
                    Text(
                      'UNI FIT',
                      style: TextStyle(
                        color: superDarkGreen,
                        fontSize:  height * 0.038,
                        fontFamily: 'popBold',
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: shadowBlack,
                            offset: const Offset(0.5, 0.10),
                            blurRadius: 20.0,
                          ), //BoxShadow
                        ],
                        shape: BoxShape.circle,
                        color: primaryGreen,
                      ),
                      height:  height * 0.056,
                      width:  height * 0.056,
                      child: user.emailVerified
                          ? ClipOval(
                              child: Image.network(
                                user.photoURL,
                                fit: BoxFit.cover,
                                height:
                                     height * 0.15,
                                width:
                                     height * 0.15,
                              ),
                            )
                          : ClipOval(
                              child: Image.asset(
                                'assets/images/user.jpg',
                                fit: BoxFit.cover,
                                height:
                                     height * 0.15,
                                width:
                                     height * 0.15,
                              ),
                            ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15, left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Hi, ',
                                  style: TextStyle(
                                      color: primaryBlack,
                                      fontSize:
                                           height *
                                              0.02875,
                                      fontFamily: 'popMedium'),
                                ),
                                user.emailVerified
                                    ? StreamBuilder<
                                        DocumentSnapshot<Map<String, dynamic>>>(
                                        stream: FirebaseFirestore.instance
                                            .collection('UserData')
                                            .doc(user.email)
                                            .snapshots(),
                                        builder: (context, snapshot) {
                                          if (!snapshot.hasData) {
                                            return const CircularProgressIndicator();
                                          }
                                          var document = snapshot.data;
                                          return Text(
                                            document['name'],
                                            style: TextStyle(
                                                color: primaryBlack,
                                                fontSize: height *
                                                    0.02875,
                                                fontFamily: 'popMedium'),
                                          );
                                        },
                                      )
                                    : StreamBuilder<
                                        DocumentSnapshot<Map<String, dynamic>>>(
                                        stream: FirebaseFirestore.instance
                                            .collection('UserData')
                                            .doc(user.uid)
                                            .snapshots(),
                                        builder: (context, snapshot) {
                                          if (!snapshot.hasData) {
                                            return const CircularProgressIndicator();
                                          }
                                          var document = snapshot.data;
                                          return Text(
                                            document['name'],
                                            style: TextStyle(
                                                color: primaryBlack,
                                                fontSize: height *
                                                    0.02875,
                                                fontFamily: 'popMedium'),
                                          );
                                        },
                                      )
                              ],
                            ),
                            Text(
                              "Ready for today's workout?",
                              style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize:  height *
                                      0.01875,
                                  fontFamily: 'popLight'),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: CarouselSlider(
                          options: CarouselOptions(
                            autoPlay: true,
                            autoPlayInterval: const Duration(seconds: 4),
                            height:
                                 height * 0.29375,
                          ),
                          items: [
                            erContainer(
                              'Push Ups',
                              '15 X 3',
                              'push ups',
                              'Literally every major\nmuscle in your body\nis called upon\nto execute the\nmovement.',
                              const BeginnerChest(),
                            ),
                            erContainer(
                              'Jumping Jacks',
                              '30 Sec',
                              'jumping jacks',
                              'It increases your\nheart rate,which\npromotes the flow\nof blood and oxygen\nto your brain.',
                              const BeginnerShoulder(),
                            ),
                            erContainer(
                              'Squats',
                              '10 X 3',
                              'squats',
                              'It is help to \nStrengthens core,\nreduces risk of\ninjury, Strengthens\nmuscles of lower\nbody',
                              const IntermediateLegs(),
                            ),
                            erContainer(
                              'Abdominal Crunch',
                              '30 X 2',
                              'abdominals crunch',
                              'Helps people\nsuffering from\nregular constipation\nby inducing\ntriggering the\nbowel movement.',
                              const IntermediateAbs(),
                            ),
                            erContainer(
                              'Plank',
                              '30 sec X 2',
                              'plank',
                              'The plank position\nhelps target core\nmuscles & give \nthem a good burn\nto build muscle\nstrength.',
                              const BeginnerAbs(),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: CarouselSlider(
                          options: CarouselOptions(
                            // reverse: true,
                            autoPlay: true,
                            autoPlayInterval: const Duration(seconds: 5),
                            height:  height * 0.25,
                          ),
                          items: [
                            dietContainer(
                              'avocado',
                              'Avocado',
                              '738',
                              'Lunch',
                              const HighCalories(),
                            ),
                            dietContainer(
                              'berries',
                              'Berries',
                              '96',
                              'Breakfast',
                              const LowCalories(),
                            ),
                            dietContainer(
                              'pancake',
                              'Pancake',
                              '680',
                              'Breakfast',
                              const MuscleGainDiet(),
                            ),
                            dietContainer(
                              'oats',
                              'Oats',
                              '150',
                              'Breakfast',
                              const NormalDiet(),
                            ),
                            dietContainer(
                              'raspberry',
                              'Raspberry',
                              '352',
                              'Breakfast',
                              const WeightLoss(),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 20,
                          left: 20,
                          right: 20,
                        ),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: primaryWhite,
                            boxShadow: [
                              BoxShadow(
                                color: shadowBlack,
                                offset: const Offset(0.5, 0.10),
                                blurRadius: 20.0,
                              ), //BoxShadow
                            ],
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 30,),
                                child: Text(
                                  'Videos'.toUpperCase(),
                                  style: TextStyle(
                                    color: darkGreen,
                                    fontSize:
                                         height *
                                            0.03125,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'popBold',
                                  ),
                                ),
                              ),
                              StreamBuilder(
                                stream: FirebaseFirestore.instance
                                    .collection('homeVideoLink')
                                    .orderBy('title',descending: false)
                                    .snapshots(),
                                builder: (BuildContext context,
                                    AsyncSnapshot<QuerySnapshot> snapshot) {
                                  if (!snapshot.hasData) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                  return Padding(
                                    padding: const EdgeInsets.only(left: 25,right: 25,),
                                    child: SizedBox(
                                      height: 200,
                                      child: ListView.builder(
                                        itemCount: snapshot.data.docs.length,
                                        itemBuilder: (context, index) {
                                          DocumentSnapshot data =
                                              snapshot.data.docs[index];
                                          return Padding(
                                            padding: const EdgeInsets.only(bottom: 15),
                                            child: InkWell(
                                              onTap: () async {
                                                if (await canLaunch(data['url'])) {
                                                  await launch(data['url'],
                                                      forceSafariVC: false);
                                                }
                                              },
                                              child: Text(
                                                data['title'],
                                                style: TextStyle(
                                                  color: Colors.blue[600],
                                                  fontSize:  height * 0.01875,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'popBold',
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  );
                                },
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.only(top: 10, bottom: 10),
                                child: Text(
                                  'scroll down',
                                  style: TextStyle(
                                    color: Colors.grey[400],
                                    fontSize:  height * 0.015,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'popBold',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 100,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget erContainer(
    String erName,
    String erSet,
    String erImage,
    String erDescription,
    dynamic erRoute,
  ) {
     var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 15, right: 7, left: 7),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.bottomToTop,
                child: erRoute,
              ));
        },
        child: Container(
          height:  height * 0.25,
          width:  width * 0.8333,
          decoration: BoxDecoration(
            color: primaryWhite,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: shadowBlack,
                offset: const Offset(0.0, 0.10),
                blurRadius: 10.0,
              ), //BoxShadow
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      // child: Image.asset(
                      //   'assets/images/gif/$erImage.gif',
                      //   height:  height * 0.15,
                      //   width:  width * 0.3333,
                      //   fit: BoxFit.cover,
                      // ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            erDescription,
                            style: TextStyle(
                                color: primaryGreen,
                                fontSize:
                                     height * 0.015,
                                fontFamily: 'popLight'),
                          ),
                          SizedBox(
                            height:
                                 height * 0.00625,
                          ),
                          Text(
                            'Set: $erSet',
                            style: TextStyle(
                              color: primaryGreen,
                              fontSize:
                                   height * 0.02125,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'popLight',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    erName,
                    style: TextStyle(
                      color: primaryBlack,
                      fontSize:  height * 0.02775,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'popBold',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget dietContainer(
    String dietImage,
    String dietName,
    String dietCalories,
    String dietType,
    dynamic dietRoute,
  ) {
     var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 15, right: 7, left: 7),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.bottomToTop,
                child: dietRoute,
              ));
        },
        child: Container(
          height:  height * 0.25,
          width:  width * 0.8333,
          decoration: BoxDecoration(
            color: primaryGreen,
            image: DecorationImage(
              image: AssetImage(
                'assets/images/diet/$dietImage.jpg',
              ),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.25),
                BlendMode.darken,
              ),
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 15, top: 5, bottom: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  dietName,
                  style: TextStyle(
                    color: primaryWhite,
                    fontSize:  height * 0.04375,
                    fontFamily: 'popBold',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height:  height * 0.025,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Calories : " + dietCalories + "cal",
                      style: TextStyle(
                        color: primaryWhite,
                        fontSize:  height * 0.0188,
                        fontFamily: 'popLight',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Type : " + dietType,
                      style: TextStyle(
                        color: primaryWhite,
                        fontSize:  height * 0.0188,
                        fontFamily: 'popLight',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
