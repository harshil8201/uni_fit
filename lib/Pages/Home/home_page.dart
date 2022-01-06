import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uni_fit/Class/color_class.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      duration: const Duration(milliseconds: 250),
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/bg.png'),
                  fit: BoxFit.cover)),
          child: Stack(
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
                      height: MediaQuery.of(context).size.height * 0.056,
                      width: MediaQuery.of(context).size.height * 0.056,
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
                                  size: MediaQuery.of(context).size.height *
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
                                  size: MediaQuery.of(context).size.height *
                                      0.028,
                                ),
                              ),
                      ),
                    ),
                    Text(
                      'UNI FIT',
                      style: TextStyle(
                        color: superDarkGreen,
                        fontSize: MediaQuery.of(context).size.height * 0.038,
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
                      height: MediaQuery.of(context).size.height * 0.056,
                      width: MediaQuery.of(context).size.height * 0.056,
                      child: user.emailVerified
                          ? ClipOval(
                              child: Image.network(
                                user.photoURL,
                                fit: BoxFit.cover,
                                height:
                                    MediaQuery.of(context).size.height * 0.15,
                                width:
                                    MediaQuery.of(context).size.height * 0.15,
                              ),
                            )
                          : ClipOval(
                              child: Image.asset(
                                'assets/images/user.jpg',
                                fit: BoxFit.cover,
                                height:
                                    MediaQuery.of(context).size.height * 0.15,
                                width:
                                    MediaQuery.of(context).size.height * 0.15,
                              ),
                            ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: CarouselSlider(
                  items: [
                    erContainer(
                      'Push Ups',
                      '15 X 3',
                      'push ups',
                      'Literally every major\nmuscle in your body\nis called upon\nto execute the\nmovement.',
                    ),
                    erContainer(
                      'Jumping Jacks',
                      '30 Sec',
                      'jumping jacks',
                      'It increases your\nheart rate,which\npromotes the flow\nof blood and oxygen\nto your brain.',
                    ),
                    erContainer(
                      'Squats',
                      '10 X 3',
                      'squats',
                      'It is help to \nStrengthens core,\nreduces risk of\ninjury, Strengthens\nmuscles of lower\nbody',
                    ),
                    erContainer(
                      'Abdominal Crunch',
                      '30 X 2',
                      'abdominals crunch',
                      'Helps people\nsuffering from\nregular constipation\nby inducing\ntriggering the\nbowel movement.',
                    ),
                    erContainer(
                      'Plank',
                      '30 sec X 2',
                      'plank',
                      'The plank position\nhelps target core\nmuscles & give \nthem a good burn\nto build muscle\nstrength.',
                    ),
                  ],
                  options: CarouselOptions(
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 2),
                    height: MediaQuery.of(context).size.height * 0.29375,
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
  ) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 15, right: 7, left: 7),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.25,
        width: MediaQuery.of(context).size.width * 0.8333,
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
                    child: Image.asset(
                      'assets/images/gif/$erImage.gif',
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: MediaQuery.of(context).size.width * 0.3333,
                      fit: BoxFit.cover,
                    ),
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
                                  MediaQuery.of(context).size.height * 0.015,
                              fontFamily: 'popLight'),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.00625,
                        ),
                        Text(
                          'Set: $erSet',
                          style: TextStyle(
                            color: primaryGreen,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.02125,
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
                    fontSize: MediaQuery.of(context).size.height * 0.03125,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'popBold',
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
