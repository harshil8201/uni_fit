// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uni_fit/Constants/color.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final user = FirebaseAuth.instance.currentUser;

  String _password;

  void _changePassword(String password) async {
    //Create an instance of the current user.
    User user = FirebaseAuth.instance.currentUser;

    //Pass in the password to updatePassword.
    user.updatePassword(password).then((_) {
      print("Successfully changed password");
    }).catchError((error) {
      print("Password can't be changed" + error.toString());
      //This might happen, when the wrong password is in, the user isn't found, or if the user hasn't logged in recently.
    });
  }

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
            //-------appbar------
            Padding(
              padding: const EdgeInsets.only(top: 50, right: 20, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.0563,
                      width: MediaQuery.of(context).size.width * 0.125,
                      child: Icon(
                        Icons.arrow_back_rounded,
                        color: superDarkGreen,
                        size: MediaQuery.of(context).size.height * 0.0375,
                      ),
                    ),
                  ),
                  Text(
                    'Settings',
                    style: TextStyle(
                      color: superDarkGreen,
                      fontSize: MediaQuery.of(context).size.height * 0.03125,
                      fontFamily: 'popBold',
                      //fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.0563,
                    width: MediaQuery.of(context).size.width * 0.125,
                  ),
                ],
              ),
            ),

            //-----------email-------------
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.15,
                  right: 20,
                  left: 20),
              child: Column(
                children: [
                  user.emailVerified
                      ? ClipOval(
                          child: Image.network(
                            user.photoURL,
                            fit: BoxFit.cover,
                            height: MediaQuery.of(context).size.height * 0.1875,
                            width: MediaQuery.of(context).size.height * 0.1875,
                          ),
                        )
                      : ClipOval(
                          child: Image.asset(
                            'assets/images/user.jpg',
                            fit: BoxFit.cover,
                            height: MediaQuery.of(context).size.height * 0.1875,
                            width: MediaQuery.of(context).size.height * 0.1875,
                          ),
                        ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        'Name:',
                        style: TextStyle(
                          color: superDarkGreen,
                          fontSize: MediaQuery.of(context).size.height * 0.0187,
                          fontFamily: 'popBold',
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      user.emailVerified
                          ? Text(
                              user.displayName,
                              style: TextStyle(
                                color: primaryBlack,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.0187,
                                fontFamily: 'popMedium',
                              ),
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
                                return Text(
                                  document['name'],
                                  style: TextStyle(
                                    color: primaryBlack,
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.0187,
                                    fontFamily: 'popMedium',
                                  ),
                                );
                              },
                            ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        'Email:',
                        style: TextStyle(
                          color: superDarkGreen,
                          fontSize: MediaQuery.of(context).size.height * 0.0187,
                          fontFamily: 'popBold',
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      user.emailVerified
                          ? Text(
                              user.email,
                              style: TextStyle(
                                color: primaryBlack,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.0187,
                                fontFamily: 'popMedium',
                              ),
                            )
                          : Text(
                              user.email,
                              style: TextStyle(
                                color: primaryBlack,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.0187,
                                fontFamily: 'popMedium',
                              ),
                            ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          'Password :',
                          style: TextStyle(
                            color: superDarkGreen,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.0187,
                            fontFamily: 'popBold',
                          ),
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.00625),
                      Container(
                        decoration: BoxDecoration(
                          color: shadeWhite.withOpacity(0.60),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15, right: 10),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.0625,
                            width: double.infinity,
                            child: TextFormField(
                              onChanged: (value) {
                                setState(() {
                                  _password = value.trim();
                                });
                              },
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Please enter new password";
                                }
                                return null;
                              },
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              obscureText: false,
                              decoration: InputDecoration(
                                icon: Icon(Icons.mail_outline_outlined,
                                    color: darkWhite),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                enabledBorder: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent)),
                                focusedBorder: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent)),
                                hintText: 'Enter your new password',
                                hintStyle: TextStyle(color: darkWhite),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                          color: shadeWhite.withOpacity(0.60),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15, right: 10),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.0625,
                            width: double.infinity,
                            child: TextFormField(
                              onChanged: (value) {
                                setState(() {
                                  _password = value.trim();
                                });
                              },
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "re-enter new password";
                                }
                                return null;
                              },
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              obscureText: false,
                              decoration: InputDecoration(
                                icon: Icon(Icons.mail_outline_outlined,
                                    color: darkWhite),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                enabledBorder: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent)),
                                focusedBorder: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent)),
                                hintText: 'Re-enter new password',
                                hintStyle: TextStyle(color: darkWhite),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Align(
                          alignment: Alignment.center,
                          child: ElevatedButton(
                            onPressed: () {
                              _changePassword(_password);
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'save',
                              style: TextStyle(
                                color: primaryBlack,
                                fontSize: MediaQuery.of(context).size.height *
                                    0.01875,
                                fontFamily: 'popMedium',
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
