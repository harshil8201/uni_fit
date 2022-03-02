import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uni_fit/Pages/start_page.dart';
import 'package:uni_fit/System%20Login/Login%20Signin/login_signup_page.dart';

class GooglePageController extends StatefulWidget {
  const GooglePageController({Key key}) : super(key: key);

  @override
  _GooglePageControllerState createState() => _GooglePageControllerState();
}

class _GooglePageControllerState extends State<GooglePageController> {
  @override
  Widget build(BuildContext context) {
    
    // final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          print("----------We are in Connection State-----------");
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            print("-----------We are in Start Page-----------");
            return const StartPage();
          } else if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong!!'));
          } else {
            print('-----------we are in SignIn / SignOut Page--------------');
            return const LoginSignupPage();
          }
        },
      ),
    );
  }
}