import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sampang/controllers/detail_riwayat_controller.dart';
import 'package:sampang/pages/cek_data_kendaraan/riwayat/identitas_kendaraan.dart';
import 'package:sampang/pages/cek_data_kendaraan/riwayat/identitas_pemilik.dart';
import 'package:sampang/pages/cek_data_kendaraan/riwayat/pendaftaran.dart';
import 'package:sampang/pages/cek_data_kendaraan/riwayat/uji_emisi.dart';
import 'package:sampang/pages/cek_data_kendaraan/riwayat/uji_lampu.dart';
import 'package:sampang/pages/cek_data_kendaraan/riwayat/uji_lampu_tidak_lulus.dart';
import 'package:sampang/pages/cek_data_kendaraan/riwayat/uji_pitlift.dart';
import 'package:sampang/pages/cek_data_kendaraan/riwayat/uji_pitlift_tidak_lulus.dart';
import 'package:sampang/pages/cek_data_kendaraan/riwayat/uji_prauji.dart';
import 'package:sampang/pages/cek_data_kendaraan/riwayat/uji_prauji_tidak_lulus.dart';
import 'package:sampang/pages/cek_data_kendaraan/riwayat/uji_rem.dart';
import 'package:sampang/pages/cek_data_kendaraan/riwayat/uji_rem_tidak_lulus.dart';
import 'package:sampang/pages/persyaratan/background_header.dart';
import 'package:sampang/utils/containers/box_container.dart';
import 'package:sampang/utils/sizes.dart';

class DetailRiwayat extends StatelessWidget {
  DetailRiwayat({super.key});
  final DetailRiwayatController controller = Get.put(DetailRiwayatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          title: const Text(
            'Detail Riwayat',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ),
      ),
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Column(
          children: [
            const BackgroundHeader(),
            SizedBox(
              height: MediaQuery.of(context).size.height * .89,
              child: Obx(
                () {
                  if (controller.isLoading.value) {
                    return Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else {
                    return SingleChildScrollView(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          BoxContainer(
                            padding: const EdgeInsets.all(10),
                            radius: 5,
                            showBorder: true,
                            borderColor: Colors.grey.shade200,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                RichText(
                                  text: const TextSpan(
                                    text: 'Penandatangan Hasil Uji ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: MySizes.fontSizeMd,
                                        color: Colors.black),
                                    children: [
                                      TextSpan(
                                        text: '*',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red),
                                      ),
                                    ],
                                  ),
                                ),
                                const Gap(10),
                                Text(
                                  controller.resultData.value.nmPenguji!,
                                  style: const TextStyle(
                                      fontSize: MySizes.fontSizeLg),
                                )
                              ],
                            ),
                          ),

                          // ==========================
                          // IDENTITAS KENDARAAN
                          // ==========================
                          IdentitasKendaraan(controller: controller),

                          // ==========================
                          // IDENTITAS PEMILIK
                          // ==========================
                          const Gap(10),
                          IdentitasPemilik(controller: controller),

                          // ==========================
                          // PENDAFTARAN
                          // ==========================
                          const Gap(10),
                          Pendaftaran(controller: controller),

                          // ==========================
                          // PEMERIKSAAN KENDARAAN
                          // ==========================
                          const Gap(10),
                          BoxContainer(
                            padding: const EdgeInsets.all(10),
                            radius: 5,
                            showBorder: true,
                            borderColor: Colors.grey.shade200,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: const TextSpan(
                                    text: 'Pemeriksaan Kendaraan ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: MySizes.fontSizeMd,
                                        color: Colors.black),
                                    children: [
                                      TextSpan(
                                        text: '*',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red),
                                      ),
                                    ],
                                  ),
                                ),

                                // PRAUJI
                                const Gap(10),
                                Builder(
                                  builder: (context) {
                                    if (controller
                                        .resultData.value.lulusPrauji!) {
                                      return Prauji(controller: controller);
                                    } else {
                                      return PraujiTidakLulus(
                                          controller: controller);
                                    }
                                  },
                                ),

                                // EMISI
                                const Gap(10),
                                Emisi(controller: controller),

                                // PITLIFT
                                const Gap(10),
                                Builder(
                                  builder: (context) {
                                    if (controller
                                        .resultData.value.lulusPitlift!) {
                                      return Pitlift(controller: controller);
                                    }
                                    return PitliftTidakLulus(
                                        controller: controller);
                                  },
                                ),

                                // LAMPU
                                const Gap(10),
                                Builder(
                                  builder: (context) {
                                    if (controller
                                        .resultData.value.lulusLampu!) {
                                      return Lampu(controller: controller);
                                    }
                                    return LampuTidakLulus(
                                        controller: controller);
                                  },
                                ),

                                // REM
                                const Gap(10),
                                Builder(
                                  builder: (context) {
                                    if (controller
                                        .resultData.value.lulusBreak!) {
                                      return Rem(controller: controller);
                                    }
                                    return RemTidakLulus(
                                        controller: controller);
                                  },
                                ),
                              ],
                            ),
                          ),

                          // ==========================
                          // FOTO KENDARAAN
                          // ==========================
                          const Gap(10),
                          BoxContainer(
                            padding: const EdgeInsets.all(10),
                            radius: 5,
                            showBorder: true,
                            borderColor: Colors.grey.shade200,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: const TextSpan(
                                    text: 'Pemeriksaan Kendaraan ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: MySizes.fontSizeMd,
                                        color: Colors.black),
                                    children: [
                                      TextSpan(
                                        text: '*',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red),
                                      ),
                                    ],
                                  ),
                                ),
                                // const TextHeader(
                                //   nama: 'Dokumenasi Foto Kendaraan',
                                // ),
                                const Gap(10),
                                Row(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          .43,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          image: controller.resultData.value
                                                          .imgDepan ==
                                                      null ||
                                                  controller.resultData.value
                                                          .imgDepan ==
                                                      ""
                                              ? const AssetImage(
                                                  'assets/images/no_image.png')
                                              : MemoryImage(
                                                  const Base64Decoder().convert(
                                                      controller.resultData
                                                          .value.imgDepan!),
                                                ),
                                          fit: controller.resultData.value
                                                          .imgDepan ==
                                                      null ||
                                                  controller.resultData.value
                                                          .imgDepan ==
                                                      ""
                                              ? BoxFit.fitHeight
                                              : BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          .43,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          image: controller.resultData.value
                                                          .imgBelakang ==
                                                      null ||
                                                  controller.resultData.value
                                                          .imgBelakang ==
                                                      ""
                                              ? const AssetImage(
                                                  'assets/images/no_image.png')
                                              : MemoryImage(
                                                  const Base64Decoder().convert(
                                                      controller.resultData
                                                          .value.imgBelakang!),
                                                ),
                                          fit: controller.resultData.value
                                                          .imgBelakang ==
                                                      null ||
                                                  controller.resultData.value
                                                          .imgBelakang ==
                                                      ""
                                              ? BoxFit.fitHeight
                                              : BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const Gap(20),
                                Row(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          .43,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          image: controller.resultData.value
                                                          .imgKanan ==
                                                      null ||
                                                  controller.resultData.value
                                                          .imgKanan ==
                                                      ""
                                              ? const AssetImage(
                                                  'assets/images/no_image.png')
                                              : MemoryImage(
                                                  const Base64Decoder().convert(
                                                      controller.resultData
                                                          .value.imgKanan!),
                                                ),
                                          fit: controller.resultData.value
                                                          .imgKanan ==
                                                      null ||
                                                  controller.resultData.value
                                                          .imgKanan ==
                                                      ""
                                              ? BoxFit.fitHeight
                                              : BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          .43,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          image: controller.resultData.value
                                                          .imgKiri ==
                                                      null ||
                                                  controller.resultData.value
                                                          .imgKiri ==
                                                      ""
                                              ? const AssetImage(
                                                  'assets/images/no_image.png')
                                              : MemoryImage(
                                                  const Base64Decoder().convert(
                                                      controller.resultData
                                                          .value.imgKiri!),
                                                ),
                                          fit: controller.resultData.value
                                                          .imgKiri ==
                                                      null ||
                                                  controller.resultData.value
                                                          .imgKiri ==
                                                      ""
                                              ? BoxFit.fitHeight
                                              : BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
