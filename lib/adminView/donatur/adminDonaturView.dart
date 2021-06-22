import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interma/adminView/donatur/editDonaturView.dart';
import 'package:interma/adminView/donatur/tambahDonaturView.dart';
import 'package:interma/model/donatur.dart';
import 'package:interma/service/apiService.dart';
import 'package:interma/viewUser/appBarTitle.dart';
class AdminDonaturView extends StatefulWidget {
  @override
  _AdminDonaturViewState createState() => _AdminDonaturViewState();
}

class _AdminDonaturViewState extends State<AdminDonaturView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarTitle(
          nama: "Data Donatur",
          preferredSize: Size.fromHeight(140),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: ()=>Get.to(TambahDonaturView()),
          backgroundColor: Color(0xff61D2C4),
        ),
        body: FutureBuilder<List<Donaturs>>(
          future: ApiService.getListDonatur(),
          builder: (context, snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator());
            }else{
              List<Donaturs> listDonasi = snapshot.data;
              print(listDonasi);
              return ListView.builder(
                itemCount: listDonasi?.length ?? 0,
                itemBuilder: (BuildContext context, int index){
                  var data = snapshot.data[index];
                  return InkWell(
                    onTap: ()=>Get.to(EditDonaturView(data: data,)),
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
