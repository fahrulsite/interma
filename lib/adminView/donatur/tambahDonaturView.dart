import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interma/service/apiService.dart';
import 'package:interma/viewUser/appBarTitle.dart';
import 'package:toast/toast.dart';
class TambahDonaturView extends StatefulWidget {
  @override
  _TambahDonaturViewState createState() => _TambahDonaturViewState();
}

class _TambahDonaturViewState extends State<TambahDonaturView> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    TextEditingController nama = new TextEditingController();
    TextEditingController alamat = new TextEditingController();
    TextEditingController kontak = new TextEditingController();

    return Scaffold(
        appBar: AppBarTitle(
          nama: "Tambah Donatur",
          preferredSize: Size.fromHeight(140),
        ),
        body: InkWell(
          onTap: null,
          child: Container(
            margin: EdgeInsets.all(16),
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Nama",
                        labelText: "Masukkan Nama"
                    ),
                    validator: (e) {
                      if (e.isEmpty) {
                        return 'Nama tidak boleh kosong';
                      }
                      ;
                    },
                    controller: nama,
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Alamat",
                        labelText: "Masukkan Alamat"
                    ),
                    validator: (e) {
                      if (e.isEmpty) {
                        return 'Alamat tidak boleh kosong';
                      }
                      ;
                    },
                    controller: alamat,
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Kontak",
                        labelText: "Masukkan Kontak"
                    ),
                    validator: (e) {
                      if (e.isEmpty) {
                        return 'Kontak tidak boleh kosong';
                      }
                      ;
                    },
                    controller: kontak,
                  ),

                  InkWell(
                    onTap: ()=>ApiService.createDonatur(nama: nama.text, alamat: alamat.text, kontak: kontak.text).then((value) => {
                      Toast.show("Berhasil", context, duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM)
                    }).whenComplete(() => Get.back()),
                    child: Container(
                      margin: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color(0xff61D2C4),
                      ),
                      height: 60,
                      child: Center(
                        child: Text(
                          "SIMPAN", style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),

                    ),
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}
