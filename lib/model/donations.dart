class Donations {
  int idDonasi;
  int idDonatur;
  String tanggal;
  int jumlah;
  Null bukti;
  Null tbDonaturIdDonatur;
  Donatur donatur;

  Donations(
      {this.idDonasi,
        this.idDonatur,
        this.tanggal,
        this.jumlah,
        this.bukti,
        this.tbDonaturIdDonatur,
        this.donatur});

  Donations.fromJson(Map<String, dynamic> json) {
    idDonasi = json['id_donasi'];
    idDonatur = json['id_donatur'];
    tanggal = json['tanggal'];
    jumlah = json['jumlah'];
    bukti = json['bukti'];
    tbDonaturIdDonatur = json['tbDonaturIdDonatur'];
    donatur =
    json['donatur'] != null ? new Donatur.fromJson(json['donatur']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_donasi'] = this.idDonasi;
    data['id_donatur'] = this.idDonatur;
    data['tanggal'] = this.tanggal;
    data['jumlah'] = this.jumlah;
    data['bukti'] = this.bukti;
    data['tbDonaturIdDonatur'] = this.tbDonaturIdDonatur;
    if (this.donatur != null) {
      data['donatur'] = this.donatur.toJson();
    }
    return data;
  }
}

class Donatur {
  int idDonatur;
  String nama;
  String alamat;
  String kontak;
  Null photo;

  Donatur({this.idDonatur, this.nama, this.alamat, this.kontak, this.photo});

  Donatur.fromJson(Map<String, dynamic> json) {
    idDonatur = json['id_donatur'];
    nama = json['nama'];
    alamat = json['alamat'];
    kontak = json['kontak'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_donatur'] = this.idDonatur;
    data['nama'] = this.nama;
    data['alamat'] = this.alamat;
    data['kontak'] = this.kontak;
    data['photo'] = this.photo;
    return data;
  }
}