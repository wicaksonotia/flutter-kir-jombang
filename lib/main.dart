import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return MaterialApp.router(
    //   debugShowCheckedModeBanner: false,
    //   routerConfig: AppNavigation.router,
    // );
    return GetMaterialApp(
      getPages: [
        GetPage(page: () => const LoginPage(), name: '/login'),
        GetPage(page: () => const HomePage(), name: '/home'),
        GetPage(page: () => const PendaftaranPage(), name: '/pendaftaran'),
        GetPage(page: () => const HomeCekData(), name: '/cekdatakendaraan'),
        GetPage(page: () => const HomeHasilUji(), name: '/cekhasiluji'),
        GetPage(page: () => const HomeRiwayat(), name: '/riwayatkendaraan'),
        GetPage(page: () => const DetailRiwayat(), name: '/detailriwayat'),
        GetPage(page: () => const PersyaratanPage(), name: '/persyaratan'),
        GetPage(
            page: () => const DetailPersyaratanPage(),
            name: '/detailpersyaratan'),
        // GetPage(
        //   page: () => const DetailPersyaratanPage(),
        //   name: '/detailpersyaratan',
        //   transition: Transition.rightToLeft,
        //   transitionDuration: (const Duration(milliseconds: 300)),
        // ),
        GetPage(page: () => const InformasiPage(), name: '/informasi'),
        GetPage(page: () => const Profile(), name: '/profile'),
      ],
      defaultTransition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
      debugShowCheckedModeBanner: false,
      // home: HomePage(),
      initialRoute: '/home',
    );
  }
}
