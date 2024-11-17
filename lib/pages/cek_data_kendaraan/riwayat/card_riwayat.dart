import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jombang/controllers/detail_riwayat_controller.dart';
import 'package:jombang/controllers/riwayat_kendaraan_controller.dart';
import 'package:jombang/utils/colors.dart';
import 'package:jombang/utils/containers/box_container.dart';
import 'package:jombang/utils/sizes.dart';

class CardRiwayat extends StatelessWidget {
  const CardRiwayat({
    super.key,
    required this.controller,
    required this.index,
  });

  final RiwayatKendaraanController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    final DetailRiwayatController detailRiwayatController =
        Get.put(DetailRiwayatController());
    return Obx(
      () => InkWell(
        onTap: () {
          // detailPersyaratanController.persyaratanHeader.value =
          //     jenisUjiController.jenisUjiItem[index].nama!;
          detailRiwayatController
              .getDetailDataKendaraan(controller.resultData[index].idHasilUji!);
          Get.toNamed('/detailriwayat');
        },
        child: BoxContainer(
          margin: const EdgeInsets.only(bottom: 10),
          height: 100,
          // padding: const EdgeInsets.all(10),
          radius: 5,
          shadow: true,
          showBorder: true,
          borderColor: Colors.grey.shade200,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  width: 120,
                  height: 30,
                  decoration: BoxDecoration(
                    color: controller.resultData[index].statusLulus == 'LULUS'
                        ? MyColors.primary
                        : MyColors.red,
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(30),
                      topLeft: Radius.circular(5),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      controller.resultData[index].statusLulus!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 35),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.resultData[index].nmUji!,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: MySizes.fontSizeLg),
                            ),
                            Text(
                              controller.resultData[index].nmPenguji!,
                            ),
                            Text(
                              controller.resultData[index].tglUji!,
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: MyColors.primary,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
