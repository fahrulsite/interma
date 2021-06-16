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