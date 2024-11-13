class DetailRiwayatModel {
  String? status;
  String? message;
  DataDetailRiwayat? data;

  DetailRiwayatModel({this.status, this.message, this.data});

  DetailRiwayatModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data =
        json['data'] != null ? DataDetailRiwayat.fromJson(json['data']) : null;
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
  String? imgDepan;
  String? imgBelakang;
  String? imgKanan;
  String? imgKiri;

  DataDetailRiwayat(
      {this.noUji,
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
      this.imgDepan,
      this.imgBelakang,
      this.imgKanan,
      this.imgKiri});

  DataDetailRiwayat.fromJson(Map<String, dynamic> json) {
    noUji = json['no_uji'];
    noKendaraan = json['no_kendaraan'];
    merk = json['merk'];
    tipe = json['tipe'];
    noChasis = json['no_chasis'];
    noMesin = json['no_mesin'];
    pemilik = json['pemilik'];
    alamat = json['alamat'];
    tglRetribusi = json['tgl_retribusi'];
    tglUji = json['tgl_uji'];
    tglmati = json['tglmati'];
    nmUji = json['nm_uji'];
    ptgsPrauji = json['ptgs_prauji'];
    ptgsSmoke = json['ptgs_smoke'];
    ptgsPitlift = json['ptgs_pitlift'];
    ptgsLampu = json['ptgs_lampu'];
    ptgsBreak = json['ptgs_break'];
    nmPenguji = json['nm_penguji'];
    emsDiesel = json['ems_diesel'];
    emsMesinCo = json['ems_mesin_co'];
    emsMesinHc = json['ems_mesin_hc'];
    ktlampKanan = json['ktlamp_kanan'];
    ktlampKiri = json['ktlamp_kiri'];
    devKanan = json['dev_kanan'];
    devKiri = json['dev_kiri'];
    selremSb1 = json['selrem_sb1'];
    selremSb2 = json['selrem_sb2'];
    selremSb3 = json['selrem_sb3'];
    selremSb4 = json['selrem_sb4'];
    selgaya1 = json['selgaya1'];
    selgaya2 = json['selgaya2'];
    selgaya3 = json['selgaya3'];
    selgaya4 = json['selgaya4'];
    statusLulus = json['status_lulus'];
    imgDepan = json['img_depan'];
    imgBelakang = json['img_belakang'];
    imgKanan = json['img_kanan'];
    imgKiri = json['img_kiri'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['no_uji'] = noUji;
    data['no_kendaraan'] = noKendaraan;
    data['merk'] = merk;
    data['tipe'] = tipe;
    data['no_chasis'] = noChasis;
    data['no_mesin'] = noMesin;
    data['pemilik'] = pemilik;
    data['alamat'] = alamat;
    data['tgl_retribusi'] = tglRetribusi;
    data['tgl_uji'] = tglUji;
    data['tglmati'] = tglmati;
    data['nm_uji'] = nmUji;
    data['ptgs_prauji'] = ptgsPrauji;
    data['ptgs_smoke'] = ptgsSmoke;
    data['ptgs_pitlift'] = ptgsPitlift;
    data['ptgs_lampu'] = ptgsLampu;
    data['ptgs_break'] = ptgsBreak;
    data['nm_penguji'] = nmPenguji;
    data['ems_diesel'] = emsDiesel;
    data['ems_mesin_co'] = emsMesinCo;
    data['ems_mesin_hc'] = emsMesinHc;
    data['ktlamp_kanan'] = ktlampKanan;
    data['ktlamp_kiri'] = ktlampKiri;
    data['dev_kanan'] = devKanan;
    data['dev_kiri'] = devKiri;
    data['selrem_sb1'] = selremSb1;
    data['selrem_sb2'] = selremSb2;
    data['selrem_sb3'] = selremSb3;
    data['selrem_sb4'] = selremSb4;
    data['selgaya1'] = selgaya1;
    data['selgaya2'] = selgaya2;
    data['selgaya3'] = selgaya3;
    data['selgaya4'] = selgaya4;
    data['status_lulus'] = statusLulus;
    data['img_depan'] = imgDepan;
    data['img_belakang'] = imgBelakang;
    data['img_kanan'] = imgKanan;
    data['img_kiri'] = imgKiri;
    return data;
  }
}
