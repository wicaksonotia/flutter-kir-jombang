class RiwayatKendaraanModel {
  String? status;
  String? statusMessage;
  List<DataRiwayat>? data;

  RiwayatKendaraanModel({this.status, this.statusMessage, this.data});

  RiwayatKendaraanModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusMessage = json['status_message'];
    if (json['data'] != null) {
      data = <DataRiwayat>[];
      json['data'].forEach((v) {
        data!.add(DataRiwayat.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['status_message'] = statusMessage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataRiwayat {
  String? noUji;
  String? noKendaraan;
  String? tglUji;
  String? tglmati;
  String? nmUji;
  String? statusLulus;
  String? nmPenguji;
  int? idHasilUji;

  DataRiwayat(
      {this.noUji,
      this.noKendaraan,
      this.tglUji,
      this.tglmati,
      this.nmUji,
      this.statusLulus,
      this.nmPenguji,
      this.idHasilUji});

  DataRiwayat.fromJson(Map<String, dynamic> json) {
    noUji = json['no_uji'];
    noKendaraan = json['no_kendaraan'];
    tglUji = json['tgl_uji'];
    tglmati = json['tglmati'];
    nmUji = json['nm_uji'];
    statusLulus = json['status_lulus'];
    nmPenguji = json['nm_penguji'];
    idHasilUji = json['id_hasil_uji'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['no_uji'] = noUji;
    data['no_kendaraan'] = noKendaraan;
    data['tgl_uji'] = tglUji;
    data['tglmati'] = tglmati;
    data['nm_uji'] = nmUji;
    data['status_lulus'] = statusLulus;
    data['nm_penguji'] = nmPenguji;
    data['id_hasil_uji'] = idHasilUji;
    return data;
  }
}
