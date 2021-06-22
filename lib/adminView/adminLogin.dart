import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interma/adminView/adminChooser.dart';
import '../viewUser/appBarTitle.dart';

class AdminLogin extends StatefulWidget {
  @override
  _AdminLoginState createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBarTitle(
        nama: "Login Admin",
        preferredSize: Size.fromHeight(140),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(16),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Email",
                  labelText: "Masukkan Email"
                ),
              ) ,
            ),

            Container(
              margin: EdgeInsets.only(left: 16, right: 16,),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Password",
                    labelText: "Masukkan Password"
                ),
              ) ,
            ),

            InkWell(
              onTap: ()=>Get.offAll(AdminChooser()),
              child: Container(
                margin: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color(0xff61D2C4),
                ),
                height: 60,
                child: Center(
                  child: Text(
                    "LOGIN", style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),

              ),
            )
          ],
        ),
      ),
    );
  }
}
