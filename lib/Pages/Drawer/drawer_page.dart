import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:uni_fit/Pages/Drawer/BMI%20Calculator/bmi_page.dart';
import 'package:uni_fit/System%20Login/Google%20SignIn/google_sign_in_provider.dart';
import 'package:uni_fit/System%20Login/Login%20Signin/authentication.dart';
import 'package:uni_fit/System%20Login/Login%20Signin/signIn_login_page.dart';
import 'package:uni_fit/color_class.dart';

class DrawerPage extends StatefulWidget {

  const DrawerPage({Key key}) : super(key: key);

  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  final user = FirebaseAuth.instance.currentUser;
  // final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
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
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                user.emailVerified
                    ? ClipOval(
                        child: Image.network(
                          user.photoURL,
                          fit: BoxFit.cover,
                          height: MediaQuery.of(context).size.height * 0.15,
                          width: MediaQuery.of(context).size.height * 0.15,
                        ),
                      )
                    : ClipOval(
                        child: Image.asset(
                          'assets/images/user.jpg',
                          fit: BoxFit.cover,
                          height: MediaQuery.of(context).size.height * 0.15,
                          width: MediaQuery.of(context).size.height * 0.15,
                        ),
                      ),
                const SizedBox(height: 5,),
                user.emailVerified
                    ? Text(
                        user.displayName,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.0287,
                          color: primaryWhite,
                          fontFamily: 'popBold',
                        ),
                      )
                    : Text(
                        "First Name",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.0287,
                          color: primaryWhite,
                          fontFamily: 'popBold',
                        ),
                      ),
                user.emailVerified
                    ? Text(
                        user.email,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.015,
                          color: primaryWhite,
                          fontFamily: 'popLight',
                        ),
                      )
                    : Text(
                        "example@gmail.com",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.015,
                          color: primaryWhite,
                          fontFamily: 'popLight',
                        ),
                      ),
              ],
            ),
            Column(
              children: [
                drawerItems(FontAwesomeIcons.calculator, 'BMI calculator',
                    const BMIPage()),
                // drawerItems(FontAwesomeIcons.fire, 'Calories burner',null),
                drawerItems(
                    FontAwesomeIcons.glassWhiskey, 'Water reminder', null),
                drawerItems(FontAwesomeIcons.clock, 'Daily reminder', null),
                // drawerItems(FontAwesomeIcons.cog, 'Setting',null),
                drawerItems(FontAwesomeIcons.infoCircle, 'About us', null),
              ],
            ),
            InkWell(
              onTap: () {
                showAlertDialog(context);
              },
              child: Row(
                children: [
                  FaIcon(
                    Icons.logout,
                    color: primaryWhite,
                    size: MediaQuery.of(context).size.height * 0.0313,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.042,
                  ),
                  Text(
                    'Logout',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.018,
                      color: primaryWhite,
                      fontFamily: 'popMedium',
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
              final provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.logOut();
              Navigator.pop(context);
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SignInLoginPage()),
                  (Route<dynamic> route) => false);
              print('------------we are sign out using gmail------------');
            }
          : () {
              AuthenticationHelper().signOut();
              Navigator.pop(context);
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SignInLoginPage()),
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.leftToRightWithFade, child: routeName),
          );
        },
        child: Row(
          children: [
            FaIcon(
              icons,
              color: primaryWhite,
              size: MediaQuery.of(context).size.height * 0.0313,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.042,
            ),
            Text(
              listName,
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.019,
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
