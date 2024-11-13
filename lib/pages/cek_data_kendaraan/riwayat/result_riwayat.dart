import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:jombang/controllers/riwayat_kendaraan_controller.dart';
import 'package:jombang/pages/cek_data_kendaraan/riwayat/card_riwayat.dart';

class ResultRiwayat extends StatelessWidget {
  const ResultRiwayat({super.key});

  @override
  Widget build(BuildContext context) {
    final RiwayatKendaraanController riwayatKendaraanController =
        Get.put(RiwayatKendaraanController());

    return Obx(
      () => riwayatKendaraanController.isLoadingRiwayat.value
          ? Container(
              margin: const EdgeInsets.only(top: 10),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: AnimationLimiter(
                child: ListView.builder(
                  itemCount: riwayatKendaraanController.resultData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 375),
                      child: SlideAnimation(
                        verticalOffset: 50.0,
                        child: FadeInAnimation(
                          child: CardRiwayat(
                              controller: riwayatKendaraanController,
                              index: index),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
    );
  }
}
