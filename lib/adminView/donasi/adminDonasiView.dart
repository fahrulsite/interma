import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interma/adminView/donasi/editDonasiView.dart';
import 'package:interma/adminView/donasi/tambahDonasiView.dart';

import 'package:interma/model/donations.dart';
import 'package:interma/service/apiService.dart';
import 'package:interma/viewUser/appBarTitle.dart';

class AdminDonasiView extends StatefulWidget {
  @override
  _AdminDonasiViewState createState() => _AdminDonasiViewState();
}

class _AdminDonasiViewState extends State<AdminDonasiView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarTitle(
          nama: "Data Donasi",
          preferredSize: Size.fromHeight(140),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: ()=>Get.to(TambahDonasiView()),
          backgroundColor: Color(0xff61D2C4),
        ),

        body: FutureBuilder<List<Donations>>(
          future: ApiService.getListDonasi(),
          builder: (context, snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator());
            }else{
              List<Donations> listDonasi = snapshot.data;
              print(snapshot.data);
              return ListView.builder(
                itemCount: listDonasi?.length ?? 0,
                itemBuilder: (BuildContext context, int index){
                  var data = snapshot.data[index];
                  return InkWell(
                    onTap: ()=>Get.to(EditDonasiView(data: data,)),
                    child: Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      height: 100,
                      width: MediaQuery.of(context).size.width * 0.95,
                      child: Card(
                        child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Stack(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 20,),
                                    Row(
                                      children: [
                                        Text(data.donatur.nama, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                                      ],
                                    ),


                                  ],
                                ),
                                Positioned(
                                  right: 0,
                                  bottom: 0,
                                  child: Container(
                                    margin: EdgeInsets.only(left: 20),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [

                                        Text("+"+"${data.jumlah}", style: TextStyle(fontSize: 20, color: Colors.green),),
                                        SizedBox(height: 10,),
                                        Row(
                                          children: [
                                            Icon(Icons.date_range, size: 20,),
                                            SizedBox(width: 10,),
                                            Text(data.tanggal, style: TextStyle(fontSize: 13),),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                )
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
