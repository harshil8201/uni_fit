// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:new_version/new_version.dart';
import 'package:uni_fit/Constants/color.dart';
import 'Diet/diet_page.dart';
import 'Drawer/drawer_page.dart';
import 'Home/home_page.dart';
import 'Progress/progress_page.dart';
import 'Workout/workout_page.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  int currentIndex = 0;

  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  // Number of tabs
  final tabs = [
    const HomePage(),
    const ProgressPage(),
    const WorkoutPage(),
    const DietPage(),
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBody: true,
      backgroundColor: primaryGreen,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: Container(
          height: height * 0.081,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: shadowBlack,
                offset: const Offset(0.0, 0.10),
                blurRadius: 20.0,
              ), //BoxShadow
            ],
            color: bottomNavWhite,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //-------HomePage--------
                currentIndex == 0
                    ? showContainer(0, FontAwesomeIcons.home)
                    : iconContainer(0, FontAwesomeIcons.home),

                //-------Progression--------
                currentIndex == 1
                    ? showContainer(1, FontAwesomeIcons.chartLine)
                    : iconContainer(1, FontAwesomeIcons.chartLine),

                //-------WeightPage--------
                currentIndex == 2
                    ? showContainer(2, FontAwesomeIcons.dumbbell)
                    : iconContainer(2, FontAwesomeIcons.dumbbell),

                //-------DietPage--------
                currentIndex == 3
                    ? showContainer(3, FontAwesomeIcons.utensilSpoon)
                    : iconContainer(3, FontAwesomeIcons.utensilSpoon),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          const DrawerPage(),
          tabs[currentIndex],
        ],
      ),
    );
  }

  Widget showContainer(int index, var iconData) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.05,
      width: width * 0.11,
      decoration: BoxDecoration(
          color: shadeWhite, borderRadius: BorderRadius.circular(10)),
      child: IconButton(
        splashColor: Colors.transparent,
        icon: FaIcon(
          iconData,
          color: primaryGreen,
          size: height * 0.0275,
        ),
        onPressed: () {
          setBottomBarIndex(index);
        },
      ),
    );
  }

  Widget iconContainer(int index, var iconData) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return IconButton(
      splashColor: Colors.transparent,
      icon: FaIcon(
        iconData,
        color: Colors.grey[400],
        size: height * 0.0275,
      ),
      onPressed: () {
        setBottomBarIndex(index);
      },
    );
  }
}
