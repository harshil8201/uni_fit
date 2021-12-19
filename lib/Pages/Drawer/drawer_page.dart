import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:uni_fit/SignIn-SignUp/Google%20SignIn/google_sign_in_provider.dart';
import 'package:uni_fit/SignIn-SignUp/signIn_login_page.dart';
import 'package:uni_fit/color_class.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({Key key}) : super(key: key);

  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  final user = FirebaseAuth.instance.currentUser;
  final auth = FirebaseAuth.instance;

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
              children: [
                Stack(
                  children: [
                    user.emailVerified
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
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: primaryWhite,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: FaIcon(
                          FontAwesomeIcons.pen,
                          size: 20,
                          color: primaryGreen,
                        ),
                      ),
                    ),
                  ],
                ),
                user.emailVerified
                    ? Text(
                        user.displayName,
                        style: TextStyle(
                          fontSize: 23,
                          color: primaryWhite,
                          fontFamily: 'popBold',
                        ),
                      )
                    : Text(
                        "First Name",
                        style: TextStyle(
                          fontSize: 23,
                          color: primaryWhite,
                          fontFamily: 'popBold',
                        ),
                      ),
                user.emailVerified
                    ? Text(
                        user.email,
                        style: TextStyle(
                          fontSize: 12,
                          color: primaryWhite,
                          fontFamily: 'popLight',
                        ),
                      )
                    : Text(
                        "example@gmail.com",
                        style: TextStyle(
                          fontSize: 12,
                          color: primaryWhite,
                          fontFamily: 'popLight',
                        ),
                      ),
              ],
            ),
            Column(
              children: [
                drawerItems(FontAwesomeIcons.calculator, 'BMI calculator'),
                drawerItems(FontAwesomeIcons.fire, 'Calories burner'),
                drawerItems(FontAwesomeIcons.glassWhiskey, 'Water reminder'),
                drawerItems(FontAwesomeIcons.clock, 'Daily reminder'),
                drawerItems(FontAwesomeIcons.cog, 'Setting'),
                drawerItems(FontAwesomeIcons.infoCircle, 'About us'),
              ],
            ),
            InkWell(
              onTap: () {
                showAlertDialog(context);
              },
              child: drawerItems(Icons.logout, 'Log out'),
            ),
          ],
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text(
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
      child: Text(
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
                  MaterialPageRoute(builder: (context) => SignInLoginPage()),
                  (Route<dynamic> route) => false);
              print('------------we are sign out using gmail------------');
            }
          : () {
              auth.signOut();
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => SignInLoginPage()));
              print(
                  '-----------we are sign out using email / password----------');
            },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      title: Text(
        "Want to Logout?",
        style: TextStyle(
          color: Colors.red,
          fontFamily: 'popBold',
        ),
      ),
      content: Text(
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

  Widget drawerItems(IconData icons, String listName) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          FaIcon(
            icons,
            color: primaryWhite,
            size: 25,
          ),
          SizedBox(
            width: 15,
          ),
          Text(
            listName,
            style: TextStyle(
              fontSize: 15,
              color: primaryWhite,
              fontFamily: 'popMedium',
            ),
          ),
        ],
      ),
    );
  }
}