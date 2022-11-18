import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'Camera_Page.dart';

class CameraHome extends StatefulWidget {
  const CameraHome({Key? key}) : super(key: key);

  @override
  _CameraHomeState createState() => _CameraHomeState();
}

class _CameraHomeState extends State<CameraHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: CircleAvatar(
                radius: 30,
                backgroundColor: Color.fromARGB(255, 124, 236, 19),
                child: IconButton(
                  color: Colors.black,
                  onPressed: () async {
                    await availableCameras().then((value) => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CameraPage(
                                  cameras: value,
                                ))));
                  },
                  icon: Icon(Icons.camera_alt),
                ))),
      ),
    );
  }
}
