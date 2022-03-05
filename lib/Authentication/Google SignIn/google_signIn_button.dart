// ignore_for_file: avoid_print, file_names

import 'package:flutter/material.dart';
import 'package:uni_fit/Class/color_class.dart';
import 'package:uni_fit/Pages/start_page.dart';
import 'package:uni_fit/Authentication/Login Register/authentication.dart';
import 'package:uni_fit/Authentication/Login Register/login_signup_page.dart';

class GoogleSignInButton extends StatefulWidget {
  const GoogleSignInButton({Key key}) : super(key: key);

  @override
  _GoogleSignInButtonState createState() => _GoogleSignInButtonState();
}

class _GoogleSignInButtonState extends State<GoogleSignInButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 5),
      child: InkWell(
        onTap: () {
          print("Device Height: ${MediaQuery.of(context).size.height}");
          print("Device Width: ${MediaQuery.of(context).size.width}");
          AuthenticationHelper()
              .signInwithGoogle()
              .onError((error, stackTrace) => const LoginSignupPage())
              .whenComplete(
                () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const StartPage(),
                  ),
                ),
              );
        },
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.057,
          decoration: BoxDecoration(
            color: primaryWhite,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: shadowBlack,
                offset: const Offset(0, 0),
                blurRadius: 10.0,
              ),
            ],
          ),
          child: SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/google.png',
                  height: MediaQuery.of(context).size.height * 0.0375,
                  width: MediaQuery.of(context).size.width * 0.1071,
                ),
                Text(
                  'Google',
                  style: TextStyle(
                    color: primaryBlack,
                    fontSize: MediaQuery.of(context).size.height * 0.0187,
                    fontFamily: 'popMedium',
                    letterSpacing: 2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
