class PersyaratanModel {
  String? nama;
  String? keterangan;
  String? warna;
  bool? status;
  int id;
  int? sorting;

  PersyaratanModel({
    this.nama,
    this.keterangan,
    this.warna,
    this.status,
    this.id = 1,
    this.sorting,
  });

  factory PersyaratanModel.fromJson(Map<String, dynamic> json) {
    return PersyaratanModel(
      nama: json['nama']?.toString(),
      keterangan: json['keterangan']?.toString(),
      warna: json['warna']?.toString(),
      status: json['status'] is bool ? json['status'] as bool : null,
      id: int.tryParse(json['id']?.toString() ?? '') ?? 1,
      sorting: int.tryParse(json['sorting']?.toString() ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nama': nama,
      'keterangan': keterangan,
      'warna': warna,
      'status': status,
      'id': id,
      'sorting': sorting,
    };
  }
}
