import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:my_fit_log_app/screens/dashboard/page/dashboard.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //ensuring that device orientation is always in portrait mode and never landscape
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MyApp());
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
} 

class _MyAppState extends State<MyApp> {
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final isLoggedIn = FirebaseAuth.instance.currentUser != null;
    return CupertinoApp(
      home: isLoggedIn ? Dashboard() : const OnBoardingPage();
  debugShowCheckedModeBanner: false,
    );
    // MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     title: 'MyFitLog',
    //     home: Dashboard(),
    //     // home: isLoggedIn ? Dashboard() : const OnBoardingPage(),
    // );
  }

 Future selectNotification(String? payload) async {
    showDialog(
      context: context,
      builder: (_) {
        return new AlertDialog(
          title: Text("PayLoad"),
          content: Text("Payload : $payload"),
        );
      },
    );
}
}