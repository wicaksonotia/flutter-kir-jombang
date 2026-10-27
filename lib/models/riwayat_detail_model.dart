String? _jsonString(dynamic value) => value?.toString();

bool? _jsonBool(dynamic value) {
  if (value == null) return null;
  if (value is bool) return value;

  if (value is num) {
    if (value == 1) return true;
    if (value == 0) return false;
  }

  if (value is String) {
    switch (value.trim().toLowerCase()) {
      case 'true':
      case '1':
      case 'ya':
        return true;
      case 'false':
      case '0':
      case 'tidak':
        return false;
    }
  }

  return null;
}

class DetailRiwayatModel {
  String? status;
  String? message;
  DataDetailRiwayat? data;

  DetailRiwayatModel({this.status, this.message, this.data});

  DetailRiwayatModel.fromJson(Map<String, dynamic> json) {
    status = _jsonString(json['status']);
    message = _jsonString(json['message']);

    data = json['data'] is Map
        ? DataDetailRiwayat.fromJson(
            Map<String, dynamic>.from(json['data']),
          )
        : null;
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.toJson(),
      };
}

class DataDetailRiwayat {
  String? noUji;
  String? noKendaraan;
  String? merk;
  String? tipe;
  String? noChasis;
  String? noMesin;
  String? pemilik;
  String? alamat;
  String? tglRetribusi;
  String? tglUji;
  String? tglmati;
  String? nmUji;
  String? ptgsPrauji;
  String? ptgsSmoke;
  String? ptgsPitlift;
  String? ptgsLampu;
  String? ptgsBreak;
  String? nmPenguji;
  String? emsDiesel;
  String? emsMesinCo;
  String? emsMesinHc;
  String? ktlampKanan;
  String? ktlampKiri;
  String? devKanan;
  String? devKiri;
  String? selremSb1;
  String? selremSb2;
  String? selremSb3;
  String? selremSb4;
  String? selgaya1;
  String? selgaya2;
  String? selgaya3;
  String? selgaya4;
  String? statusLulus;
  bool? lulusPrauji;
  bool? lulusSmoke;
  bool? lulusPitlift;
  bool? lulusLampu;
  bool? lulusBreak;
  String? imgDepan;
  String? imgBelakang;
  String? imgKanan;
  String? imgKiri;

  DataDetailRiwayat({
    this.noUji,
    this.noKendaraan,
    this.merk,
    this.tipe,
    this.noChasis,
    this.noMesin,
    this.pemilik,
    this.alamat,
    this.tglRetribusi,
    this.tglUji,
    this.tglmati,
    this.nmUji,
    this.ptgsPrauji,
    this.ptgsSmoke,
    this.ptgsPitlift,
    this.ptgsLampu,
    this.ptgsBreak,
    this.nmPenguji,
    this.emsDiesel,
    this.emsMesinCo,
    this.emsMesinHc,
    this.ktlampKanan,
    this.ktlampKiri,
    this.devKanan,
    this.devKiri,
    this.selremSb1,
    this.selremSb2,
    this.selremSb3,
    this.selremSb4,
    this.selgaya1,
    this.selgaya2,
    this.selgaya3,
    this.selgaya4,
    this.statusLulus,
    this.lulusPrauji,
    this.lulusSmoke,
    this.lulusPitlift,
    this.lulusLampu,
    this.lulusBreak,
    this.imgDepan,
    this.imgBelakang,
    this.imgKanan,
    this.imgKiri,
  });

  DataDetailRiwayat.fromJson(Map<String, dynamic> json) {
    noUji = _jsonString(json['no_uji']);
    noKendaraan = _jsonString(json['no_kendaraan']);
    merk = _jsonString(json['merk']);
    tipe = _jsonString(json['tipe']);
    noChasis = _jsonString(json['no_chasis']);
    noMesin = _jsonString(json['no_mesin']);
    pemilik = _jsonString(json['pemilik']);
    alamat = _jsonString(json['alamat']);
    tglRetribusi = _jsonString(json['tgl_retribusi']);
    tglUji = _jsonString(json['tgl_uji']);
    tglmati = _jsonString(json['tglmati']);
    nmUji = _jsonString(json['nm_uji']);
    ptgsPrauji = _jsonString(json['ptgs_prauji']);
    ptgsSmoke = _jsonString(json['ptgs_smoke']);
    ptgsPitlift = _jsonString(json['ptgs_pitlift']);
    ptgsLampu = _jsonString(json['ptgs_lampu']);
    ptgsBreak = _jsonString(json['ptgs_break']);
    nmPenguji = _jsonString(json['nm_penguji']);

    emsDiesel = _jsonString(json['ems_diesel']);
    emsMesinCo = _jsonString(json['ems_mesin_co']);
    emsMesinHc = _jsonString(json['ems_mesin_hc']);
    ktlampKanan = _jsonString(json['ktlamp_kanan']);
    ktlampKiri = _jsonString(json['ktlamp_kiri']);
    devKanan = _jsonString(json['dev_kanan']);
    devKiri = _jsonString(json['dev_kiri']);
    selremSb1 = _jsonString(json['selrem_sb1']);
    selremSb2 = _jsonString(json['selrem_sb2']);
    selremSb3 = _jsonString(json['selrem_sb3']);
    selremSb4 = _jsonString(json['selrem_sb4']);
    selgaya1 = _jsonString(json['selgaya1']);
    selgaya2 = _jsonString(json['selgaya2']);
    selgaya3 = _jsonString(json['selgaya3']);
    selgaya4 = _jsonString(json['selgaya4']);

    statusLulus = _jsonString(json['status_lulus']);

    lulusPrauji = _jsonBool(json['lulus_prauji']);
    lulusSmoke = _jsonBool(json['lulus_smoke']);
    lulusPitlift = _jsonBool(json['lulus_pitlift']);
    lulusLampu = _jsonBool(json['lulus_lampu']);
    lulusBreak = _jsonBool(json['lulus_break']);

    imgDepan = _jsonString(json['img_depan']);
    imgBelakang = _jsonString(json['img_belakang']);
    imgKanan = _jsonString(json['img_kanan']);
    imgKiri = _jsonString(json['img_kiri']);
  }

  Map<String, dynamic> toJson() => {
        'no_uji': noUji,
        'no_kendaraan': noKendaraan,
        'merk': merk,
        'tipe': tipe,
        'no_chasis': noChasis,
        'no_mesin': noMesin,
        'pemilik': pemilik,
        'alamat': alamat,
        'tgl_retribusi': tglRetribusi,
        'tgl_uji': tglUji,
        'tglmati': tglmati,
        'nm_uji': nmUji,
        'ptgs_prauji': ptgsPrauji,
        'ptgs_smoke': ptgsSmoke,
        'ptgs_pitlift': ptgsPitlift,
        'ptgs_lampu': ptgsLampu,
        'ptgs_break': ptgsBreak,
        'nm_penguji': nmPenguji,
        'ems_diesel': emsDiesel,
        'ems_mesin_co': emsMesinCo,
        'ems_mesin_hc': emsMesinHc,
        'ktlamp_kanan': ktlampKanan,
        'ktlamp_kiri': ktlampKiri,
        'dev_kanan': devKanan,
        'dev_kiri': devKiri,
        'selrem_sb1': selremSb1,
        'selrem_sb2': selremSb2,
        'selrem_sb3': selremSb3,
        'selrem_sb4': selremSb4,
        'selgaya1': selgaya1,
        'selgaya2': selgaya2,
        'selgaya3': selgaya3,
        'selgaya4': selgaya4,
        'status_lulus': statusLulus,
        'lulus_prauji': lulusPrauji,
        'lulus_smoke': lulusSmoke,
        'lulus_pitlift': lulusPitlift,
        'lulus_lampu': lulusLampu,
        'lulus_break': lulusBreak,
        'img_depan': imgDepan,
        'img_belakang': imgBelakang,
        'img_kanan': imgKanan,
        'img_kiri': imgKiri,
      };
}
