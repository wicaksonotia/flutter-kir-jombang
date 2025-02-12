import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:jombang/controllers/uji_hari_ini_controller.dart';
import 'package:jombang/utils/containers/box_container.dart';
import 'package:jombang/utils/sizes.dart';

class Info extends StatelessWidget {
  Info({
    super.key,
  });

  final UjiHariIniController controller = Get.put(UjiHariIniController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.isLoading.value
        ? Container(
            margin: const EdgeInsets.only(top: 10),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          )
        : SizedBox(
            height: 120,
            // width: MediaQuery.of(context).size.width,
            child: ListView(
              padding: const EdgeInsets.all(8),
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                // UJI PERTAMA
                BoxContainer(
                  radius: 7,
                  shadow: true,
                  width: MediaQuery.of(context).size.width * .5,
                  child: Stack(
                    children: [
                      Positioned(
                        top: -40,
                        left: -20,
                        child: Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.amber.withOpacity(0.2),
                          ),
                        ),
                      ),
                      const Positioned(
                        bottom: 5,
                        right: 5,
                        child: Image(
                          image: AssetImage('assets/images/bar-chart.png'),
                          width: 70,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                BoxContainer(
                                  radius: 5,
                                  padding: const EdgeInsets.all(1),
                                  backgroundColor: Colors.amber.shade50,
                                  child: Icon(
                                    Icons.add_box,
                                    color: Colors.amber.shade900,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  'Uji Pertama',
                                  style: TextStyle(
                                      fontSize: MySizes.fontSizeMd,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const Gap(5),
                            Text(
                              controller.resultData.value.ujiPertama.toString(),
                              style: const TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                height: 0,
                              ),
                            ),
                            const Text(
                              'Kendaraan',
                              style: TextStyle(
                                fontSize: MySizes.fontSizeMd,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                // UJI BERKALA
                BoxContainer(
                  radius: 7,
                  shadow: true,
                  width: MediaQuery.of(context).size.width * .5,
                  child: Stack(
                    children: [
                      Positioned(
                        top: -40,
                        left: -20,
                        child: Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.blue.withOpacity(0.2),
                          ),
                        ),
                      ),
                      const Positioned(
                        bottom: 5,
                        right: 5,
                        child: Image(
                          image: AssetImage('assets/images/bar-chart.png'),
                          width: 70,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                BoxContainer(
                                  radius: 5,
                                  padding: const EdgeInsets.all(1),
                                  backgroundColor: Colors.blue.shade50,
                                  child: Icon(
                                    Icons.add_box,
                                    color: Colors.blue.shade900,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  'Uji Berkala',
                                  style: TextStyle(
                                      fontSize: MySizes.fontSizeMd,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const Gap(5),
                            Text(
                              controller.resultData.value.ujiBerkala.toString(),
                              style: const TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                height: 0,
                              ),
                            ),
                            const Text(
                              'Kendaraan',
                              style: TextStyle(
                                fontSize: MySizes.fontSizeMd,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                // NUMPANG UJI MASUK
                BoxContainer(
                  radius: 7,
                  shadow: true,
                  width: MediaQuery.of(context).size.width * .5,
                  child: Stack(
                    children: [
                      Positioned(
                        top: -40,
                        left: -20,
                        child: Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.green.withOpacity(0.2),
                          ),
                        ),
                      ),
                      const Positioned(
                        bottom: 5,
                        right: 5,
                        child: Image(
                          image: AssetImage('assets/images/bar-chart.png'),
                          width: 70,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                BoxContainer(
                                  radius: 5,
                                  padding: const EdgeInsets.all(1),
                                  backgroundColor: Colors.green.shade50,
                                  child: Icon(
                                    Icons.add_box,
                                    color: Colors.green.shade900,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  'Numpang Uji Masuk',
                                  style: TextStyle(
                                      fontSize: MySizes.fontSizeMd,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const Gap(5),
                            Text(
                              controller.resultData.value.numpangMasuk
                                  .toString(),
                              style: const TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                height: 0,
                              ),
                            ),
                            const Text(
                              'Kendaraan',
                              style: TextStyle(
                                fontSize: MySizes.fontSizeMd,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                // MUTASI MASUk
                BoxContainer(
                  radius: 7,
                  shadow: true,
                  width: MediaQuery.of(context).size.width * .5,
                  child: Stack(
                    children: [
                      Positioned(
                        top: -40,
                        left: -20,
                        child: Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.red.withOpacity(0.2),
                          ),
                        ),
                      ),
                      const Positioned(
                        bottom: 5,
                        right: 5,
                        child: Image(
                          image: AssetImage('assets/images/bar-chart.png'),
                          width: 70,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                BoxContainer(
                                  radius: 5,
                                  padding: const EdgeInsets.all(1),
                                  backgroundColor: Colors.red.shade50,
                                  child: Icon(
                                    Icons.add_box,
                                    color: Colors.red.shade900,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  'Mutasi Masuk',
                                  style: TextStyle(
                                      fontSize: MySizes.fontSizeMd,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const Gap(5),
                            Text(
                              controller.resultData.value.mutasiMasuk
                                  .toString(),
                              style: const TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                height: 0,
                              ),
                            ),
                            const Text(
                              'Kendaraan',
                              style: TextStyle(
                                fontSize: MySizes.fontSizeMd,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ));
  }
}
