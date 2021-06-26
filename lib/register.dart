import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _key = new GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 4,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: -50,
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
                  Positioned(
                    child: Container(
                      margin: EdgeInsets.only(top: 70),
                      child: Center(
                        child: Text(
                          'Interma',
                          style: TextStyle(fontSize: 36, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25)),
                ),
                child: Form(
                  key: _key,
                  child: ListView(
                    padding: EdgeInsets.all(32),
                    children: <Widget>[
                      Text(
                        'Daftar',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      TextFormField(
                        validator: (e) {
                          if (e.isEmpty) {
                            return 'Nama tidak boleh kosong';
                          }
                          ;
                        },
                        controller: _nameController,
                        decoration: InputDecoration(labelText: 'Nama'),
                      ),
                      TextFormField(
                        validator: (e) {
                          if (e.isEmpty) {
                            return 'Email tidak boleh kosong';
                          }
                          ;
                        },
                        controller: _emailController,
                        decoration: InputDecoration(labelText: 'Email'),
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
                      TextFormField(
                        validator: (e) {
                          if (e.isEmpty) {
                            return 'Password tidak boleh kosong';
                          }
                          ;
                        },
                        obscureText: true,
                        controller: _confirmPasswordController,
                        decoration:
                            InputDecoration(labelText: 'Konfirmasi Kata Sandi'),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Material(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20),
                        child: MaterialButton(
                          onPressed: null,
                          child: Text(
                            'Daftar',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Text(
                        'Coba dengan social media',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.blue),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // InkWell(
                      //   onTap: null,
                      //   child: Image.asset(
                      //     'assets/image/imgGoogle.png',
                      //     height: 45,
                      //   ),
                      // ),
                      SizedBox(
                        height: 24,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
