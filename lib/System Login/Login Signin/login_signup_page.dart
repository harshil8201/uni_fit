import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:uni_fit/Pages/start_page.dart';
import 'package:uni_fit/System%20Login/Google%20SignIn/google_signIn_button.dart';
import 'package:uni_fit/Class/color_class.dart';
import 'package:uni_fit/System%20Login/Login%20Signin/forget_password.dart';
import 'authentication.dart';

class LoginSignupPage extends StatefulWidget {
  const LoginSignupPage({Key key}) : super(key: key);

  @override
  _LoginSignupPageState createState() => _LoginSignupPageState();
}

class _LoginSignupPageState extends State<LoginSignupPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController name = TextEditingController();
  final user = FirebaseAuth.instance.currentUser;

  String _name;
  String _email, _password;

  final auth = FirebaseAuth.instance;

  bool isVisible = true;
  bool _isObscure = true;

  // DatabaseReference _ref;
  // @override
  // void initState() {
  //   super.initState();
  //   _ref = FirebaseDatabase.instance.ref().child(FirebaseAuth.instance.currentUser.uid);
  // }
  //
  // void saveInfo(){
  //   Map<String, String> data ={
  //     'email': _email
  //   };
  //   _ref.push().set(data);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            //--------------------------Login-------------------------

            isVisible
                ? Visibility(
                    visible: isVisible,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //---------upper part---------
                            Stack(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.0625,
                                    right: MediaQuery.of(context).size.width *
                                        0.02778,
                                  ),
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.3125,
                                      width: MediaQuery.of(context).size.width *
                                          0.6944,
                                      child: Image.asset(
                                        'assets/images/1.png',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 230),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Hey,\nWelcome!',
                                      style: TextStyle(
                                        color: primaryGreen,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                        fontFamily: 'popBold',
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            //-----------email-------------
                            Padding(
                              padding: const EdgeInsets.only(top: 5, right: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: Text(
                                      'Email :',
                                      style: TextStyle(
                                        color: superDarkGreen,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.0187,
                                        fontFamily: 'popBold',
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.00625),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: shadeWhite.withOpacity(0.60),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15, right: 10),
                                      child: SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.0625,
                                        width: double.infinity,
                                        child: TextFormField(
                                          onChanged: (value) {
                                            setState(() {
                                              _email = value.trim();
                                            });
                                          },
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return "Please enter email";
                                            }
                                            return null;
                                          },
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          textInputAction: TextInputAction.next,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            icon: Icon(
                                                Icons.mail_outline_outlined,
                                                color: darkWhite),
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.never,
                                            enabledBorder:
                                                const UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors
                                                            .transparent)),
                                            focusedBorder:
                                                const UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors
                                                            .transparent)),
                                            hintText: 'Enter your email',
                                            hintStyle:
                                                TextStyle(color: darkWhite),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            //-----------password-----------
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: Text(
                                      'Password :',
                                      style: TextStyle(
                                        color: superDarkGreen,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.01875,
                                        fontFamily: 'popBold',
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5, right: 10),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: shadeWhite.withOpacity(0.60),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            right: 8, left: 15),
                                        child: SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.0625,
                                          width: double.infinity,
                                          child: TextFormField(
                                            onChanged: (value) {
                                              setState(() {
                                                _password = value.trim();
                                              });
                                            },
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return "Please enter password";
                                              }
                                              return null;
                                            },
                                            obscureText: _isObscure,
                                            textInputAction:
                                                TextInputAction.done,
                                            decoration: InputDecoration(
                                              icon: Icon(Icons.vpn_key_rounded,
                                                  color: darkWhite),
                                              floatingLabelBehavior:
                                                  FloatingLabelBehavior.never,
                                              enabledBorder:
                                                  const UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent)),
                                              focusedBorder:
                                                  const UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent)),
                                              hintText: 'Enter your password',
                                              hintStyle:
                                                  TextStyle(color: darkWhite),
                                              suffixIcon: IconButton(
                                                color: darkWhite,
                                                icon: Icon(
                                                  _isObscure
                                                      ? Icons.visibility
                                                      : Icons.visibility_off,
                                                ),
                                                onPressed: () {
                                                  setState(
                                                    () {
                                                      _isObscure = !_isObscure;
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                  //---------------forget button----------------
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            PageTransition(
                                              type: PageTransitionType
                                                  .rightToLeftWithFade,
                                              child: const ForgetPasswordPage(),
                                            ),
                                          );
                                        },
                                        child: const Text(
                                          'Forget Password?',
                                          style: TextStyle(color: Colors.blue),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )

                //----------------------Sign up-------------------------------

                : Visibility(
                    visible: !isVisible,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //---------upper part---------
                            Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: SizedBox(
                                      //color: Colors.blue,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.3125,
                                      width: MediaQuery.of(context).size.width *
                                          0.6944,
                                      child: Image.asset(
                                        'assets/images/2.png',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 210),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Hello,\nSign up!',
                                      style: TextStyle(
                                        color: primaryGreen,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                        fontFamily: 'popBold',
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.025,
                            ),

                            //------------Name-------------
                            Padding(
                              padding: const EdgeInsets.only(top: 5, right: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: Text(
                                      'Name :',
                                      style: TextStyle(
                                        color: superDarkGreen,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.01875,
                                        fontFamily: 'popBold',
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.00625,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: shadeWhite.withOpacity(0.60),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15, right: 10),
                                      child: SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.0625,
                                        width: double.infinity,
                                        child: TextFormField(
                                          controller: name,
                                          onChanged: (value) {
                                            setState(() {
                                              _name = value.trim();
                                            });
                                          },
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return "Please enter your Name";
                                            }
                                            return null;
                                          },
                                          keyboardType: TextInputType.text,
                                          textInputAction: TextInputAction.next,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            icon: Icon(Icons.person,
                                                color: darkWhite),
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.never,
                                            enabledBorder:
                                                const UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors
                                                            .transparent)),
                                            focusedBorder:
                                                const UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors
                                                            .transparent)),
                                            hintText: 'Enter your Name',
                                            hintStyle: TextStyle(
                                              color: darkWhite,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            //-----------email-------------
                            Padding(
                              padding: const EdgeInsets.only(top: 5, right: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      'Email :',
                                      style: TextStyle(
                                        color: superDarkGreen,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.01875,
                                        fontFamily: 'popBold',
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.00625,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: shadeWhite.withOpacity(0.60),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15, right: 10),
                                      child: SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.0625,
                                        width: double.infinity,
                                        child: TextFormField(
                                          onChanged: (value) {
                                            setState(() {
                                              _email = value.trim();
                                            });
                                          },
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return "Please enter email";
                                            }
                                            return null;
                                          },
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          textInputAction: TextInputAction.next,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            icon: Icon(
                                                Icons.mail_outline_outlined,
                                                color: darkWhite),
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.never,
                                            enabledBorder:
                                                const UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors
                                                            .transparent)),
                                            focusedBorder:
                                                const UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors
                                                            .transparent)),
                                            hintText: 'Create your email',
                                            hintStyle: TextStyle(
                                              color: darkWhite,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            //-----------password-----------
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Text(
                                'Password :',
                                style: TextStyle(
                                  color: superDarkGreen,
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.01875,
                                  fontFamily: 'popBold',
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 5, right: 10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: shadeWhite.withOpacity(0.60),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          right: 8, left: 15),
                                      child: SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.0625,
                                        width: double.infinity,
                                        child: TextFormField(
                                          onChanged: (value) {
                                            setState(() {
                                              _password = value.trim();
                                            });
                                          },
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return "Please enter password";
                                            }
                                            return null;
                                          },
                                          obscureText: _isObscure,
                                          textInputAction: TextInputAction.next,
                                          decoration: InputDecoration(
                                            icon: Icon(Icons.vpn_key_rounded,
                                                color: darkWhite),
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.never,
                                            enabledBorder:
                                                const UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors
                                                            .transparent)),
                                            focusedBorder:
                                                const UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors
                                                            .transparent)),
                                            hintText: 'Create new password',
                                            hintStyle:
                                                TextStyle(color: darkWhite),
                                            suffixIcon: IconButton(
                                              color: darkWhite,
                                              icon: Icon(
                                                _isObscure
                                                    ? Icons.visibility
                                                    : Icons.visibility_off,
                                              ),
                                              onPressed: () {
                                                setState(
                                                  () {
                                                    _isObscure = !_isObscure;
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

            //----------buttons----------
            isVisible

                //------------------------Login button-----------------------
                ? Visibility(
                    visible: isVisible,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          //----------login button----------
                          Padding(
                            padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).size.height * 0.175,
                                left: 70,
                                right: 70),
                            child: InkWell(
                              onTap: () {
                                // if (formKey.currentState.validate()) {
                                //   return;
                                // } else {
                                //   print(" login data not entered");
                                // }
                                AuthenticationHelper()
                                    .signIn(email: _email, password: _password)
                                    .then((result) {
                                  if (result == null) {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const StartPage()));
                                  }
                                });
                              },
                              child: Container(
                                width: double.infinity,
                                height:
                                    MediaQuery.of(context).size.height * 0.057,
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
                                      Text(
                                        'Login with',
                                        style: TextStyle(
                                          color: primaryBlack,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.0187,
                                          fontFamily: 'popMedium',
                                          letterSpacing: 2,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Image.asset(
                                        'assets/images/gmail.png',
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.03125,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.06944,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )

                //--------------------------Sign up button---------------------
                : Visibility(
                    visible: !isVisible,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          //----------signup button----------
                          Padding(
                            padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).size.height * 0.1125,
                                left: 70,
                                right: 70),
                            child: InkWell(
                              onTap: () {
                                // if (formKey.currentState.validate()) {
                                //   return;
                                // } else {
                                //   print(" sign-up data not entered");
                                // }
                                AuthenticationHelper()
                                    .signUp(email: _email, password: _password)
                                    .then((result) {
                                  // FirebaseFirestore.instance
                                  //     .collection('UserData')
                                  //     .doc(auth.currentUser.uid)
                                  //     .set({'name': _name});
                                  if (result == null) {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const StartPage()));
                                  }
                                });
                              },
                              child: Container(
                                width: double.infinity,
                                height:
                                    MediaQuery.of(context).size.height * 0.057,
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
                                      Text(
                                        'Signup with',
                                        style: TextStyle(
                                          color: primaryBlack,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.0187,
                                          fontFamily: 'popMedium',
                                          letterSpacing: 2,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Image.asset(
                                        'assets/images/gmail.png',
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.03125,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.06944,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.025),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    //---------------------google button----------------------
                    isVisible
                        ? Visibility(
                            visible: isVisible,
                            child: const GoogleSignInButton(),
                          )
                        : Visibility(
                            visible: isVisible,
                            child: Container(),
                          ),

                    //--------------already have account / Sign Up--------------
                    isVisible
                        ? Visibility(
                            visible: isVisible,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 10, top: 15),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    isVisible = !isVisible;
                                    isVisible = isVisible;
                                  });
                                },
                                child: Text.rich(
                                  TextSpan(
                                    text: 'Don’t have account? ',
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.01625,
                                      color: Colors.blue,
                                      fontFamily: 'popLight',
                                    ),
                                    children: const <TextSpan>[
                                      TextSpan(
                                        text: 'Sign Up',
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontFamily: 'popLight',
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )

                        //---------------don't have account / Login---------------

                        : Visibility(
                            visible: !isVisible,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 10, top: 15),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    isVisible = !isVisible;
                                  });
                                },
                                child: Text.rich(
                                  TextSpan(
                                    text: 'Already have an account? ',
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.01625,
                                      color: Colors.blue,
                                      fontFamily: 'popLight',
                                    ),
                                    children: const <TextSpan>[
                                      TextSpan(
                                        text: 'Login In',
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontFamily: 'popLight',
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
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
}
