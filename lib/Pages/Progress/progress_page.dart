import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uni_fit/color_class.dart';
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
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      duration: Duration(milliseconds: 250),
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/bg.png'),
                  fit: BoxFit.cover
              )
          ),
          child: Stack(
            children: [
              //-------appbar------
              Padding(
                padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
                child: Container(
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
                        height: 45,
                        width: 45,
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
                              size: 30,
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
                              size: 22,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        'PROGRESSION',
                        style: TextStyle(
                          color: superDarkGreen,
                          fontSize: 30,
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
                        height: 45,
                        width: 45,
                        child: user.emailVerified
                            ? ClipOval(
                          child: Image.network(
                            user.photoURL,
                            fit: BoxFit.cover,
                            height: 120,
                            width: 120,
                          ),
                        )
                            : ClipOval(
                          child: Image.asset(
                            'assets/images/user.jpg',
                            fit: BoxFit.cover,
                            height: 120,
                            width: 120,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 100, bottom: 90),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
