import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:uni_fit/Pages/Weight/Live%20Monitoring/live_monitoring.dart';
import 'route_class.dart';
import 'SignIn-SignUp/Google SignIn/google_sign_in_provider.dart';
// ignore_for_file: prefer_const_constructors

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

List<CameraDescription> cameras;

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    cameras = await availableCameras();
  } on CameraException catch (e) {
    print('Error: $e.code\nError Message: $e.message');
  }
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitDown,
        DeviceOrientation.portraitUp,
      ],
    );
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
        navigatorKey: navigatorKey,
        title: 'Uni Fit',
        debugShowCheckedModeBanner: false,
        //home: MainScreen(cameras),
        initialRoute: '/',
        routes: routeClass,
      ),
    );
  }
}
