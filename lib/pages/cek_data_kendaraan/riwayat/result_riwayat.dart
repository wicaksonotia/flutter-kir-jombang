import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:sampang/controllers/riwayat_kendaraan_controller.dart';
import 'package:sampang/pages/cek_data_kendaraan/riwayat/card_riwayat.dart';

class ResultRiwayat extends StatelessWidget {
  ResultRiwayat({super.key});
  final RiwayatKendaraanController riwayatKendaraanController =
      Get.find<RiwayatKendaraanController>();

  @override
  Widget build(BuildContext context) {
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
