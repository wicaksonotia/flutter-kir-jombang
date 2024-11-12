import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:jombang/controllers/search_bar_controller.dart';
import 'package:jombang/utils/containers/box_container.dart';
import 'package:jombang/utils/sizes.dart';

class ResultHasilUji extends GetWidget<SearchBarController> {
  const ResultHasilUji({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchBarController());

    return Obx(() {
      if (controller.isLoadingHasilUji.value) {
        return Container(
          margin: const EdgeInsets.only(top: 10),
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      } else {
        print(controller.resultDataHasilUji.value.hasilPrauji);
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              // ==========================
              // INDETIFIKASI KENDARAAN
              // ==========================
              BoxContainer(
                padding: const EdgeInsets.all(10),
                radius: 5,
                showBorder: true,
                borderColor: Colors.grey.shade200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextHeader(
                      nama: 'Hasil Pengujian',
                    ),
                    const Gap(10),
                    Row(
                      children: [
                        const TextLeft(nama: 'No Uji'),
                        const Spacer(),
                        TextRight(
                          nama:
                              controller.resultDataHasilUji.value.noUji ?? '-',
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const TextLeft(nama: 'No Kendaraan'),
                        const Spacer(),
                        TextRight(
                          nama:
                              controller.resultDataHasilUji.value.noKendaraan ??
                                  '-',
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const TextLeft(nama: 'Nama Pemilik'),
                        const Spacer(),
                        TextRight(
                          nama: controller.resultDataHasilUji.value.pemilik ??
                              '-',
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const TextLeft(nama: 'Prauji'),
                        const Spacer(),
                        TextRight(
                          nama:
                              controller.resultDataHasilUji.value.hasilPrauji ??
                                  '-',
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const TextLeft(nama: 'Emisi'),
                        const Spacer(),
                        TextRight(
                          nama:
                              controller.resultDataHasilUji.value.hasilEmisi ??
                                  '-',
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const TextLeft(nama: 'Lampu'),
                        const Spacer(),
                        TextRight(
                          nama:
                              controller.resultDataHasilUji.value.hasilLampu ??
                                  '-',
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const TextLeft(nama: 'Pitlift'),
                        const Spacer(),
                        TextRight(
                          nama: controller
                                  .resultDataHasilUji.value.hasilPitlift ??
                              '-',
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const TextLeft(nama: 'Rem'),
                        const Spacer(),
                        TextRight(
                          nama:
                              controller.resultDataHasilUji.value.hasilBreak ??
                                  '-',
                        )
                      ],
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
                        text: 'Dokumenasi Foto Kendaraan ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: MySizes.fontSizeMd,
                            color: Colors.black),
                        children: [
                          TextSpan(
                            text: '*',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.red),
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
                          width: MediaQuery.of(context).size.width * .43,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: controller.resultData.value.imgDepan ==
                                          null ||
                                      controller.resultData.value.imgDepan == ""
                                  ? const AssetImage(
                                      'assets/images/no_image.png')
                                  : MemoryImage(
                                      const Base64Decoder().convert(controller
                                          .resultData.value.imgDepan!),
                                    ),
                              fit: controller.resultData.value.imgDepan ==
                                          null ||
                                      controller.resultData.value.imgDepan == ""
                                  ? BoxFit.fitHeight
                                  : BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * .43,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: controller.resultData.value.imgBelakang ==
                                          null ||
                                      controller.resultData.value.imgBelakang ==
                                          ""
                                  ? const AssetImage(
                                      'assets/images/no_image.png')
                                  : MemoryImage(
                                      const Base64Decoder().convert(controller
                                          .resultData.value.imgBelakang!),
                                    ),
                              fit: controller.resultData.value.imgBelakang ==
                                          null ||
                                      controller.resultData.value.imgBelakang ==
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
                          width: MediaQuery.of(context).size.width * .43,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: controller.resultData.value.imgKanan ==
                                          null ||
                                      controller.resultData.value.imgKanan == ""
                                  ? const AssetImage(
                                      'assets/images/no_image.png')
                                  : MemoryImage(
                                      const Base64Decoder().convert(controller
                                          .resultData.value.imgKanan!),
                                    ),
                              fit: controller.resultData.value.imgKanan ==
                                          null ||
                                      controller.resultData.value.imgKanan == ""
                                  ? BoxFit.fitHeight
                                  : BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * .43,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: controller.resultData.value.imgKiri ==
                                          null ||
                                      controller.resultData.value.imgKiri == ""
                                  ? const AssetImage(
                                      'assets/images/no_image.png')
                                  : MemoryImage(
                                      const Base64Decoder().convert(
                                          controller.resultData.value.imgKiri!),
                                    ),
                              fit: controller.resultData.value.imgKiri ==
                                          null ||
                                      controller.resultData.value.imgKiri == ""
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
    });
  }
}

class TextHeader extends StatelessWidget {
  const TextHeader({
    super.key,
    required this.nama,
  });

  final String nama;

  @override
  Widget build(BuildContext context) {
    return Text(
      nama,
      style: const TextStyle(
          fontWeight: FontWeight.bold, fontSize: MySizes.fontSizeLg),
    );
  }
}

class TextLeft extends StatelessWidget {
  const TextLeft({
    super.key,
    required this.nama,
  });

  final String nama;

  @override
  Widget build(BuildContext context) {
    return Text(
      nama,
      style: const TextStyle(color: Colors.grey, height: 1.7),
    );
  }
}

class TextRight extends StatelessWidget {
  const TextRight({
    super.key,
    required this.nama,
  });

  final String nama;

  @override
  Widget build(BuildContext context) {
    return Text(
      nama,
      textAlign: TextAlign.right,
      style: const TextStyle(color: Colors.black),
    );
  }
}
