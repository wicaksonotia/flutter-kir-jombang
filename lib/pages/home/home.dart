import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sampang/controllers/berita_controller.dart';
import 'package:sampang/controllers/carousel_controller.dart';
import 'package:sampang/controllers/login_controller.dart';
import 'package:sampang/controllers/uji_hari_ini_controller.dart';
import 'package:sampang/pages/home/berita.dart';
import 'package:sampang/pages/home/info.dart';
import 'package:sampang/pages/home/see_all_container.dart';
// import 'package:sampang/pages/home/thumbnail_berita.dart';
import 'package:sampang/utils/colors.dart';
import 'package:sampang/pages/home/menu.dart';
import 'package:sampang/utils/containers/box_container.dart';
import 'package:sampang/pages/home/carousel.dart';
import 'package:sampang/utils/sizes.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});
  LoginController loginController = Get.find<LoginController>();
  final UjiHariIniController ujiHariIniController =
      Get.put(UjiHariIniController());
  final BeritaController beritaController = Get.put(BeritaController());
  final CarouselBannerController carouselController =
      Get.put(CarouselBannerController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: MyColors.form,
        body: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: RefreshIndicator(
            onRefresh: () async {
              ujiHariIniController.fetchData();
              beritaController.fetchData();
              carouselController.fetchData();
            },
            child: ListView(
              children: [
                // HEADER
                Stack(
                  children: [
                    // BACKGROUND HEADER
                    Container(
                      height: 175,
                      // color: MyColors.primary,
                      decoration: const BoxDecoration(
                        color: MyColors.primary,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                      ),
                    ),

                    Positioned(
                      top: -100,
                      left: -50,
                      child: Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.white.withOpacity(0.2),
                        ),
                      ),
                    ),

                    Positioned(
                      top: 50,
                      right: 10,
                      child: Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.white.withOpacity(0.2),
                        ),
                      ),
                    ),

                    // HEADER dan MENU
                    Container(
                      margin: const EdgeInsets.only(top: 40),
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // HEADER
                          Row(
                            children: [
                              const SizedBox(
                                child: Row(
                                  children: [
                                    Image(
                                      image: AssetImage(
                                          'assets/images/logo_dishub_sampang.png'),
                                      width: 50,
                                      height: 50,
                                    ),
                                    SizedBox(
                                      width: 7,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'KIR',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: MySizes.fontSizeLg,
                                          ),
                                        ),
                                        Text(
                                          'Dishub Kabupaten Sampang',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: MySizes.fontSizeMd,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const Spacer(),
                              Visibility(
                                visible:
                                    loginController.isLogin.value == true ||
                                        loginController.isShowLogout.value,
                                child: InkWell(
                                  onTap: () =>
                                      loginController.openBottomSheet(),
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: const BoxDecoration(
                                      color: MyColors.orange,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(7),
                                        bottomLeft: Radius.circular(7),
                                      ),
                                    ),
                                    child: const Row(
                                      children: [
                                        Icon(
                                          Icons.logout_rounded,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'Logout',
                                          style: TextStyle(
                                              fontSize: MySizes.fontSizeSm,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Gap(15),
                          // MENU
                          Center(
                            child: BoxContainer(
                              margin:
                                  const EdgeInsets.only(right: 10, bottom: 10),
                              padding: const EdgeInsets.all(10),
                              width: MediaQuery.of(context).size.width * .85,
                              height: 170,
                              shadow: true,
                              radius: 7,
                              child: Menu(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                // DATA KENDARAAN UJI
                const Gap(10),
                const SeeAllContainer(
                  header: "Uji hari ini",
                  subHeader: "Info pemohon yang terdaftar hari ini",
                  buttonLihatSemua: false,
                ),
                Info(ujiHariIniController: ujiHariIniController),

                // CAROUSEL SLIDER
                const Gap(20),
                CarouselContainer(carouselController: carouselController),

                // BERITA
                const Gap(20),
                const SeeAllContainer(
                  header: "Giat dan Agenda",
                  subHeader: "Info berita terkini terkati DISHUB",
                  buttonLihatSemua: false,
                ),
                Berita(beritaController: beritaController),
                // const ThumbnailBerita(),
              ],
            ),
          ),
        ),
      );
    });
  }
}
