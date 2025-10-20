class ApiEndPoints {
  static const String baseUrl = 'http://103.146.132.198/apiandroid/';
  static _AuthEndPoints authEndpoints = _AuthEndPoints();
}

class _AuthEndPoints {
  // final String registerEmail = 'authaccount/registration';
  final String login = 'login';
  final String menu = 'kirmenu';
  final String slider = 'kirslider';
  final String berita = 'kirberita';
  final String jenisuji = 'kirjenisuji';
  final String detailpersyaratan = 'kirdetailpersyaratan';
  final String detailkendaraan = 'kirdetailkendaraan';
  final String hasilujikendaraan = 'kirhasiluji';
  final String keterangantl = 'kirketerangantidaklulus';
  final String riwayatkendaraan = 'kirriwayatkendaraan';
  final String detailriwayatkendaraan = 'kirdetailriwayat';
  final String daftarretribusi = 'kircreateretribusi';
  final String listretribusi = 'kirlistretribusi';
  final String ujihariini = 'kirujihariini';
}
