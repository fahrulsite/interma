import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:interma/login.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() {
    var _duration = const Duration(seconds: 5);
    return Timer(_duration, () async {
      Get.offAll(Login());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: Container(
          child: Stack(
            children: <Widget>[
              Positioned(
                top: -40,
                left: -50,
                child: Container(
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.height / 4,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 25),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Center(
                  child: Text(
                'Interma',
                style: TextStyle(color: Colors.white, fontSize: 37),
              )),
              Positioned(
                bottom: -150,
                right: -80,
                child: Container(
                  height: MediaQuery.of(context).size.height / 2.5,
                  width: MediaQuery.of(context).size.height / 2.5,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 25),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
