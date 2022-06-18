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

  // @override
  // void initState() {
  //   super.initState();
  //
  //   _checkVersion();
  // }
  //
  // void _checkVersion() async {
  //   final newVersion = NewVersion(
  //     androidId: "com.unionsoftwareit.uni_fit",
  //     iOSId: "com.unionsoftwareit.uni_fit",
  //   );
  //   final status = await newVersion.getVersionStatus();
  //   newVersion.showUpdateDialog(
  //     context: context,
  //     versionStatus: status,
  //     dialogTitle: "UPDATE AVAILABLE",
  //     dismissButtonText: "No",
  //     dialogText: "Please update the app from " + "${status.localVersion}" + " to " + "${status.storeVersion}",
  //     dismissAction: () {
  //       SystemNavigator.pop();
  //     },
  //     updateButtonText: "Update",
  //   );
  //   print("DEVICE : " + status.localVersion);
  //   print("STORE : " + status.storeVersion);
  // }

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
    return Scaffold(
      extendBody: true,
      backgroundColor: primaryGreen,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.081,
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
                    ? Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.11,
                        decoration: BoxDecoration(
                            color: shadeWhite,
                            borderRadius: BorderRadius.circular(10)),
                        child: IconButton(
                          splashColor: Colors.transparent,
                          icon: FaIcon(
                            FontAwesomeIcons.home,
                            color: primaryGreen,
                            size: MediaQuery.of(context).size.height * 0.023,
                          ),
                          onPressed: () {
                            setBottomBarIndex(0);
                          },
                        ),
                      )
                    : IconButton(
                        splashColor: Colors.transparent,
                        icon: FaIcon(
                          FontAwesomeIcons.home,
                          color: primaryGreen,
                          size: MediaQuery.of(context).size.height * 0.023,
                        ),
                        onPressed: () {
                          setBottomBarIndex(0);
                        },
                      ),

                //-------Progression--------
                currentIndex == 1
                    ? Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.11,
                        decoration: BoxDecoration(
                            color: shadeWhite,
                            borderRadius: BorderRadius.circular(10)),
                        child: IconButton(
                          splashColor: Colors.transparent,
                          icon: FaIcon(
                            FontAwesomeIcons.chartLine,
                            color: primaryGreen,
                            size: MediaQuery.of(context).size.height * 0.023,
                          ),
                          onPressed: () {
                            setBottomBarIndex(1);
                          },
                        ),
                      )
                    : IconButton(
                        splashColor: Colors.transparent,
                        icon: FaIcon(
                          FontAwesomeIcons.chartLine,
                          color: primaryGreen,
                          size: MediaQuery.of(context).size.height * 0.023,
                        ),
                        onPressed: () {
                          setBottomBarIndex(1);
                        },
                      ),

                //-------WeightPage--------
                currentIndex == 2
                    ? Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.11,
                        decoration: BoxDecoration(
                            color: shadeWhite,
                            borderRadius: BorderRadius.circular(10)),
                        child: IconButton(
                          splashColor: Colors.transparent,
                          icon: FaIcon(
                            FontAwesomeIcons.dumbbell,
                            color: primaryGreen,
                            size: MediaQuery.of(context).size.height * 0.023,
                          ),
                          onPressed: () {
                            setBottomBarIndex(2);
                          },
                        ),
                      )
                    : IconButton(
                        splashColor: Colors.transparent,
                        icon: FaIcon(
                          FontAwesomeIcons.dumbbell,
                          color: primaryGreen,
                          size: MediaQuery.of(context).size.height * 0.023,
                        ),
                        onPressed: () {
                          setBottomBarIndex(2);
                        },
                      ),

                //-------DietPage--------
                currentIndex == 3
                    ? Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.11,
                        decoration: BoxDecoration(
                            color: shadeWhite,
                            borderRadius: BorderRadius.circular(10)),
                        child: IconButton(
                          splashColor: Colors.transparent,
                          icon: FaIcon(
                            FontAwesomeIcons.utensilSpoon,
                            color: primaryGreen,
                            size: MediaQuery.of(context).size.height * 0.023,
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
                          size: MediaQuery.of(context).size.height * 0.023,
                        ),
                        onPressed: () {
                          setBottomBarIndex(3);
                        },
                      ),
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
}
