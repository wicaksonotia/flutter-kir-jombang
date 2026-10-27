class PersyaratanDetailModel {
  final int id;
  final int idJenisUji;
  final String persyaratan;
  final bool status;

  const PersyaratanDetailModel({
    this.id = 0,
    this.idJenisUji = 0,
    this.persyaratan = '',
    this.status = true,
  });

  factory PersyaratanDetailModel.fromJson(Map<String, dynamic> json) {
    return PersyaratanDetailModel(
      id: int.tryParse(json['id']?.toString() ?? '') ?? 0,
      idJenisUji: int.tryParse(json['id_jenis_uji']?.toString() ?? '') ?? 0,
      persyaratan: json['persyaratan']?.toString() ?? '',
      status: json['status'] == true ||
          json['status']?.toString() == 'true' ||
          json['status']?.toString() == '1',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'id_jenis_uji': idJenisUji,
      'persyaratan': persyaratan,
      'status': status,
    };
  }
}
