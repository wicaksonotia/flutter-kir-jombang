class PendaftaranModel {
  String? status;
  String? message;
  DataPendaftaran? data;

  PendaftaranModel({this.status, this.message, this.data});

  PendaftaranModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? DataPendaftaran.fromJson(json['data']) : null;
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

class DataPendaftaran {
  int? idRetribusi;
  int? idKendaraan;
  String? bRetribusiKecil;
  String? bRetribusiBesar;
  String? bKartuRusak;
  String? bDenda;
  String? bDendaMax;
  String? bRekom;
  bool? validasi;
  String? tglRetribusi;
  String? tglUji;
  int? lmTlt;
  int? idBkMasuk;
  int? idUji;
  int? idJns;
  String? tglmati;
  String? imgScan1;
  String? imgScan2;
  String? wilayahAsalKode;
  int? virtualAccount;
  String? qrValue;

  DataPendaftaran(
      {this.idRetribusi,
      this.idKendaraan,
      this.bRetribusiKecil,
      this.bRetribusiBesar,
      this.bKartuRusak,
      this.bDenda,
      this.bDendaMax,
      this.bRekom,
      this.validasi,
      this.tglRetribusi,
      this.tglUji,
      this.lmTlt,
      this.idBkMasuk,
      this.idUji,
      this.idJns,
      this.tglmati,
      this.imgScan1,
      this.imgScan2,
      this.wilayahAsalKode,
      this.virtualAccount,
      this.qrValue});

  DataPendaftaran.fromJson(Map<String, dynamic> json) {
    idRetribusi = json['id_retribusi'];
    idKendaraan = json['id_kendaraan'];
    bRetribusiKecil = json['b_retribusi_kecil'];
    bRetribusiBesar = json['b_retribusi_besar'];
    bKartuRusak = json['b_kartu_rusak'];
    bDenda = json['b_denda'];
    bDendaMax = json['b_denda_max'];
    bRekom = json['b_rekom'];
    validasi = json['validasi'];
    tglRetribusi = json['tgl_retribusi'];
    tglUji = json['tgl_uji'];
    lmTlt = json['lm_tlt'];
    idBkMasuk = json['id_bk_masuk'];
    idUji = json['id_uji'];
    idJns = json['id_jns'];
    tglmati = json['tglmati'];
    imgScan1 = json['img_scan1'];
    imgScan2 = json['img_scan2'];
    wilayahAsalKode = json['wilayah_asal_kode'];
    virtualAccount = json['virtual_account'];
    qrValue = json['qr_value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_retribusi'] = idRetribusi;
    data['id_kendaraan'] = idKendaraan;
    data['b_retribusi_kecil'] = bRetribusiKecil;
    data['b_retribusi_besar'] = bRetribusiBesar;
    data['b_kartu_rusak'] = bKartuRusak;
    data['b_denda'] = bDenda;
    data['b_denda_max'] = bDendaMax;
    data['b_rekom'] = bRekom;
    data['validasi'] = validasi;
    data['tgl_retribusi'] = tglRetribusi;
    data['tgl_uji'] = tglUji;
    data['lm_tlt'] = lmTlt;
    data['id_bk_masuk'] = idBkMasuk;
    data['id_uji'] = idUji;
    data['id_jns'] = idJns;
    data['tglmati'] = tglmati;
    data['img_scan1'] = imgScan1;
    data['img_scan2'] = imgScan2;
    data['wilayah_asal_kode'] = wilayahAsalKode;
    data['virtual_account'] = virtualAccount;
    data['qr_value'] = qrValue;
    return data;
  }
}
