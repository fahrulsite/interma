import 'dart:convert';

import 'package:interma/model/admin.dart';
import 'package:interma/model/penerima.dart';

import '../model/donations.dart';
import '../model/donatur.dart';
import '../model/penyalurans.dart';

import 'package:http/http.dart' as http;
class ApiService{
  static final _URL_DONASI = Uri.parse("https://ptidonation.herokuapp.com/donasi");
  static final _URL_DONATUR = Uri.parse("https://ptidonation.herokuapp.com/donatur");
  static final _URL_PENERIMA = Uri.parse("https://ptidonation.herokuapp.com/penerima");
  static final _URL_PENYALURAN = Uri.parse("https://ptidonation.herokuapp.com/penyaluran");

//=======================GET============================
  static Future<List<Donaturs>> getListDonatur() async {
    final response = await http.get(_URL_DONATUR); //data json
    if (response.statusCode == 200) {
      final items = jsonDecode(response.body).cast<Map<String, dynamic>>();;
      List<Donaturs> listDonatur = items.map<Donaturs>((json) {
        return Donaturs.fromJson(json);
      }).toList();

      return listDonatur;
    } else {
      return [];
    }
  }

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


  static Future<List<Penerimas>> getListPenerima() async {
    final response = await http.get(_URL_PENERIMA); //data json
    if (response.statusCode == 200) {
      final items = jsonDecode(response.body).cast<Map<String, dynamic>>();;
      List<Penerimas> listPenerima = items.map<Penerimas>((json) {
        return Penerimas.fromJson(json);
      }).toList();

      return listPenerima;
    } else {
      return [];
    }
  }


//=======================POST============================

  static Future<List<Donaturs>> createDonatur({String nama, String alamat, String kontak}) async {
    final response = await http.post(_URL_DONATUR,
      body: {
        'nama' :nama,
        'alamat': alamat,
        'kontak':kontak
      },
    ); //data json

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }


  static Future<List<Donations>> createDonasi({String id_donatur, String jumlah, String tanggal}) async {
    print('post');
    final response = await http.post(_URL_DONASI,
      body: {
        'id_donatur' :id_donatur,
        'jumlah': jumlah,
        'tanggal':tanggal
      },
    ); //data json

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

  static Future<List<Penerimas>> createPenerima({String nama, String alamat, String kontak}) async {
    final response = await http.post(_URL_PENERIMA,
      body: {
        'nama' :nama,
        'alamat': alamat,
        'kontak':kontak
      },
    ); //data json

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

  static Future<List<Penyalurans>> createPenyaluran({String id_penerima, String jumlah, String tanggal}) async {
    final response = await http.post(_URL_PENYALURAN,
      body: {
        'id_penerima' :id_penerima,
        'jumlah': jumlah,
        'tanggal':tanggal
      },
    ); //data json

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

  //=========================EDIT=======
  static Future<List<Donaturs>> editDonatur({String id, String nama, String alamat, String kontak}) async {
    final response = await http.put( Uri.parse( "https://ptidonation.herokuapp.com/donatur/$id}"),
      body: {
        'nama' :nama,
        'alamat': alamat,
        'kontak':kontak
      },
    ); //data json

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

  static Future<List<Donations>> editDonasi({String id, String id_donatur, String nama, String tanggal, String jumlah}) async {
    final response = await http.put( Uri.parse( "https://ptidonation.herokuapp.com/donasi/$id}"),
      body: {
        'id_donatur' :id_donatur,
        'tanggal': tanggal,
        'jumlah':jumlah
      },
    ); //data json

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

  static Future<List<Penerimas>> editPenerima({String id, String nama, String alamat, String kontak}) async {
    final response = await http.put( Uri.parse( "https://ptidonation.herokuapp.com/penerima/$id}"),
      body: {
        'nama' :nama,
        'alamat': alamat,
        'kontak':kontak
      },
    ); //data json

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

  static Future<List<Penyalurans>> editPenyaluran({String id, String id_penerima, String nama, String tanggal, String jumlah}) async {
    final response = await http.put( Uri.parse( "https://ptidonation.herokuapp.com/penyaluran/$id}"),
      body: {
        'id_penerima' :id_penerima,
        'tanggal': tanggal,
        'jumlah':jumlah
      },
    ); //data json

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

  //=============DELETE=============
  static Future<List<Donaturs>> deleteDonatur({String id}) async {
    final response = await http.delete( Uri.parse( "https://ptidonation.herokuapp.com/donatur/$id}")); //data json

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

  static Future<List<Donations>> deleteDonasi({String id}) async {
    final response = await http.delete( Uri.parse( "https://ptidonation.herokuapp.com/donasi/$id}")); //data json

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

  static Future<List<Penerimas>> deletePenerima({String id}) async {
    final response = await http.delete( Uri.parse( "https://ptidonation.herokuapp.com/penerima/$id}")); //data json

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

  static Future<List<Penyalurans>> deletePenyaluran({String id}) async {
    final response = await http.delete( Uri.parse( "https://ptidonation.herokuapp.com/penyaluran/$id}")); //data json

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

}