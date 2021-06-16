import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:interma/chooser.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() {
    var _duration = const Duration(seconds: 5);
    return Timer(_duration, () async {
      Get.offAll(Chooser());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: Stack(
            children: <Widget>[

              Center(child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Image.asset('assets/image/logo.png', height: MediaQuery.of(context).size.height * 0.3,),
                  Text("Interma", style: TextStyle(color: Color(0xff509B92), fontSize: 40, fontWeight: FontWeight.w600),


                  )],
              )),

            ],
          ),
        ));
  }
}
