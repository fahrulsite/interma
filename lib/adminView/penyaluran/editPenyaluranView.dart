import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interma/model/penyalurans.dart';
import 'package:http/http.dart' as http;
import 'package:interma/service/apiService.dart';
import 'package:interma/viewUser/appBarTitle.dart';
import 'package:intl/intl.dart';
import 'package:toast/toast.dart';
class EditPenyaluranView extends StatefulWidget {
  final Penyalurans  data;

  const EditPenyaluranView({Key key, this.data}) : super(key: key);
  @override
  _EditPenyaluranViewState createState() => _EditPenyaluranViewState();
}

class _EditPenyaluranViewState extends State<EditPenyaluranView> {
  String id;
  String date;
  List data = List();

  Future getAllNama() async{
    var res = await http.get(Uri.parse("https://ptidonation.herokuapp.com/penerima"));
    var resBody = json.decode(res.body);
    setState(() {
      data = resBody;
    });
  }

  String _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime d = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 3),
      lastDate: DateTime(DateTime.now().year +3),
    );
    if (d != null)
      setState(() {
        _selectedDate = new DateFormat.yMMMMd("en_US").format(d);
      });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    id = widget.data.idPenerima.toString();
    _selectedDate = widget.data.tanggal.toString();
    getAllNama();
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    TextEditingController jumlah = new TextEditingController(text: widget.data.jumlah.toString());

    return Scaffold(
        appBar: AppBarTitle(
          nama: "Edit Penyaluran",
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
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black26),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                          children: [
                            Text('Nama'),

                            DropdownButtonHideUnderline(
                              child: DropdownButton(
                                value: id,
                                hint: Text("Pilih Nama Penerima"),
                                items: data.map((item) {
                                  return DropdownMenuItem(
                                    child: Text(item["nama"]),
                                    value: item["id_penerima"].toString(),
                                  );
                                }).toList(),
                                onChanged: (String newVal) {
                                  setState(() {
                                    id = newVal;
                                    print(id.toString());
                                  });
                                },
                              ),
                            ),]
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  InkWell(
                    onTap: (){
                      _selectDate(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black26),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                            children: [
                              Icon(Icons.date_range),
                              SizedBox( width: 20,),
                              Text(
                                  _selectedDate,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Color(0xFF000000))
                              ),]
                        ),
                      ),

                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Jumlah",
                        labelText: "Masukkan Jumlah"
                    ),
                    validator: (e) {
                      if (e.isEmpty) {
                        return 'Jumlah tidak boleh kosong';
                      }
                      ;
                    },
                    controller: jumlah,
                  ),

                  SizedBox(
                    height: 20,
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
                                  ApiService.deletePenyaluran(
                                      id: widget.data.idPenyaluran.toString()).whenComplete((){
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
                        onTap: ()=>ApiService.editPenyaluran(id: widget.data.idPenyaluran.toString(),id_penerima:id, jumlah: jumlah.text,tanggal: _selectedDate).then((value) => {
                          Toast.show("Berhasil", context, duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM),
                          print(id+_selectedDate+jumlah.text)
                        })..whenComplete(() => Get.back()),
                        child: Container(
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color(0xff61D2C4),
                          ),
                          height: 60,
                          child: Center(
                            child: Text(
                              "Simpan", style: TextStyle(color: Colors.white,),
                            ),
                          ),

                        ),
                      ),
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
