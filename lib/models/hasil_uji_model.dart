class HasilUjiModel {
  String? status;
  String? message;
  DataHasilUji? data;

  HasilUjiModel({this.status, this.message, this.data});

  HasilUjiModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data =
        json['data'] != null ? new DataHasilUji.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class DataHasilUji {
  int? idHasilUji;
  String? noUji;
  String? noKendaraan;
  String? pemilik;
  String? hasilTglTerakhirUji;
  String? hasilTglMatiUji;
  String? hasilPrauji;
  String? hasilEmisi;
  String? hasilPitlift;
  String? hasilLampu;
  String? hasilBreak;
  String? ltl;
  String? imgDepan;
  String? imgBelakang;
  String? imgKanan;
  String? imgKiri;

  DataHasilUji(
      {this.idHasilUji,
      this.noUji,
      this.noKendaraan,
      this.pemilik,
      this.hasilTglTerakhirUji,
      this.hasilTglMatiUji,
      this.hasilPrauji,
      this.hasilEmisi,
      this.hasilPitlift,
      this.hasilLampu,
      this.hasilBreak,
      this.ltl,
      this.imgDepan,
      this.imgBelakang,
      this.imgKanan,
      this.imgKiri});

  DataHasilUji.fromJson(Map<String, dynamic> json) {
    idHasilUji = json['id_hasil_uji'];
    noUji = json['no_uji'];
    noKendaraan = json['no_kendaraan'];
    pemilik = json['pemilik'];
    hasilTglTerakhirUji = json['hasil_tgl_terakhir_uji'];
    hasilTglMatiUji = json['hasil_tgl_mati_uji'];
    hasilPrauji = json['hasil_prauji'];
    hasilEmisi = json['hasil_emisi'];
    hasilPitlift = json['hasil_pitlift'];
    hasilLampu = json['hasil_lampu'];
    hasilBreak = json['hasil_break'];
    ltl = json['ltl'];
    imgDepan = json['img_depan'];
    imgBelakang = json['img_belakang'];
    imgKanan = json['img_kanan'];
    imgKiri = json['img_kiri'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_hasil_uji'] = idHasilUji;
    data['no_uji'] = noUji;
    data['no_kendaraan'] = noKendaraan;
    data['pemilik'] = pemilik;
    data['hasil_tgl_terakhir_uji'] = hasilTglTerakhirUji;
    data['hasil_tgl_mati_uji'] = hasilTglMatiUji;
    data['hasil_prauji'] = hasilPrauji;
    data['hasil_emisi'] = hasilEmisi;
    data['hasil_pitlift'] = hasilPitlift;
    data['hasil_lampu'] = hasilLampu;
    data['hasil_break'] = hasilBreak;
    data['ltl'] = ltl;
    data['img_depan'] = imgDepan;
    data['img_belakang'] = imgBelakang;
    data['img_kanan'] = imgKanan;
    data['img_kiri'] = imgKiri;
    return data;
  }
}
