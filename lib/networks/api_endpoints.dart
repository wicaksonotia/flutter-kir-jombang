class ApiEndPoints {
  static const String baseUrl = 'http://103.184.181.9/api/';
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
}
