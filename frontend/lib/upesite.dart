import 'package:flutter/material.dart';

class upesite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/upes.jpg'),
            alignment: Alignment.topCenter,
          ),
        ),
        child: ListView(children: [
          Container(height: 175, width: 170),
          Image.asset(
            "assets/images/logo.jpg",
            width: 120,
            height: 120,
          ),
          Text(
            "For the verification , we will scan your photo to match our Database ",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 25,
            ),
          ),
          SizedBox(height: 30),
          Text(
            "Click on the Camera Icon below for the verification",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 20,
            ),
          ),
          SizedBox(height: 70),
          Center(
            child: SizedBox(
              height: 60,
              width: 240,
              child: ElevatedButton.icon(
                onPressed: () {
                  print("You pressed Camera Button");
                },
                icon: Icon(
                  Icons.camera,
                  color: Colors.black,
                ),
                label: Text(
                  " Camera ",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    primary: Colors.cyan[600]),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
