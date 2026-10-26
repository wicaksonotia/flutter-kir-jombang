class DetailKendaraanModel {
  dynamic status;
  String? message;
  DataDetailKendaraan? data;

  DetailKendaraanModel({
    this.status,
    this.message,
    this.data,
  });

  DetailKendaraanModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];

    data = json['data'] != null
        ? DataDetailKendaraan.fromJson(
            Map<String, dynamic>.from(json['data']),
          )
        : null;
  }

  /// Memeriksa apakah respons API berhasil.
  bool get isSuccess {
    return status == true || status == 'ok' || status == 'success';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};

    json['status'] = status;
    json['message'] = message;

    if (data != null) {
      json['data'] = data!.toJson();
    }

    return json;
  }
}

class DataDetailKendaraan {
  String? noUji;
  String? noKendaraan;
  String? merk;
  String? tipe;
  String? noChasis;
  String? noMesin;
  String? pemilik;
  String? jnsKend;
  String? matiUji;
  String? namaKomersil;
  String? jenisKaroseri;
  String? bahanUtama;
  String? panjang;
  String? lebar;
  String? tinggi;
  String? dimpanjang;
  String? dimlebar;
  String? dimtinggi;
  String? jbb;
  String? orang;
  String? barang;
  String? sb1;
  String? sb2;
  String? sb3;
  String? sb4;
  String? sb5;
  String? totalSb;
  String? jbi;
  String? mst;
  String? kondisi;
  String? imgDepan;
  String? imgBelakang;
  String? imgKanan;
  String? imgKiri;

  DataDetailKendaraan({
    this.noUji,
    this.noKendaraan,
    this.merk,
    this.tipe,
    this.noChasis,
    this.noMesin,
    this.pemilik,
    this.jnsKend,
    this.matiUji,
    this.namaKomersil,
    this.jenisKaroseri,
    this.bahanUtama,
    this.panjang,
    this.lebar,
    this.tinggi,
    this.dimpanjang,
    this.dimlebar,
    this.dimtinggi,
    this.jbb,
    this.orang,
    this.barang,
    this.sb1,
    this.sb2,
    this.sb3,
    this.sb4,
    this.sb5,
    this.totalSb,
    this.jbi,
    this.mst,
    this.kondisi,
    this.imgDepan,
    this.imgBelakang,
    this.imgKanan,
    this.imgKiri,
  });

  DataDetailKendaraan.fromJson(Map<String, dynamic> json) {
    noUji = json['no_uji']?.toString();
    noKendaraan = json['no_kendaraan']?.toString();
    merk = json['merk']?.toString();
    tipe = json['tipe']?.toString();
    noChasis = json['no_chasis']?.toString();
    noMesin = json['no_mesin']?.toString();
    pemilik = json['pemilik']?.toString();
    jnsKend = json['jns_kend']?.toString();
    matiUji = json['mati_uji']?.toString();
    namaKomersil = json['nama_komersil']?.toString();
    jenisKaroseri = json['jenis_karoseri']?.toString();
    bahanUtama = json['bahan_utama']?.toString();
    panjang = json['panjang']?.toString();
    lebar = json['lebar']?.toString();
    tinggi = json['tinggi']?.toString();
    dimpanjang = json['dimpanjang']?.toString();
    dimlebar = json['dimlebar']?.toString();
    dimtinggi = json['dimtinggi']?.toString();
    jbb = json['jbb']?.toString();
    orang = json['orang']?.toString();
    barang = json['barang']?.toString();
    sb1 = json['sb1']?.toString();
    sb2 = json['sb2']?.toString();
    sb3 = json['sb3']?.toString();
    sb4 = json['sb4']?.toString();
    sb5 = json['sb5']?.toString();
    totalSb = json['total_sb']?.toString();
    jbi = json['jbi']?.toString();
    mst = json['mst']?.toString();
    kondisi = json['kondisi']?.toString();
    imgDepan = json['img_depan']?.toString();
    imgBelakang = json['img_belakang']?.toString();
    imgKanan = json['img_kanan']?.toString();
    imgKiri = json['img_kiri']?.toString();
  }

  Map<String, dynamic> toJson() {
    return {
      'no_uji': noUji,
      'no_kendaraan': noKendaraan,
      'merk': merk,
      'tipe': tipe,
      'no_chasis': noChasis,
      'no_mesin': noMesin,
      'pemilik': pemilik,
      'jns_kend': jnsKend,
      'mati_uji': matiUji,
      'nama_komersil': namaKomersil,
      'jenis_karoseri': jenisKaroseri,
      'bahan_utama': bahanUtama,
      'panjang': panjang,
      'lebar': lebar,
      'tinggi': tinggi,
      'dimpanjang': dimpanjang,
      'dimlebar': dimlebar,
      'dimtinggi': dimtinggi,
      'jbb': jbb,
      'orang': orang,
      'barang': barang,
      'sb1': sb1,
      'sb2': sb2,
      'sb3': sb3,
      'sb4': sb4,
      'sb5': sb5,
      'total_sb': totalSb,
      'jbi': jbi,
      'mst': mst,
      'kondisi': kondisi,
      'img_depan': imgDepan,
      'img_belakang': imgBelakang,
      'img_kanan': imgKanan,
      'img_kiri': imgKiri,
    };
  }
}
