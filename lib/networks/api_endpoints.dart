class ApiEndPoints {
  // static const String baseUrl = 'https://ujikir.jombangkab.go.id/api/v1/';
  static const String baseUrl = 'http://192.168.1.19:8000/api/v1/';
  static _AuthEndPoints authEndpoints = _AuthEndPoints();
}

class _AuthEndPoints {
  // final String registerEmail = 'authaccount/registration';
  final String login = 'login';
  final String menu = 'menu';
  final String slider = 'slider';
  final String berita = 'berita';
  final String jenisuji = 'jenisujipersyaratan';
  final String detailpersyaratan = 'detailpersyaratan';
  final String detailkendaraan = 'kendaraan/detail';
  final String hasilujikendaraan = 'kendaraan/hasil-uji';
  final String keterangantl = 'kendaraan/keterangan-tidak-lulus';
  final String riwayatkendaraan = 'kendaraan/riwayat';
  final String detailriwayatkendaraan = 'kendaraan/riwayat/detail';
  final String daftarretribusi = 'kircreateretribusi';
  final String listretribusi = 'kirlistretribusi';
  final String ujihariini = 'uji/total-hari-ini';
}
