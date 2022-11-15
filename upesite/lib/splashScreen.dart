import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 8),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => MyLogin(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    /*const hide = true;
    if (hide == true) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    }*/
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Image.asset('assets/images/logo.gif'),
        ));
  }
}
