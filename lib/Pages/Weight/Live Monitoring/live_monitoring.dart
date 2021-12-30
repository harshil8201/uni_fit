import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:uni_fit/Pages/Weight/Live%20Monitoring/squat.dart';
import 'package:uni_fit/color_class.dart';
import 'arm_raise.dart';
import 'warrior_pose.dart';

class LiveMonitoring extends StatefulWidget {
  final List<CameraDescription> cameras;

  LiveMonitoring(this.cameras);

  @override
  State<LiveMonitoring> createState() => _LiveMonitoringState();
}

class _LiveMonitoringState extends State<LiveMonitoring> {
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
                    'LIVE EXERCISE',
                    style: TextStyle(
                      color: superDarkGreen,
                      fontSize: MediaQuery.of(context).size.height * 0.0375,
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
              padding: const EdgeInsets.only(top: 100),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    InkWell(
                      onTap: () =>
                          onSelectA(context: context, modelName: 'posenet'),
                      child: liveErContainer(
                          erImage: 'assets/images/arm_raise.jpg',
                          erName: 'Arm Raise',
                          context: context),
                    ),
                    InkWell(
                      onTap: () =>
                          onSelectS(context: context, modelName: 'posenet'),
                      child: liveErContainer(
                          erImage: 'assets/images/squat.jpg',
                          erName: 'Squat',
                          context: context),
                    ),
                    InkWell(
                      onTap: () =>
                          onSelectY(context: context, modelName: 'posenet'),
                      child: liveErContainer(
                          erImage: 'assets/images/warrior_pose.jpg',
                          erName: 'Warrior pose',
                          context: context),
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

  void onSelectA({BuildContext context, String modelName}) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PushedPageA(
          cameras: widget.cameras,
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
          cameras: widget.cameras,
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
          cameras: widget.cameras,
          title: modelName,
        ),
      ),
    );
  }

  Widget liveErContainer(
      {BuildContext context, String erImage, String erName}) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.375,
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
                    height: MediaQuery.of(context).size.height * 0.2625,
                    width: double.infinity,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                  erName.toUpperCase(),
                  style: TextStyle(
                    color: primaryGreen,
                    fontSize: MediaQuery.of(context).size.height * 0.0375,
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
}
