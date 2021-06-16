class Penyalurans {
  int idPenyaluran;
  int idPenerima;
  String tanggal;
  int jumlah;
  Null tbPenerimaIdPenerima;
  Penerima penerima;

  Penyalurans(
      {this.idPenyaluran,
        this.idPenerima,
        this.tanggal,
        this.jumlah,
        this.tbPenerimaIdPenerima,
        this.penerima});

  Penyalurans.fromJson(Map<String, dynamic> json) {
    idPenyaluran = json['id_penyaluran'];
    idPenerima = json['id_penerima'];
    tanggal = json['tanggal'];
    jumlah = json['jumlah'];
    tbPenerimaIdPenerima = json['tbPenerimaIdPenerima'];
    penerima = json['penerima'] != null
        ? new Penerima.fromJson(json['penerima'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_penyaluran'] = this.idPenyaluran;
    data['id_penerima'] = this.idPenerima;
    data['tanggal'] = this.tanggal;
    data['jumlah'] = this.jumlah;
    data['tbPenerimaIdPenerima'] = this.tbPenerimaIdPenerima;
    if (this.penerima != null) {
      data['penerima'] = this.penerima.toJson();
    }
    return data;
  }
}

class Penerima {
  int idPenerima;
  String nama;
  String alamat;
  String kontak;

  Penerima({this.idPenerima, this.nama, this.alamat, this.kontak});

  Penerima.fromJson(Map<String, dynamic> json) {
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