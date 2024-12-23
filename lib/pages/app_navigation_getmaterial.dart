import 'package:get/get.dart';
import 'package:jombang/bindings/pendaftaran_binding.dart';
import 'package:jombang/bindings/riwayat_binding.dart';
import 'package:jombang/pages/cek_data_kendaraan/cek_data/home_cek_data.dart';
import 'package:jombang/pages/cek_data_kendaraan/hasil_uji/home_hasil_uji.dart';
import 'package:jombang/pages/cek_data_kendaraan/riwayat/detail_riwayat.dart';
import 'package:jombang/pages/cek_data_kendaraan/riwayat/home_riwayat.dart';
import 'package:jombang/pages/home/home.dart';
import 'package:jombang/pages/informasi/informasi.dart';
import 'package:jombang/pages/login_page.dart';
import 'package:jombang/pages/pendaftaran/pendaftaran.dart';
import 'package:jombang/pages/persyaratan/detail_persyaratan.dart';
import 'package:jombang/pages/persyaratan/persyaratan.dart';
import 'package:jombang/pages/profile/profile.dart';

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

  static List<GetPage> routes = [
    GetPage(page: () => LoginPage(), name: login),
    GetPage(page: () => HomePage(), name: home),
    GetPage(
        page: () => const PendaftaranPage(),
        name: pendaftaran,
        binding: PendaftaranBinding()),
    GetPage(page: () => const HomeCekData(), name: cekdatakendaraan),
    GetPage(page: () => const HomeHasilUji(), name: cekhasiluji),
    GetPage(
        page: () => const HomeRiwayat(),
        name: riwayatkendaraan,
        binding: RiwayatBinding()),
    GetPage(page: () => DetailRiwayat(), name: detailriwayat),
    GetPage(page: () => const PersyaratanPage(), name: persyaratan),
    GetPage(page: () => const DetailPersyaratanPage(), name: detailpersyaratan),
    // GetPage(
    //   page: () => const DetailPersyaratanPage(),
    //   name: '/detailpersyaratan',
    //   transition: Transition.rightToLeft,
    //   transitionDuration: (const Duration(milliseconds: 300)),
    // ),
    GetPage(page: () => const InformasiPage(), name: '/informasi'),
    GetPage(page: () => const Profile(), name: '/profile'),
  ];
}
