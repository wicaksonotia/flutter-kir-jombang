import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:jombang/controllers/berita_controller.dart';
import 'package:jombang/controllers/carousel_controller.dart';
import 'package:jombang/controllers/login_controller.dart';
import 'package:jombang/controllers/uji_hari_ini_controller.dart';
import 'package:jombang/pages/home/berita.dart';
import 'package:jombang/pages/home/uji_hari_ini.dart';
import 'package:jombang/pages/home/menu.dart';
import 'package:jombang/pages/home/carousel.dart';
import 'package:jombang/pages/home/widgets/home_header.dart';
import 'package:jombang/pages/home/widgets/home_menu_section.dart';
import 'package:jombang/pages/home/widgets/home_section_header.dart';
import 'package:jombang/utils/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final LoginController loginController;
  late final UjiHariIniController ujiHariIniController;
  late final BeritaController beritaController;
  late final CarouselBannerController carouselController;

  @override
  void initState() {
    super.initState();

    loginController = Get.find<LoginController>();

    ujiHariIniController = Get.isRegistered<UjiHariIniController>()
        ? Get.find<UjiHariIniController>()
        : Get.put(UjiHariIniController());

    beritaController = Get.isRegistered<BeritaController>()
        ? Get.find<BeritaController>()
        : Get.put(BeritaController());

    carouselController = Get.isRegistered<CarouselBannerController>()
        ? Get.find<CarouselBannerController>()
        : Get.put(CarouselBannerController());
  }

  Future<void> _refresh() async {
    await Future.wait<void>([
      ujiHariIniController.fetchData(),
      beritaController.fetchData(),
      carouselController.fetchData(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final safeTop = MediaQuery.of(context).padding.top;

    const headerContentHeight = 20.0 + 46.0 + 108.0;
    final headerHeight = safeTop + headerContentHeight;
    final menuOverlap = headerHeight * 0.72 - 10;

    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FC),
      body: Stack(
        children: [
          // Konten yang bisa digulir.
          Positioned.fill(
            child: RefreshIndicator(
              color: MyColors.primary,
              backgroundColor: Colors.white,
              onRefresh: _refresh,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics(),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Ruang awal agar menu menumpang di lengkungan header.
                    SizedBox(height: menuOverlap),

                    // Menu layanan.
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: HomeMenuSection(
                        child: Menu(),
                      ),
                    ),

                    // Banner informasi.
                    Padding(
                      padding: const EdgeInsets.only(top: 14),
                      child: CarouselContainer(
                        carouselController: carouselController,
                      ),
                    ),

                    // Statistik uji hari ini.
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const HomeSectionHeader(
                            title: 'Uji hari ini',
                            subtitle: 'Ringkasan kendaraan yang dilayani',
                          ),
                          const SizedBox(height: 12),
                          UjiHariIni(
                            ujiHariIniController: ujiHariIniController,
                          ),
                        ],
                      ),
                    ),

                    // Berita dan agenda.
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 26, 20, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const HomeSectionHeader(
                            title: 'Giat dan agenda',
                            subtitle: 'Berita dan informasi terbaru Dishub',
                          ),
                          const SizedBox(height: 12),
                          Berita(
                            beritaController: beritaController,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 28),
                  ],
                ),
              ),
            ),
          ),

          // Header dirender terakhir agar berada di depan konten.
          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: HomeHeader(),
          ),
        ],
      ),
    );
  }
}
