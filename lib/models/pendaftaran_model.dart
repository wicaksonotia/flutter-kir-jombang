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
  String? tanggalRetribusi;
  String? tanggalUji;
  int? kodeNumerator;
  String? nmUji;
  String? totalRetribusi;

  DataRetribusi(
      {this.id,
      this.noUji,
      this.tanggalRetribusi,
      this.tanggalUji,
      this.kodeNumerator,
      this.nmUji,
      this.totalRetribusi});

  DataRetribusi.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    noUji = json['no_uji'];
    tanggalRetribusi = json['tanggal_retribusi'];
    tanggalUji = json['tanggal_uji'];
    kodeNumerator = json['kode_numerator'];
    nmUji = json['nm_uji'];
    totalRetribusi = json['total_retribusi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['no_uji'] = noUji;
    data['tanggal_retribusi'] = tanggalRetribusi;
    data['tanggal_uji'] = tanggalUji;
    data['kode_numerator'] = kodeNumerator;
    data['nm_uji'] = nmUji;
    data['total_retribusi'] = totalRetribusi;
    return data;
  }
}
