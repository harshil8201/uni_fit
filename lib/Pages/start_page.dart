import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uni_fit/color_class.dart';
import 'Diet/diet_page.dart';
import 'Drawer/drawer_page.dart';
import 'Home/home_page.dart';
import 'Progress/progress_page.dart';
import 'Running/running_page.dart';
import 'Weight/weight_page.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  int currentIndex = 1;

  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  // Number of tabs
  final tabs = [
    RunningPage(),
    WeightPage(),
    HomePage(),
    DietPage(),
    ProgressPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: primaryGreen,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: Container(
          height: 65,
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
                //-------Running--------
                currentIndex == 0
                    ? Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: shadeWhite,
                            borderRadius: BorderRadius.circular(10)),
                        child: IconButton(
                          splashColor: Colors.transparent,
                          icon: FaIcon(
                            FontAwesomeIcons.mapMarkedAlt,
                            color: primaryGreen,
                            size: 19,
                          ),
                          onPressed: () {
                            setBottomBarIndex(0);
                          },
                        ),
                      )
                    : IconButton(
                        splashColor: Colors.transparent,
                        icon: FaIcon(
                          FontAwesomeIcons.mapMarkedAlt,
                          color: primaryGreen,
                          size: 19,
                        ),
                        onPressed: () {
                          setBottomBarIndex(0);
                        },
                      ),

                //-------WeightPage--------
                currentIndex == 1
                    ? Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: shadeWhite,
                            borderRadius: BorderRadius.circular(10)),
                        child: IconButton(
                          splashColor: Colors.transparent,
                          icon: FaIcon(
                            FontAwesomeIcons.dumbbell,
                            color: primaryGreen,
                            size: 19,
                          ),
                          onPressed: () {
                            setBottomBarIndex(1);
                          },
                        ),
                      )
                    : IconButton(
                        splashColor: Colors.transparent,
                        icon: FaIcon(
                          FontAwesomeIcons.dumbbell,
                          color: primaryGreen,
                          size: 19,
                        ),
                        onPressed: () {
                          setBottomBarIndex(1);
                        },
                      ),

                //-------HomePage--------
                currentIndex == 2
                    ? Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: shadeWhite,
                            borderRadius: BorderRadius.circular(10)),
                        child: IconButton(
                          splashColor: Colors.transparent,
                          icon: FaIcon(
                            FontAwesomeIcons.home,
                            color: primaryGreen,
                            size: 19,
                          ),
                          onPressed: () {
                            setBottomBarIndex(2);
                          },
                        ),
                      )
                    : IconButton(
                        splashColor: Colors.transparent,
                        icon: FaIcon(
                          FontAwesomeIcons.home,
                          color: primaryGreen,
                          size: 19,
                        ),
                        onPressed: () {
                          setBottomBarIndex(2);
                        },
                      ),

                //-------DietPage--------
                currentIndex == 3
                    ? Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: shadeWhite,
                            borderRadius: BorderRadius.circular(10)),
                        child: IconButton(
                          splashColor: Colors.transparent,
                          icon: FaIcon(
                            FontAwesomeIcons.utensilSpoon,
                            color: primaryGreen,
                            size: 20,
                          ),
                          onPressed: () {
                            setBottomBarIndex(3);
                          },
                        ),
                      )
                    : IconButton(
                        splashColor: Colors.transparent,
                        icon: FaIcon(
                          FontAwesomeIcons.utensilSpoon,
                          color: primaryGreen,
                          size: 20,
                        ),
                        onPressed: () {
                          setBottomBarIndex(3);
                        },
                      ),

                //-------Progression--------
                currentIndex == 4
                    ? Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: shadeWhite,
                            borderRadius: BorderRadius.circular(10)),
                        child: IconButton(
                          splashColor: Colors.transparent,
                          icon: FaIcon(
                            FontAwesomeIcons.chartLine,
                            color: primaryGreen,
                            size: 20,
                          ),
                          onPressed: () {
                            setBottomBarIndex(4);
                          },
                        ),
                      )
                    : IconButton(
                        splashColor: Colors.transparent,
                        icon: FaIcon(
                          FontAwesomeIcons.chartLine,
                          color: primaryGreen,
                          size: 20,
                        ),
                        onPressed: () {
                          setBottomBarIndex(4);
                        },
                      ),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          DrawerPage(),
          tabs[currentIndex],
        ],
      ),
    );
  }
}