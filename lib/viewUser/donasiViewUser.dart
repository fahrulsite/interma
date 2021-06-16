import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:interma/viewUser/appBarTitle.dart';
import 'package:interma/viewUser/detailDonasi.dart';
import '../model/donations.dart';
import '../service/apiService.dart';

class DonasiViewUser extends StatefulWidget {
  @override
  _DonasiViewUserState createState() => _DonasiViewUserState();
}

class _DonasiViewUserState extends State<DonasiViewUser> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarTitle(
        nama: "Data Donasi",
        preferredSize: Size.fromHeight(140),
      ),
      body: FutureBuilder<List<Donations>>(
        future: ApiService.getListDonasi(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }else{
            List<Donations> listDonasi = snapshot.data;
            return ListView.builder(
              itemCount: listDonasi?.length ?? 0,
              itemBuilder: (BuildContext context, int index){
                var data = snapshot.data[index];
                return InkWell(
                  onTap: ()=>Get.to(DetailDonasi(data: data,)),
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
