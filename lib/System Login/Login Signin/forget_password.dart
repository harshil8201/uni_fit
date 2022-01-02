import 'package:flutter/material.dart';
import 'package:uni_fit/Class/color_class.dart';
import 'package:uni_fit/System%20Login/Login%20Signin/authentication.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({Key key}) : super(key: key);

  @override
  _ForgetPasswordPageState createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  String _email;

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
                    'Reset Password',
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

            Padding(
              padding: const EdgeInsets.only(top: 120, right: 20, left: 20),
              child: Text(
                '1) Please enter the correct email below.\n\n2) It will sent a link to you email address for reset you password.',
                style: TextStyle(
                  color: primaryBlack,
                  fontSize: MediaQuery.of(context).size.height * 0.01875,
                  fontFamily: 'popMedium',
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),

            //-----------email-------------
            Padding(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.375),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 170, right: 20, left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Text(
                            'Email :',
                            style: TextStyle(
                              color: superDarkGreen,
                              fontSize: MediaQuery.of(context).size.height * 0.0187,
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
                                    _email = value.trim();
                                  });
                                },
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Please enter email";
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                obscureText: false,
                                decoration: InputDecoration(
                                  icon: Icon(Icons.mail_outline_outlined,
                                      color: darkWhite),
                                  floatingLabelBehavior: FloatingLabelBehavior.never,
                                  enabledBorder: const UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.transparent)),
                                  focusedBorder: const UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.transparent)),
                                  hintText: 'Enter your email',
                                  hintStyle: TextStyle(color: darkWhite),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Align(
                            alignment: Alignment.center,
                            child: ElevatedButton(
                              onPressed: () {
                                AuthenticationHelper().resetPassword(email: _email);
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                'Sent link',
                                style: TextStyle(
                                  color: primaryBlack,
                                  fontSize: MediaQuery.of(context).size.height * 0.01875,
                                  fontFamily: 'popMedium',
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
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
