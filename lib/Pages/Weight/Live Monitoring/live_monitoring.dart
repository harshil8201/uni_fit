import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:uni_fit/Pages/Weight/Live%20Monitoring/pushed_pageS.dart';
import 'package:uni_fit/color_class.dart';
import 'package:uni_fit/main.dart';
import 'pushed_pageA.dart';
import 'pushed_pageY.dart';


// add live monitoring
class LiveMonitoring extends StatelessWidget {
  final List<CameraDescription> cameras;

  LiveMonitoring(this.cameras);

  static const String id = 'main_screen';

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
                      onTap: () => onSelectA(context: context, modelName: 'posenet'),
                      child: liveErContainer(),
                    ),
                    InkWell(
                      onTap: () => onSelectS(context: context, modelName: 'posenet'),
                      child: liveErContainer(),
                    ),
                    InkWell(
                      onTap: () => onSelectY(context: context, modelName: 'posenet'),
                      child: liveErContainer(),
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

Widget liveErContainer() {
  return Padding(
    padding: const EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
    child: Container(
      width: 350,
      height: 350,
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
          child: Image.asset('assets/images/1.png')),
    ),
  );
}
