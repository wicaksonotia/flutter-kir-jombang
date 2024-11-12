class DetailKendaraanModel {
  String? status;
  String? message;
  DataDetaiilKendaraan? data;

  DetailKendaraanModel({this.status, this.message, this.data});

  DetailKendaraanModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null
        ? new DataDetaiilKendaraan.fromJson(json['data'])
        : null;
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

class DataDetaiilKendaraan {
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

  DataDetaiilKendaraan(
      {this.noUji,
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
      this.imgKiri});

  DataDetaiilKendaraan.fromJson(Map<String, dynamic> json) {
    noUji = json['no_uji'];
    noKendaraan = json['no_kendaraan'];
    merk = json['merk'];
    tipe = json['tipe'];
    noChasis = json['no_chasis'];
    noMesin = json['no_mesin'];
    pemilik = json['pemilik'];
    jnsKend = json['jns_kend'];
    matiUji = json['mati_uji'];
    namaKomersil = json['nama_komersil'];
    jenisKaroseri = json['jenis_karoseri'];
    bahanUtama = json['bahan_utama'];
    panjang = json['panjang'];
    lebar = json['lebar'];
    tinggi = json['tinggi'];
    dimpanjang = json['dimpanjang'];
    dimlebar = json['dimlebar'];
    dimtinggi = json['dimtinggi'];
    jbb = json['jbb'];
    orang = json['orang'];
    barang = json['barang'];
    sb1 = json['sb1'];
    sb2 = json['sb2'];
    sb3 = json['sb3'];
    sb4 = json['sb4'];
    sb5 = json['sb5'];
    totalSb = json['total_sb'];
    jbi = json['jbi'];
    mst = json['mst'];
    kondisi = json['kondisi'];
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
    data['jns_kend'] = jnsKend;
    data['mati_uji'] = matiUji;
    data['nama_komersil'] = namaKomersil;
    data['jenis_karoseri'] = jenisKaroseri;
    data['bahan_utama'] = bahanUtama;
    data['panjang'] = panjang;
    data['lebar'] = lebar;
    data['tinggi'] = tinggi;
    data['dimpanjang'] = dimpanjang;
    data['dimlebar'] = dimlebar;
    data['dimtinggi'] = dimtinggi;
    data['jbb'] = jbb;
    data['orang'] = orang;
    data['barang'] = barang;
    data['sb1'] = sb1;
    data['sb2'] = sb2;
    data['sb3'] = sb3;
    data['sb4'] = sb4;
    data['sb5'] = sb5;
    data['total_sb'] = totalSb;
    data['jbi'] = jbi;
    data['mst'] = mst;
    data['kondisi'] = kondisi;
    data['img_depan'] = imgDepan;
    data['img_belakang'] = imgBelakang;
    data['img_kanan'] = imgKanan;
    data['img_kiri'] = imgKiri;
    return data;
  }
}
