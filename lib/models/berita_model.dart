class BeritaModel {
  String? judul;
  String? berita;
  String? tanggal;
  String? gambar;

  BeritaModel({this.judul, this.berita, this.tanggal, this.gambar});

  BeritaModel.fromJson(Map<String, dynamic> json) {
    judul = json['judul'];
    berita = json['berita'];
    tanggal = json['tanggal'];
    gambar = json['gambar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['judul'] = judul;
    data['berita'] = berita;
    data['tanggal'] = tanggal;
    data['gambar'] = gambar;
    return data;
  }
}
