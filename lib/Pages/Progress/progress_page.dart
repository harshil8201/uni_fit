import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uni_fit/Class/color_class.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uni_fit/Pages/Drawer/Running%20track/map_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class ProgressPage extends StatefulWidget {
  const ProgressPage({Key key}) : super(key: key);

  @override
  _ProgressPageState createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;

  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning,';
    }
    if (hour < 17) {
      return 'Good Afternoon,';
    }
    return 'Good Evening,';
  }

  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      duration: const Duration(milliseconds: 250),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                      'PROGRESS',
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
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.1375),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 20,
                          left: 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              greeting(),
                              style: TextStyle(
                                color: primaryBlack,
                                fontSize: 23,
                                fontFamily: 'popMedium',
                              ),
                            ),
                            Text(
                              'Burn calories and try to archive your goal...',
                              style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 15,
                                  fontFamily: 'popLight'),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 20, left: 20, top: 20),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.35,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: primaryWhite,
                            boxShadow: [
                              BoxShadow(
                                color: shadowBlack,
                                offset: const Offset(0.5, 0.10),
                                blurRadius: 20.0,
                              ), //BoxShadow
                            ],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, bottom: 15),
                                child: Text(
                                  'Calories Burns'.toUpperCase(),
                                  style: TextStyle(
                                      color: darkGreen,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.03125,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'popBold'),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: Column(
                                  children: [
                                    //Abs
                                    user.emailVerified
                                        ? erVerifiedDataContainer(
                                            'Abs', 'absCal')
                                        : erNotVerifiedDataContainer(
                                            'Abs', 'absCal'),

                                    //Shoulder
                                    user.emailVerified
                                        ? erVerifiedDataContainer(
                                            'Shoulder', 'shoulderCal')
                                        : erNotVerifiedDataContainer(
                                            'Shoulder', 'shoulderCal'),

                                    //Chest
                                    user.emailVerified
                                        ? erVerifiedDataContainer(
                                            'Chest', 'chestCal')
                                        : erNotVerifiedDataContainer(
                                            'Chest', 'chestCal'),

                                    //Arms
                                    user.emailVerified
                                        ? erVerifiedDataContainer(
                                            'Arms', 'armsCal')
                                        : erNotVerifiedDataContainer(
                                            'Arms', 'armsCal'),

                                    //Legs
                                    user.emailVerified
                                        ? erVerifiedDataContainer(
                                            'Legs', 'legsCal')
                                        : erNotVerifiedDataContainer(
                                            'Legs', 'legsCal'),

                                    //Back
                                    user.emailVerified
                                        ? erVerifiedDataContainer(
                                            'Back', 'backCal')
                                        : erNotVerifiedDataContainer(
                                            'Back', 'backCal'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 25, left: 20, right: 20),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MapScreen()));
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.15,
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
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 15),
                                  child: Text(
                                    'Recent Running'.toUpperCase(),
                                    style: TextStyle(
                                      color: darkGreen,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.03125,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'popBold',
                                    ),
                                  ),
                                ),
                                user.emailVerified
                                    ? runningVerifiedContainer(
                                        'Kilometer', 'runningKM')
                                    : runningNotVerifiedContainer(
                                        'Kilometer', 'runningKM')
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 25, left: 20, right: 20),
                        child: InkWell(
                          onTap: () {},
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
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 15),
                                  child: Text(
                                    'Pre - Post Workout',
                                    style: TextStyle(
                                      color: darkGreen,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.03125,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'popBold',
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 15, right: 20, left: 20),
                                  child: InkWell(
                                    onTap: () async {
                                      const url = 'https://www.youtube.com/watch?v=ir2xV8iX38k';
                                      if (await canLaunch(url)) {
                                        await launch(url,
                                            forceSafariVC: false);
                                      }
                                    },
                                    child: Text(
                                      '1) What To Eat Before & After EVERY Workout',
                                      style: TextStyle(
                                        color: Colors.blue[600],
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'popBold',
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 15, right: 20, left: 20),
                                  child: InkWell(
                                    onTap: () async {
                                      const url = 'https://www.youtube.com/watch?v=nrQ1CQ2HRYk';
                                      if (await canLaunch(url)) {
                                        await launch(url,
                                            forceSafariVC: false);
                                      }
                                    },
                                    child: Text(
                                      '2) 8 Best Things to do After a Workout',
                                      style: TextStyle(
                                        color: Colors.blue[600],
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'popBold',
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // ProgressBarCharts.withSampleData(),
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

  Widget erVerifiedDataContainer(String erCategories, String erModel) {
    return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance
          .collection('UserData')
          .doc(user.email)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const CircularProgressIndicator();
        }
        var document = snapshot.data;
        return Row(
          children: [
            Text(
              '$erCategories : ',
              style: TextStyle(
                color: darkGreen,
                fontSize: MediaQuery.of(context).size.height * 0.025,
                fontWeight: FontWeight.normal,
                fontFamily: 'popMedium',
              ),
            ),
            Text(
              "${document[erModel]} cal",
              style: TextStyle(
                color: primaryBlack,
                fontSize: MediaQuery.of(context).size.height * 0.025,
                fontWeight: FontWeight.normal,
                fontFamily: 'popMedium',
              ),
            ),
          ],
        );
      },
    );
  }

  Widget erNotVerifiedDataContainer(String erCategories, String erModel) {
    return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance
          .collection('UserData')
          .doc(user.email)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const CircularProgressIndicator();
        }
        var document = snapshot.data;
        return Row(
          children: [
            Text(
              '$erCategories : ',
              style: TextStyle(
                color: darkGreen,
                fontSize: MediaQuery.of(context).size.height * 0.025,
                fontWeight: FontWeight.normal,
                fontFamily: 'popMedium',
              ),
            ),
            Text(
              "${document[erModel]} cal",
              style: TextStyle(
                color: primaryBlack,
                fontSize: MediaQuery.of(context).size.height * 0.025,
                fontWeight: FontWeight.normal,
                fontFamily: 'popMedium',
              ),
            ),
          ],
        );
      },
    );
  }

  Widget runningVerifiedContainer(String text, String documentType) {
    return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance
          .collection('UserData')
          .doc(user.email)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const CircularProgressIndicator();
        }
        var document = snapshot.data;
        return Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            children: [
              Text(
                '$text : ',
                style: TextStyle(
                    color: darkGreen,
                    fontSize: MediaQuery.of(context).size.height * 0.025,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'popMedium'),
              ),
              Text(
                document[documentType].toString(),
                style: TextStyle(
                    color: primaryBlack,
                    fontSize: MediaQuery.of(context).size.height * 0.025,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'popMedium'),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget runningNotVerifiedContainer(String text, String documentType) {
    return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance
          .collection('UserData')
          .doc(user.uid)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const CircularProgressIndicator();
        }
        var document = snapshot.data;
        return Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            children: [
              Text(
                '$text : ',
                style: TextStyle(
                    color: darkGreen,
                    fontSize: MediaQuery.of(context).size.height * 0.025,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'popMedium'),
              ),
              Text(
                document[documentType].toString(),
                style: TextStyle(
                    color: primaryBlack,
                    fontSize: MediaQuery.of(context).size.height * 0.025,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'popMedium'),
              ),
            ],
          ),
        );
      },
    );
  }
}
