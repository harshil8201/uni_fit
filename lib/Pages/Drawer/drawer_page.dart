// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:uni_fit/Pages/Drawer/BMI%20Calculator/bmi_page.dart';
import 'package:uni_fit/Pages/Drawer/settings.dart';
import 'package:uni_fit/Classes/authentication.dart';
import 'package:uni_fit/Services/Login%20Register/login_signup_page.dart';
import 'package:uni_fit/Constants/color.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Running track/map_screen.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({Key key}) : super(key: key);

  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  final user = FirebaseAuth.instance.currentUser;

  _sendMail() async {
    const uri = 'mailto:unionsoftware.itbusiness@gmail.com?subject=&body=';
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }

  _openGooglePlay() async {
    const uri = 'https://play.google.com/store/apps/dev?id=8432020958886864336';
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }

  _ratingsApp() async {
    const uri =
        'https://play.google.com/store/apps/details?id=com.unionsoftwareit.uni_fit';
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: primaryGreen,
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 20, bottom: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                user.emailVerified
                    ? ClipOval(
                        child: Image.network(
                          user.photoURL,
                          fit: BoxFit.cover,
                          height: height * 0.15,
                          width: height * 0.15,
                        ),
                      )
                    : ClipOval(
                        child: Image.asset(
                          'assets/images/user.jpg',
                          fit: BoxFit.cover,
                          height: height * 0.15,
                          width: height * 0.15,
                        ),
                      ),
                const SizedBox(
                  height: 5,
                ),
                user.emailVerified
                    ? StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
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
                                color: primaryWhite,
                                fontSize: height * 0.0287,
                                fontFamily: 'popBold'),
                          );
                        },
                      )
                    : StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
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
                                color: primaryWhite,
                                fontSize: height * 0.0287,
                                fontFamily: 'popBold'),
                          );
                        },
                      ),
                user.emailVerified
                    ? Text(
                        user.email,
                        style: TextStyle(
                          fontSize: height * 0.015,
                          color: primaryWhite,
                          fontFamily: 'popLight',
                        ),
                      )
                    : Text(
                        user.email,
                        style: TextStyle(
                          fontSize: height * 0.015,
                          color: primaryWhite,
                          fontFamily: 'popLight',
                        ),
                      ),
              ],
            ),
            Column(
              children: [
                drawerItems(FontAwesomeIcons.running, 'Running track',
                    const MapScreen()),
                drawerItems(FontAwesomeIcons.calculator, 'BMI calculator',
                    const BMIPage()),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: InkWell(
                    onTap: () {
                      _sendMail();
                    },
                    child: Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.questionCircle,
                          color: primaryWhite,
                          size: height * 0.0313,
                        ),
                        SizedBox(
                          width: width * 0.042,
                        ),
                        Text(
                          'Contact us',
                          style: TextStyle(
                            fontSize: height * 0.018,
                            color: primaryWhite,
                            fontFamily: 'popMedium',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: InkWell(
                    onTap: () {
                      _openGooglePlay();
                    },
                    child: Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.plus,
                          color: primaryWhite,
                          size: height * 0.0313,
                        ),
                        SizedBox(
                          width: width * 0.042,
                        ),
                        Text(
                          ' More',
                          style: TextStyle(
                            fontSize: height * 0.018,
                            color: primaryWhite,
                            fontFamily: 'popMedium',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: InkWell(
                    onTap: () {
                      _ratingsApp();
                    },
                    child: Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.star,
                          color: primaryWhite,
                          size: height * 0.0313,
                        ),
                        SizedBox(
                          width: width * 0.042,
                        ),
                        Text(
                          'Ratings',
                          style: TextStyle(
                            fontSize: height * 0.018,
                            color: primaryWhite,
                            fontFamily: 'popMedium',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                drawerItems(
                    FontAwesomeIcons.cog, 'Settings', const SettingsPage()),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: height * 0.00625),
              child: InkWell(
                onTap: () {
                  showAlertDialog(context);
                },
                child: Row(
                  children: [
                    FaIcon(
                      Icons.logout,
                      color: primaryWhite,
                      size: height * 0.0313,
                    ),
                    SizedBox(
                      width: width * 0.042,
                    ),
                    Text(
                      'Logout',
                      style: TextStyle(
                        fontSize: height * 0.018,
                        color: primaryWhite,
                        fontFamily: 'popMedium',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: const Text(
        "Cancel",
        style: TextStyle(
          color: Colors.blue,
          fontFamily: 'popBold',
        ),
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: const Text(
        "Continue",
        style: TextStyle(
          color: Colors.red,
          fontFamily: 'popBold',
        ),
      ),
      onPressed: user.emailVerified
          ? () {
              AuthenticationHelper().signOutFromGoogle();
              Navigator.pop(context);
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LoginSignupPage()),
                  (Route<dynamic> route) => false);
              print('-----------we are sign out using google----------');
            }
          : () {
              AuthenticationHelper().signOut();
              Navigator.pop(context);
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LoginSignupPage()),
                  (Route<dynamic> route) => false);
              print(
                  '-----------we are sign out using email / password----------');
            },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      title: const Text(
        "Want to Logout?",
        style: TextStyle(
          color: Colors.red,
          fontFamily: 'popBold',
        ),
      ),
      content: const Text(
        "Are you sure ?",
        style: TextStyle(
          color: Colors.black,
          fontFamily: 'popMedium',
        ),
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Widget drawerItems(IconData icons, String listName, dynamic routeName) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.leftToRightWithFade,
              child: routeName,
            ),
          );
        },
        child: Row(
          children: [
            FaIcon(
              icons,
              color: primaryWhite,
              size: height * 0.0313,
            ),
            SizedBox(
              width: width * 0.042,
            ),
            Text(
              listName,
              style: TextStyle(
                fontSize: height * 0.019,
                color: primaryWhite,
                fontFamily: 'popMedium',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
