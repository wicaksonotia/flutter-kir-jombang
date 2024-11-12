import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:jombang/controllers/detail_kendaraan_controller.dart';
import 'package:jombang/utils/containers/box_container.dart';
import 'package:jombang/utils/sizes.dart';

class ResultCekData extends StatelessWidget {
  const ResultCekData({super.key});

  @override
  Widget build(BuildContext context) {
    final DetailKendaraanController controller =
        Get.put(DetailKendaraanController());

    return Obx(() {
      if (controller.isLoadingDetailKendaraan.value) {
        return Container(
          margin: const EdgeInsets.only(top: 10),
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      } else {
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
                      nama: 'Indentifikasi Kendaraan',
                    ),
                    const Gap(10),
                    Row(
                      children: [
                        const TextLeft(nama: 'No Uji'),
                        const Spacer(),
                        TextRight(
                          nama: controller.resultData.value.noUji ?? '-',
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const TextLeft(nama: 'No Kendaraan'),
                        const Spacer(),
                        TextRight(
                          nama: controller.resultData.value.noKendaraan ?? '-',
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const TextLeft(nama: 'Nama Pemilik'),
                        const Spacer(),
                        TextRight(
                          nama: controller.resultData.value.pemilik ?? '-',
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const TextLeft(nama: 'Jenis Kendaraan'),
                        const Spacer(),
                        TextRight(
                          nama: controller.resultData.value.jnsKend ?? '-',
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const TextLeft(nama: 'Nama Komersil'),
                        const Spacer(),
                        TextRight(
                          nama: controller.resultData.value.namaKomersil ?? '-',
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const TextLeft(nama: 'Merk'),
                        const Spacer(),
                        TextRight(
                          nama: controller.resultData.value.merk ?? '-',
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const TextLeft(nama: 'Tipe'),
                        const Spacer(),
                        TextRight(
                          nama: controller.resultData.value.tipe ?? '-',
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const TextLeft(nama: 'No. Chasis'),
                        const Spacer(),
                        TextRight(
                          nama: controller.resultData.value.noChasis ?? '-',
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const TextLeft(nama: 'No. Mesin'),
                        const Spacer(),
                        TextRight(
                          nama: controller.resultData.value.noMesin ?? '-',
                        )
                      ],
                    ),
                  ],
                ),
              ),

              // ==========================
              // DIMENSI KENDARAAN
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
                    const TextHeader(
                      nama: 'Dimensi Utama',
                    ),
                    const Gap(10),
                    Row(
                      children: [
                        const TextLeft(nama: 'Panjang'),
                        const Spacer(),
                        TextRight(
                          nama: controller.resultData.value.panjang ?? '-',
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const TextLeft(nama: 'Lebar'),
                        const Spacer(),
                        TextRight(
                          nama: controller.resultData.value.lebar ?? '-',
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const TextLeft(nama: 'Tinggi'),
                        const Spacer(),
                        TextRight(
                          nama: controller.resultData.value.tinggi ?? '-',
                        )
                      ],
                    ),
                    const Gap(10),
                    const TextHeader(
                      nama: 'Dimensi Bak Muatan',
                    ),
                    const Gap(10),
                    Row(
                      children: [
                        const TextLeft(nama: 'Panjang'),
                        const Spacer(),
                        TextRight(
                          nama: controller.resultData.value.dimpanjang ?? '-',
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const TextLeft(nama: 'Lebar'),
                        const Spacer(),
                        TextRight(
                          nama: controller.resultData.value.dimlebar ?? '-',
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const TextLeft(nama: 'Tinggi'),
                        const Spacer(),
                        TextRight(
                          nama: controller.resultData.value.dimtinggi ?? '-',
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
