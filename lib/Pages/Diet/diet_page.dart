import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:uni_fit/Pages/Diet/high_calories.dart';
import 'package:uni_fit/Pages/Diet/low_calories.dart';
import 'package:uni_fit/Pages/Diet/muscle_gain.dart';
import 'package:uni_fit/Pages/Diet/normal_diet.dart';
import 'package:uni_fit/Pages/Diet/weight_loss.dart';
import 'package:uni_fit/Class/color_class.dart';

class DietPage extends StatefulWidget {
  const DietPage({Key key}) : super(key: key);

  @override
  _DietPageState createState() => _DietPageState();
}

class _DietPageState extends State<DietPage> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;

  final user = FirebaseAuth.instance.currentUser;
  final auth = FirebaseAuth.instance;

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
              //---------appbar----------
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
                      'DIET',
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
                padding: const EdgeInsets.only(top: 100, bottom: 90),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              user.emailVerified
                                  ? Text(
                                      user.displayName,
                                      style: TextStyle(
                                        color: primaryBlack,
                                        fontFamily: 'popMedium',
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.038,
                                      ),
                                    )
                                  : Text(
                                      "Hi Alen",
                                      style: TextStyle(
                                        color: primaryBlack,
                                        fontFamily: 'popMedium',
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.038,
                                      ),
                                    ),
                              Text(
                                'Ready to loose some calories today!!',
                                style: TextStyle(
                                  color: primaryBlack,
                                  fontFamily: 'popLight',
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.015,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.018),
                      dietContainer(
                        '300-722 cal',
                        'Muscle\nGain',
                        'assets/images/diet/diet1.jpg',
                        const MuscleGainDiet(),
                      ),
                      dietContainer(
                        '150-276 cal',
                        'Weight\nloss',
                        'assets/images/diet/diet2.jpg',
                        const WeightLoss(),
                      ),
                      dietContainer(
                        '120-500 cal',
                        'High\ncalories',
                        'assets/images/diet/diet3.jpg',
                        const HighCalories(),
                      ),
                      dietContainer(
                        '120-500 cal',
                        'Low\ncalories',
                        'assets/images/diet/diet4.jpg',
                        const LowCalories(),
                      ),
                      dietContainer(
                        '150-276 cal',
                        'Normal\ndiet',
                        'assets/images/diet/diet5.jpg',
                        const NormalDiet(),
                      ),
                      const SizedBox(
                        height: 20,
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

  Widget dietContainer(
    String dietCalories,
    String dietType,
    String dietImage,
    dynamic routeName,
  ) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, top: 15, left: 20),
      child: InkWell(
        onTap: () {
          // Navigate to the second screen using a named route.
          Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.bottomToTop, child: routeName),
          );
        },
        child: Container(
          height: MediaQuery.of(context).size.height * 0.14,
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
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      dietCalories,
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.0125,
                        color: semiBlack,
                        fontFamily: 'popLight',
                      ),
                    ),
                    Text(
                      dietType.toUpperCase(),
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.0312,
                        color: primaryGreen,
                        fontFamily: 'popBold',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.137,
                width: MediaQuery.of(context).size.width * 0.417,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(15),
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(15),
                  ),
                  child: FadeInImage(
                    image: AssetImage(
                      dietImage,
                    ),
                    fit: BoxFit.cover,
                    placeholder: const AssetImage(
                      'assets/images/loading.gif',
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

  Widget dietByExerciseContainer(
    String dietCalories,
    String dietName,
    String dietImage,
  ) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 20, bottom: 20),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.269,
        width: MediaQuery.of(context).size.width * 0.361,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: shadowBlack,
              offset: const Offset(0, 0),
              blurRadius: 20.0,
            ), //BoxShadow
          ],
          color: primaryWhite,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.269,
              width: MediaQuery.of(context).size.width * 0.362,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image(
                  fit: BoxFit.cover,
                  image: AssetImage(dietImage),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.0062,
                ),
                Text(
                  dietCalories,
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.0125,
                    color: semiBlack,
                    fontFamily: 'popLight',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    dietName,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.0187,
                      color: primaryBlack,
                      fontFamily: 'popMedium',
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
}
