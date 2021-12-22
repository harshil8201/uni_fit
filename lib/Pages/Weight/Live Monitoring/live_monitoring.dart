import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:uni_fit/Pages/Weight/Live%20Monitoring/squat.dart';
import 'package:uni_fit/color_class.dart';
import 'package:uni_fit/main.dart';
import 'arm_raise.dart';
import 'warrior_pose.dart';

// add live monitoring
class LiveMonitoring extends StatelessWidget {
  final List<CameraDescription> cameras;

  LiveMonitoring(this.cameras);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bg.png'), fit: BoxFit.cover)),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50, right: 10, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 45,
                      width: 45,
                      child: Icon(
                        Icons.arrow_back_rounded,
                        color: superDarkGreen,
                        size: 30,
                      ),
                    ),
                  ),
                  Text(
                    'LIVE EXERCISE',
                    style: TextStyle(
                      color: superDarkGreen,
                      fontSize: 30,
                      fontFamily: 'popBold',
                      //fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    height: 45,
                    width: 45,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    InkWell(
                      onTap: () =>
                          onSelectA(context: context, modelName: 'posenet'),
                      child: liveErContainer(
                          'assets/images/arm_raise.jpg', 'Arm Raise'),
                    ),
                    InkWell(
                      onTap: () =>
                          onSelectS(context: context, modelName: 'posenet'),
                      child:
                          liveErContainer('assets/images/squat.jpg', 'Squat'),
                    ),
                    InkWell(
                      onTap: () =>
                          onSelectY(context: context, modelName: 'posenet'),
                      child: liveErContainer(
                          'assets/images/warrior_pose.jpg', 'Warrior pose'),
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

void onSelectA({BuildContext context, String modelName}) async {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => PushedPageA(
        cameras: cameras,
        title: modelName,
      ),
    ),
  );
}

void onSelectS({BuildContext context, String modelName}) async {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => PushedPageS(
        cameras: cameras,
        title: modelName,
      ),
    ),
  );
}

void onSelectY({BuildContext context, String modelName}) async {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => PushedPageY(
        cameras: cameras,
        title: modelName,
      ),
    ),
  );
}

Widget liveErContainer(String erImage, String erName) {
  return Padding(
    padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
    child: Container(
      width: 350,
      height: 280,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: shadowBlack,
            offset: const Offset(0, 0),
            blurRadius: 20.0,
          ), //BoxShadow
        ],
        color: primaryWhite,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  erImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                erName.toUpperCase(),
                style: TextStyle(
                  color: primaryGreen,
                  fontSize: 30,
                  fontFamily: 'popBold',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
