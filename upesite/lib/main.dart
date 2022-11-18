import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'splashScreen.dart';
import 'package:flame_splash_screen/flame_splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*const hide = true;
    if (hide == true) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    }*/
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: SplashScreen(),
    );
  }
}
