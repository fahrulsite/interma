class Penerimas {
  int idPenerima;
  String nama;
  String alamat;
  String kontak;

  Penerimas({this.idPenerima, this.nama, this.alamat, this.kontak});

  Penerimas.fromJson(Map<String, dynamic> json) {
    idPenerima = json['id_penerima'];
    nama = json['nama'];
    alamat = json['alamat'];
    kontak = json['kontak'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_penerima'] = this.idPenerima;
    data['nama'] = this.nama;
    data['alamat'] = this.alamat;
    data['kontak'] = this.kontak;
    return data;
  }
}