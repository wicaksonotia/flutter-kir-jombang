class UjiHariIniModel {
  DataUjiHariIni? data;

  UjiHariIniModel({this.data});

  UjiHariIniModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? DataUjiHariIni.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class DataUjiHariIni {
  int? ujiPertama;
  int? ujiBerkala;
  int? numpangMasuk;
  int? mutasiMasuk;

  DataUjiHariIni(
      {this.ujiPertama, this.ujiBerkala, this.numpangMasuk, this.mutasiMasuk});

  DataUjiHariIni.fromJson(Map<String, dynamic> json) {
    ujiPertama = json['uji_pertama'];
    ujiBerkala = json['uji_berkala'];
    numpangMasuk = json['numpang_masuk'];
    mutasiMasuk = json['mutasi_masuk'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uji_pertama'] = ujiPertama;
    data['uji_berkala'] = ujiBerkala;
    data['numpang_masuk'] = numpangMasuk;
    data['mutasi_masuk'] = mutasiMasuk;
    return data;
  }
}
