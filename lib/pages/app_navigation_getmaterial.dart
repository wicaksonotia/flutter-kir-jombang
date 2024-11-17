import 'package:get/get.dart';
import 'package:jombang/pages/cek_data_kendaraan/cek_data/home_cek_data.dart';
import 'package:jombang/pages/cek_data_kendaraan/hasil_uji/home_hasil_uji.dart';
import 'package:jombang/pages/cek_data_kendaraan/riwayat/detail_riwayat.dart';
import 'package:jombang/pages/cek_data_kendaraan/riwayat/home_riwayat.dart';
import 'package:jombang/pages/home/home.dart';
import 'package:jombang/pages/login_page.dart';
import 'package:jombang/pages/pendaftaran/pendaftaran.dart';
import 'package:jombang/pages/persyaratan/detail_persyaratan.dart';
import 'package:jombang/pages/persyaratan/persyaratan.dart';

class RouterClass {
  static String login = "/login";
  static String home = "/home";
  static String pendaftaran = "/pendaftaran";
  static String cekdatakendaraan = "/cekdatakendaraan";
  static String cekhasiluji = "/cekhasiluji";
  static String riwayatkendaraan = "/riwayatkendaraan";
  static String detailriwayat = "/detailriwayat";
  static String persyaratan = "/persyaratan";
  static String detailpersyaratan = "/detailpersyaratan";
  static String informasi = "/informasi";
  static String detailinformasi = "/detailinformasi";

  static String gotoLogin() => login;
  static String gotoHome() => home;
  static String gotoPendaftaran() => pendaftaran;
  static String gotoCekDataKendaraan() => cekdatakendaraan;
  static String gotoCekHasilUji() => cekhasiluji;
  static String gotoCekRiwayat() => riwayatkendaraan;
  static String clickDetailRiwayat() => detailriwayat;
  static String gotoPersyaratan() => persyaratan;
  static String clickDetailPersyaratan() => detailpersyaratan;
  static String gotoInformasi() => informasi;
  static String clickDetailInformasi() => detailinformasi;

  static List<GetPage> routes = [
    GetPage(page: () => const LoginPage(), name: login),
    GetPage(
      page: () => const HomePage(),
      name: home,
      // transition: Transition.fade,
      // transitionDuration: (const Duration(seconds: 1)),
    ),
    GetPage(page: () => const PendaftaranPage(), name: pendaftaran),
    GetPage(page: () => const HomeCekData(), name: cekdatakendaraan),
    GetPage(page: () => const HomeHasilUji(), name: cekhasiluji),
    GetPage(page: () => const HomeRiwayat(), name: riwayatkendaraan),
    GetPage(page: () => const DetailRiwayat(), name: detailriwayat),
    GetPage(page: () => const PersyaratanPage(), name: persyaratan),
    GetPage(page: () => const DetailPersyaratanPage(), name: detailpersyaratan),
  ];
}
