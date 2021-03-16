import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:interma/dashboard.dart';
import 'package:interma/register.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _key = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: height * 0.1,
            ),
            Text(
              "Interma",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: height * 0.1,
            ),
            Expanded(
              child: Container(
                  width: width,
                  height: 500,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25))),
                  child: Form(
                    key: _key,
                    child: ListView(
                      padding: EdgeInsets.all(32),
                      children: <Widget>[
                        Text(
                          'Masuk',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        TextFormField(
                          validator: (e) {
                            if (e.isEmpty) {
                              return 'Email tidak boleh kosong';
                            }
                            ;
                          },
                          controller: _emailController,
                          decoration: InputDecoration(labelText: 'Username'),
                        ),
                        TextFormField(
                          validator: (e) {
                            if (e.isEmpty) {
                              return 'Password tidak boleh kosong';
                            }
                            ;
                          },
                          obscureText: true,
                          controller: _passwordController,
                          decoration: InputDecoration(labelText: 'Kata Sandi'),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Material(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(20),
                          child: MaterialButton(
                            onPressed: () => Get.to(Dashboard()),
                            child: Text(
                              'Masuk',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Material(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                style: BorderStyle.solid,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(25)),
                          child: MaterialButton(
                            onPressed: () => Get.to(Register()),
                            child: Text(
                              'Belum punya akun?',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
