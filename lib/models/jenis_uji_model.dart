class JenisUjiModel {
  String? nama;
  String? keterangan;
  String? warna;
  int id = 1;

  JenisUjiModel({this.nama, this.keterangan, this.warna, required this.id});

  JenisUjiModel.fromJson(Map<String, dynamic> json) {
    nama = json['nama'];
    keterangan = json['keterangan'];
    warna = json['warna'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nama'] = nama;
    data['keterangan'] = keterangan;
    data['warna'] = warna;
    data['id'] = id;
    return data;
  }
}
