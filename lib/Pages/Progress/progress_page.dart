import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uni_fit/Class/color_class.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
                padding: const EdgeInsets.only(top: 110),
                child: Padding(
                  padding: const EdgeInsets.only(
                      right: 20, left: 20, top: 5, bottom: 5),
                  child: Container(
                    height: 300,
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
                          padding: const EdgeInsets.only(top: 10, bottom: 15),
                          child: Text(
                            'Calories Burns'.toUpperCase(),
                            style: TextStyle(
                                color: darkGreen,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'popBold'),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 20,right: 20),
                          child: Column(
                            children: [

                              //Abs
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
                                        return Row(
                                          children: [
                                            Text(
                                              'Abs ',
                                              style: TextStyle(
                                                  color: darkGreen,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.normal,
                                                  fontFamily: 'popMedium'),
                                            ),
                                            Text(
                                              document['absCal'].toString(),
                                              style: TextStyle(
                                                  color: primaryBlack,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.normal,
                                                  fontFamily: 'popMedium'),
                                            ),
                                          ],
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
                                        return Row(
                                          children: [
                                            Text(
                                              'Abs ',
                                              style: TextStyle(
                                                  color: darkGreen,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.normal,
                                                  fontFamily: 'popMedium'),
                                            ),
                                            Text(
                                              document['absCal'].toString(),
                                              style: TextStyle(
                                                  color: primaryBlack,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.normal,
                                                  fontFamily: 'popMedium'),
                                            ),
                                          ],
                                        );
                                      },
                                    ),

                              //Shoulder
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
                                        return Row(
                                          children: [
                                            Text(
                                              'Shoulder ',
                                              style: TextStyle(
                                                  color: darkGreen,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.normal,
                                                  fontFamily: 'popMedium'),
                                            ),
                                            Text(
                                              document['shoulderCal'].toString(),
                                              style: TextStyle(
                                                  color: primaryBlack,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.normal,
                                                  fontFamily: 'popMedium'),
                                            ),
                                          ],
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
                                        return Row(
                                          children: [
                                            Text(
                                              'Shoulder ',
                                              style: TextStyle(
                                                  color: darkGreen,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.normal,
                                                  fontFamily: 'popMedium'),
                                            ),
                                            Text(
                                              document['shoulderCal'].toString(),
                                              style: TextStyle(
                                                  color: primaryBlack,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.normal,
                                                  fontFamily: 'popMedium'),
                                            ),
                                          ],
                                        );
                                      },
                                    ),

                              //Chest
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
                                        return Row(
                                          children: [
                                            Text(
                                              'Chest ',
                                              style: TextStyle(
                                                  color: darkGreen,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.normal,
                                                  fontFamily: 'popMedium'),
                                            ),
                                            Text(
                                              document['chestCal'].toString(),
                                              style: TextStyle(
                                                  color: primaryBlack,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.normal,
                                                  fontFamily: 'popMedium'),
                                            ),
                                          ],
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
                                        return Row(
                                          children: [
                                            Text(
                                              'Chest ',
                                              style: TextStyle(
                                                  color: darkGreen,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.normal,
                                                  fontFamily: 'popMedium'),
                                            ),
                                            Text(
                                              document['chestCal'].toString(),
                                              style: TextStyle(
                                                  color: primaryBlack,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.normal,
                                                  fontFamily: 'popMedium'),
                                            ),
                                          ],
                                        );
                                      },
                                    ),

                              //Arms
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
                                        return Row(
                                          children: [
                                            Text(
                                              'Arms ',
                                              style: TextStyle(
                                                  color: darkGreen,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.normal,
                                                  fontFamily: 'popMedium'),
                                            ),
                                            Text(
                                              document['armsCal'].toString(),
                                              style: TextStyle(
                                                  color: primaryBlack,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.normal,
                                                  fontFamily: 'popMedium'),
                                            ),
                                          ],
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
                                        return Row(
                                          children: [
                                            Text(
                                              'Arms ',
                                              style: TextStyle(
                                                  color: darkGreen,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.normal,
                                                  fontFamily: 'popMedium'),
                                            ),
                                            Text(
                                              document['armsCal'].toString(),
                                              style: TextStyle(
                                                  color: primaryBlack,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.normal,
                                                  fontFamily: 'popMedium'),
                                            ),
                                          ],
                                        );
                                      },
                                    ),

                              //Legs
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
                                        return Row(
                                          children: [
                                            Text(
                                              'Legs ',
                                              style: TextStyle(
                                                  color: darkGreen,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.normal,
                                                  fontFamily: 'popMedium'),
                                            ),
                                            Text(
                                              document['legsCal'].toString(),
                                              style: TextStyle(
                                                  color: primaryBlack,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.normal,
                                                  fontFamily: 'popMedium'),
                                            ),
                                          ],
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
                                        return Row(
                                          children: [
                                            Text(
                                              'Legs ',
                                              style: TextStyle(
                                                  color: darkGreen,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.normal,
                                                  fontFamily: 'popMedium'),
                                            ),
                                            Text(
                                              document['legsCal'].toString(),
                                              style: TextStyle(
                                                  color: primaryBlack,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.normal,
                                                  fontFamily: 'popMedium'),
                                            ),
                                          ],
                                        );
                                      },
                                    ),

                              //Back
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
                                        return Row(
                                          children: [
                                            Text(
                                              'Back ',
                                              style: TextStyle(
                                                  color: darkGreen,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.normal,
                                                  fontFamily: 'popMedium'),
                                            ),
                                            Text(
                                              document['backCal'].toString(),
                                              style: TextStyle(
                                                  color: primaryBlack,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.normal,
                                                  fontFamily: 'popMedium'),
                                            ),
                                          ],
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
                                        return Row(
                                          children: [
                                            Text(
                                              'Back ',
                                              style: TextStyle(
                                                  color: darkGreen,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.normal,
                                                  fontFamily: 'popMedium'),
                                            ),
                                            Text(
                                              document['backCal'].toString(),
                                              style: TextStyle(
                                                  color: primaryBlack,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.normal,
                                                  fontFamily: 'popMedium'),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                            ],
                          ),
                        ),
                      ],
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
