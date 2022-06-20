// ignore_for_file: avoid_print, file_names

import 'package:flutter/material.dart';
import 'package:uni_fit/Constants/color.dart';
import 'package:uni_fit/Pages/start_page.dart';
import 'package:uni_fit/Classes/authentication.dart';
import 'package:uni_fit/Services/Login%20Register/login_signup_page.dart';

class GoogleSignInButton extends StatefulWidget {
  const GoogleSignInButton({Key key}) : super(key: key);

  @override
  _GoogleSignInButtonState createState() => _GoogleSignInButtonState();
}

class _GoogleSignInButtonState extends State<GoogleSignInButton> {
  @override
  Widget build(BuildContext context) {
       var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 5),
      child: InkWell(
        onTap: () {
          print("Device Height: $height");
          print("Device Width: $width");
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
          height: height* 0.057,
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
                  height: height* 0.0375,
                  width:  width * 0.1071,
                ),
                Text(
                  'Google',
                  style: TextStyle(
                    color: primaryBlack,
                    fontSize: height* 0.0187,
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
