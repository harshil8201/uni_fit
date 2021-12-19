import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uni_fit/Pages/start_page.dart';
import 'package:uni_fit/color_class.dart';
import 'Google SignIn/google_signIn_button.dart';

class SignInLoginPage extends StatefulWidget {
  const SignInLoginPage({Key key}) : super(key: key);

  @override
  _SignInLoginPageState createState() => _SignInLoginPageState();
}

class _SignInLoginPageState extends State<SignInLoginPage> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final _newPasswordController = TextEditingController();

  String firstname = "First";
  String _email, _password;
  String lastname = "Name";

  final auth = FirebaseAuth.instance;
  bool isVisible = true;
  bool _isObscure = true;

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
                fit: BoxFit.cover
            )
        ),
        child: Stack(
          children: [
            //---------input field-------
            isVisible
                //------Login----------
                ? Visibility(
                    visible: isVisible,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Form(
                        key: _formkey,
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
                                    child: Container(
                                      height: 250,
                                      width: 250,
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
                                        fontSize: 40,
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
                                        fontSize: 15,
                                        fontFamily: 'popBold',
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: shadeWhite.withOpacity(0.60),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15, right: 10),
                                      child: Container(
                                        height: 50,
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
                                            enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.transparent)),
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.transparent)),
                                            labelText: 'Enter your email',
                                            labelStyle:
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
                                        fontSize: 15,
                                        fontFamily: 'popBold',
                                      ),
                                    ),
                                  ),
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
                                        child: Container(
                                          height: 50,
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
                                            textInputAction: TextInputAction.done,
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
                                              labelText: 'Enter password',
                                              labelStyle:
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
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                //-------Sign up---------
                : Visibility(
                    visible: !isVisible,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Form(
                        key: _formkey,
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
                                    child: Container(
                                      //color: Colors.blue,
                                      height: 250,
                                      width: 250,
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
                                        fontSize: 40,
                                        fontFamily: 'popBold',
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            //---------- name ------------
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Name :',
                                  style: TextStyle(
                                    color: superDarkGreen,
                                    fontSize: 15,
                                    fontFamily: 'popBold',
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(right: 10, top: 5),
                                  child: Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: shadeWhite.withOpacity(0.60),
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 15, right: 10),
                                          child: Container(
                                            height: 50,
                                            width: double.infinity,
                                            child: TextFormField(
                                              onChanged: (value) {
                                                firstname = value;
                                              },
                                              validator: (value) {
                                                if (value.isEmpty) {
                                                  return "Please enter your name";
                                                }
                                                return null;
                                              },
                                              obscureText: false,
                                              textInputAction:
                                                  TextInputAction.next,
                                              decoration: InputDecoration(
                                                floatingLabelBehavior:
                                                    FloatingLabelBehavior.never,
                                                icon: Icon(
                                                    Icons.account_circle_outlined,
                                                    color: darkWhite),
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .transparent)),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .transparent)),
                                                labelText: 'First name',
                                                labelStyle:
                                                    TextStyle(color: darkWhite),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
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
                                        fontSize: 15,
                                        fontFamily: 'popBold',
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: shadeWhite.withOpacity(0.60),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15, right: 10),
                                      child: Container(
                                        height: 50,
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
                                            enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.transparent)),
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.transparent)),
                                            labelText: 'Create your email',
                                            labelStyle:
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
                                        child: Container(
                                          height: 50,
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
                                            controller: _newPasswordController,
                                            obscureText: _isObscure,
                                            textInputAction: TextInputAction.next,
                                            decoration: InputDecoration(
                                              icon: Icon(Icons.vpn_key_rounded,
                                                  color: darkWhite),
                                              floatingLabelBehavior:
                                                  FloatingLabelBehavior.never,
                                              enabledBorder: UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.transparent)),
                                              focusedBorder: UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.transparent)),
                                              labelText: 'Create new password',
                                              labelStyle:
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
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

            //----------buttons----------
            isVisible
                //---------Login button----------
                ? Visibility(
                    visible: isVisible,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          //----------login button----------
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 130, left: 70, right: 70),
                            child: InkWell(
                              onTap: () {
                                if (_formkey.currentState.validate()) {
                                  return;
                                } else {
                                  print(" login data not entered");
                                }
                                auth
                                    .signInWithEmailAndPassword(
                                        email: _email, password: _password)
                                    .then((_) {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) => StartPage()));
                                });
                              },
                              child: Container(
                                height: 50,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: primaryWhite,
                                  borderRadius: BorderRadius.circular(30),
                                  border:
                                      Border.all(color: primaryGreen, width: 4),
                                  boxShadow: [
                                    BoxShadow(
                                      color: shadowBlack,
                                      offset: const Offset(0, 0),
                                      blurRadius: 10.0,
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Text(
                                    'LOGIN',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: primaryGreen,
                                      fontSize: 20,
                                      fontFamily: 'popMedium',
                                      letterSpacing: 3,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                //---------Sign up button----------
                : Visibility(
                    visible: !isVisible,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          //----------signup button----------
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 130, left: 70, right: 70),
                            child: InkWell(
                              onTap: () {
                                if (_formkey.currentState.validate()) {
                                  return;
                                } else {
                                  print(" sign-up data not entered");
                                }
                                auth
                                    .createUserWithEmailAndPassword(
                                        email: _email, password: _password)
                                    .then((_) {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) => StartPage()));
                                });
                              },
                              child: Container(
                                height: 50,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: primaryWhite,
                                  borderRadius: BorderRadius.circular(30),
                                  border:
                                      Border.all(color: primaryGreen, width: 4),
                                  boxShadow: [
                                    BoxShadow(
                                      color: shadowBlack,
                                      offset: const Offset(0, 0),
                                      blurRadius: 10.0,
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Text(
                                    'SIGN UP',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: primaryGreen,
                                      fontSize: 20,
                                      fontFamily: 'popMedium',
                                      letterSpacing: 3,
                                    ),
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
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      //----------google----------
                      GoogleSignInButton(),

                      isVisible
                          //----------already have account / Sign Up--------
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
                                        fontSize: 13,
                                        color: Colors.blue,
                                        fontFamily: 'popLight',
                                      ),
                                      children: <TextSpan>[
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
                          //----------don't have account / Login----------
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
                                        fontSize: 13,
                                        color: Colors.blue,
                                        fontFamily: 'popLight',
                                      ),
                                      children: <TextSpan>[
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
            ),
          ],
        ),
      ),
    );
  }
}
