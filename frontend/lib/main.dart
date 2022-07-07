import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:upesite_or_not/upesite.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MainPage(),
  ));
}

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isloading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/campus.jpeg'),
            alignment: Alignment.topCenter,
          ),
        ),
        child: ListView(
          children: [
            Container(height: 200, width: 100),
            Image.asset(
              "assets/images/logo.jpg",
              width: 120,
              height: 120,
            ),
            Text(
              "Welcome",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 50,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "If you are an UPES Student , then click below to verify yourself : ",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 23,
              ),
            ),
            SizedBox(
              height: 120,
            ),
            Center(
              child: SizedBox(
                height: 60,
                width: 250,
                child: ElevatedButton.icon(
                  onPressed: () async{
                    
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (context) => upesite()));
                  },
                  icon: Icon(
                    Icons.school,
                    color: Colors.black,
                  ),
                  label:Text(
                          " UPESITE ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    onPrimary: Colors.pink,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
