class PendaftaranModel {
  String? status;
  String? message;
  List<DataRetribusi>? data;

  PendaftaranModel({this.status, this.message, this.data});

  PendaftaranModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DataRetribusi>[];
      json['data'].forEach((v) {
        data!.add(DataRetribusi.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataRetribusi {
  int? id;
  String? noUji;
  String? persyaratanKtp;
  String? persyaratanStnk;
  String? persyaratanKartuUji;
  String? persyaratanSertifikatUji;
  String? tanggalRetribusi;
  String? tanggalUji;

  DataRetribusi(
      {this.id,
      this.noUji,
      this.persyaratanKtp,
      this.persyaratanStnk,
      this.persyaratanKartuUji,
      this.persyaratanSertifikatUji,
      this.tanggalRetribusi,
      this.tanggalUji});

  DataRetribusi.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    noUji = json['no_uji'];
    persyaratanKtp = json['persyaratan_ktp'];
    persyaratanStnk = json['persyaratan_stnk'];
    persyaratanKartuUji = json['persyaratan_kartu_uji'];
    persyaratanSertifikatUji = json['persyaratan_sertifikat_uji'];
    tanggalRetribusi = json['tanggal_retribusi'];
    tanggalUji = json['tanggal_uji'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['no_uji'] = noUji;
    data['persyaratan_ktp'] = persyaratanKtp;
    data['persyaratan_stnk'] = persyaratanStnk;
    data['persyaratan_kartu_uji'] = persyaratanKartuUji;
    data['persyaratan_sertifikat_uji'] = persyaratanSertifikatUji;
    data['tanggal_retribusi'] = tanggalRetribusi;
    data['tanggal_uji'] = tanggalUji;
    return data;
  }
}
