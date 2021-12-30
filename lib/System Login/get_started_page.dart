import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:uni_fit/color_class.dart';

import 'Google SignIn/google_page_controller.dart';

class GetStartedPage extends StatefulWidget {
  const GetStartedPage({Key key}) : super(key: key);

  @override
  _GetStartedPageState createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bg.png'), fit: BoxFit.cover)),
        child: Stack(
          children: [
            //----------image-------------
            Padding(
              padding: const EdgeInsets.only(top: 70, right: 20, left: 20),
              child: Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  //color: Colors.blue,
                  height: MediaQuery.of(context).size.height*0.46,
                  width: double.infinity,
                  child: Image.asset(
                    'assets/images/1.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),

            //---------text------------
            Padding(
              padding: const EdgeInsets.only(top: 450),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Uni Fit',
                      style: TextStyle(
                        color: primaryGreen,
                        fontSize: MediaQuery.of(context).size.height*0.05,
                        fontFamily: 'popBold',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'What do you know about the\n physical fitness & diet ?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: primaryGreen,
                        fontSize: MediaQuery.of(context).size.height* 0.021,
                        fontFamily: 'popLight',
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //----------get started---------
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, bottom: 80),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.rightToLeftWithFade,
                          child: const GooglePageController()),
                    );
                    print("----------- height of device : ${MediaQuery.of(context).size.height} -----------");
                    print("----------- width of device : ${MediaQuery.of(context).size.width} -----------");
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: primaryWhite,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: shadowBlack,
                          offset: const Offset(0.0, 0.0),
                          blurRadius: 20.0,
                        ), //BoxShadow
                      ],
                    ),
                    child: Center(
                      child: Text(
                        'Get Started',
                        style: TextStyle(
                          color: primaryGreen,
                          fontSize: MediaQuery.of(context).size.height*0.02,
                          fontFamily: 'popBold',
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
    );
  }
}
