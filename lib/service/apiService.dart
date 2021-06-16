import 'dart:convert';
import '../model/donations.dart';
import '../model/donatur.dart';
import '../model/penerima.dart';
import '../model/penyalurans.dart';

import 'package:http/http.dart' as http;
class ApiService{
  static final _URL_DONASI = Uri.parse("https://ptidonation.herokuapp.com/donasi");
  static final _URL_DONATUR = Uri.parse("https://ptidonation.herokuapp.com/donatur");
  static final _URL_PENERIMA = Uri.parse("https://ptidonation.herokuapp.com/penerima");
  static final _URL_PENYALURAN = Uri.parse("https://ptidonation.herokuapp.com/penyaluran");

  static Future<List<Donations>> getListDonasi() async {
    final response = await http.get(_URL_DONASI); //data json
    if (response.statusCode == 200) {
      final items = jsonDecode(response.body).cast<Map<String, dynamic>>();
      List<Donations> listDonasi = items.map<Donations>((json) {
        return Donations.fromJson(json);
      }).toList();

      return listDonasi;
    } else {
      return [];
    }
  }

  static Future<List<Penyalurans>> getListPenyaluran() async {
    final response = await http.get(_URL_PENYALURAN); //data json
    if (response.statusCode == 200) {
      final items = jsonDecode(response.body).cast<Map<String, dynamic>>();;
      List<Penyalurans> listPenyaluran = items.map<Penyalurans>((json) {
        return Penyalurans.fromJson(json);
      }).toList();

      return listPenyaluran;
    } else {
      return [];
    }
  }

}