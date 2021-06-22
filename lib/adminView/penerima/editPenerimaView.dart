import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interma/model/penerima.dart';
import 'package:interma/service/apiService.dart';
import 'package:interma/viewUser/appBarTitle.dart';
import 'package:toast/toast.dart';
class EditPenerimaView extends StatefulWidget {
  final Penerimas data;

  const EditPenerimaView({Key key, this.data}) : super(key: key);

  @override
  _EditPenerimaViewState createState() => _EditPenerimaViewState();
}

class _EditPenerimaViewState extends State<EditPenerimaView> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    TextEditingController nama = new TextEditingController(text: widget.data.nama);
    TextEditingController alamat = new TextEditingController(text: widget.data.alamat);
    TextEditingController kontak = new TextEditingController(text: widget.data.kontak);

    return Scaffold(
        appBar: AppBarTitle(
          nama: "Edit Penerima",
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

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: (){
                          showDialog(context: context, builder: (context){
                            return AlertDialog(
                              title: Text("Konfirmasi"),
                              content: Text("Apakah Anda Yakin ingin menghapus data ini?"),
                              actions: [
                                FlatButton(
                                    onPressed: (){
                                      Get.back();
                                    },
                                    child: Text("No")),
                                FlatButton(onPressed:(){
                                  ApiService.deletePenerima(
                                      id: widget.data.idPenerima.toString()).whenComplete((){
                                    Get.back();
                                    Get.back();
                                  });},
                                    child: Text("Yes")),
                              ],
                            );
                          });
                        },
                        child: Container(
                          width: 100,
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color(0xffFF616D),
                          ),
                          height: 60,
                          child: Center(child: Text("Hapus", style: TextStyle(color: Colors.white),)),
                        ),
                      ),

                      InkWell(
                        onTap: ()=>ApiService.editPenerima(id:widget.data.idPenerima.toString(),nama: nama.text, alamat: alamat.text, kontak: kontak.text).then((value) => {
                          Toast.show("Berhasil", context, duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM),
                        }).whenComplete(() =>Get.back()),
                        child: Container(
                          width: 100,
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color(0xff61D2C4),
                          ),
                          height: 60,
                          child: Center(child: Text("Simpan")),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}
