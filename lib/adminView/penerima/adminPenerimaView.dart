import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interma/adminView/penerima/editPenerimaView.dart';
import 'package:interma/adminView/penerima/tambahPenerimaView.dart';
import 'package:interma/model/penerima.dart';
import 'package:interma/service/apiService.dart';
import 'package:interma/viewUser/appBarTitle.dart';
class AdminPenerimaView extends StatefulWidget {
  @override
  _AdminPenerimaViewState createState() => _AdminPenerimaViewState();
}

class _AdminPenerimaViewState extends State<AdminPenerimaView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarTitle(
          nama: "Data Penerima",
          preferredSize: Size.fromHeight(140),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: ()=>Get.to(TambahPenerimaView()),
          backgroundColor: Color(0xff61D2C4),
        ),

        body: FutureBuilder<List<Penerimas>>(
          future: ApiService.getListPenerima(),
          builder: (context, snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator());
            }else{
              List<Penerimas> listDonasi = snapshot.data;
              print(listDonasi);
              return ListView.builder(
                itemCount: listDonasi?.length ?? 0,
                itemBuilder: (BuildContext context, int index){
                  var data = snapshot.data[index];
                  return InkWell(
                    onTap: ()=> Get.to(EditPenerimaView(data: data)),
                    child: Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      height: 120,
                      width: MediaQuery.of(context).size.width * 0.95,
                      child: Card(
                        child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Stack(
                              children: [
                                Column(
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment:  MainAxisAlignment.start,
                                      children: [

                                        Text(data.nama, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                                        SizedBox(height: 5,),
                                        Row(
                                          children: [
                                            Icon(Icons.call, size: 20,),
                                            Text(data.kontak, style: TextStyle(fontSize: 13),),
                                          ],
                                        ),
                                        SizedBox(height: 5,),
                                        Row(
                                          children: [
                                            Icon(Icons.location_on, size: 20,),
                                            Text(data.alamat, style: TextStyle(fontSize: 13),),
                                          ],
                                        ),
                                      ],
                                    ),


                                  ],
                                ),
                              ],
                            )
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          },
        )
    );
  }
}
