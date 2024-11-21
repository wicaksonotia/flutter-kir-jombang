import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:jombang/controllers/login_controller.dart';
import 'package:jombang/pages/home/berita.dart';
import 'package:jombang/pages/home/info.dart';
import 'package:jombang/pages/home/see_all_container.dart';
import 'package:jombang/utils/colors.dart';
import 'package:jombang/pages/home/menu.dart';
import 'package:jombang/utils/containers/box_container.dart';
import 'package:jombang/pages/home/carousel.dart';
import 'package:jombang/utils/sizes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.put(LoginController());

    return Obx(() {
      print('<<<<====isShowLogout===${loginController.isShowLogout}=====>>>>>');
      print('<<<<====islogin===${loginController.isLogin}=====>>>>>');
      return Scaffold(
        backgroundColor: MyColors.form,
        body: MediaQuery.removePadding(
          context: context,
          removeTop: true,
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
                                        'assets/images/logo_dishub.png'),
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
                                        'Dishub Kabupaten Jombang',
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
                            Builder(
                              builder: (context) {
                                if (loginController.isLogin == true ||
                                    loginController.isShowLogout.value) {
                                  return InkWell(
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
                                  );
                                }

                                return Container();
                              },
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
              Info(),

              // CAROUSEL SLIDER
              const Gap(20),
              CarouselContainer(),

              // BERITA
              const Gap(20),
              const SeeAllContainer(
                header: "Giat dan Agenda",
                subHeader: "Info berita terkini terkati DISHUB",
                buttonLihatSemua: false,
              ),
              const Berita(),
            ],
          ),
        ),
      );
    });
  }
}
