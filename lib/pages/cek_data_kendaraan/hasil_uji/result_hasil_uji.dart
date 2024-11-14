import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:jombang/controllers/hasil_uji_controller.dart';
import 'package:jombang/utils/containers/box_container.dart';
import 'package:jombang/utils/sizes.dart';

class ResultHasilUji extends StatelessWidget {
  const ResultHasilUji({super.key});

  @override
  Widget build(BuildContext context) {
    final HasilUjiController hasilUjiController = Get.put(HasilUjiController());
    // final KeteranganTidakLulusController keteranganTidakLulusController =
    //     Get.put(KeteranganTidakLulusController());

    return Obx(() {
      if (hasilUjiController.isLoadingHasilUji.value) {
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
              // IDENTITAS KENDARAAN
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
                          nama: hasilUjiController
                                  .resultDataHasilUji.value.noUji ??
                              '-',
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const TextLeft(nama: 'No Kendaraan'),
                        const Spacer(),
                        TextRight(
                          nama: hasilUjiController
                                  .resultDataHasilUji.value.noKendaraan ??
                              '-',
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const TextLeft(nama: 'Nama Pemilik'),
                        const Spacer(),
                        TextRight(
                          nama: hasilUjiController
                                  .resultDataHasilUji.value.pemilik ??
                              '-',
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const TextLeft(nama: 'Prauji'),
                        const Spacer(),
                        TextRight(
                          nama: hasilUjiController
                                  .resultDataHasilUji.value.hasilPrauji ??
                              '-',
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const TextLeft(nama: 'Emisi'),
                        const Spacer(),
                        TextRight(
                          nama: hasilUjiController
                                  .resultDataHasilUji.value.hasilEmisi ??
                              '-',
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const TextLeft(nama: 'Lampu'),
                        const Spacer(),
                        TextRight(
                          nama: hasilUjiController
                                  .resultDataHasilUji.value.hasilLampu ??
                              '-',
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const TextLeft(nama: 'Pitlift'),
                        const Spacer(),
                        TextRight(
                          nama: hasilUjiController
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
                          nama: hasilUjiController
                                  .resultDataHasilUji.value.hasilBreak ??
                              '-',
                        )
                      ],
                    ),
                  ],
                ),
              ),

              // ==========================
              // KETERANGAN TL
              // ==========================
              const Gap(10),
              BoxContainer(
                padding: const EdgeInsets.all(10),
                height:
                    hasilUjiController.responseMessage.value == 'ok' ? 200 : 0,
                radius: 5,
                showBorder: true,
                borderColor: Colors.grey.shade200,
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: const TextSpan(
                        text: 'Keterangan Tidak Lulus ',
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
                    const Gap(10),
                    Expanded(
                      child: ListView.builder(
                        itemCount: hasilUjiController.keteranganTl.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) => Row(
                          children: [
                            const Text(
                              "\u2022",
                              style: TextStyle(fontSize: 30),
                            ), //bullet text
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                hasilUjiController
                                    .keteranganTl[index].keterangan!,
                              ),
                            )
                          ],
                        ),
                      ),
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
                              image: hasilUjiController.resultDataHasilUji.value
                                              .imgDepan ==
                                          null ||
                                      hasilUjiController.resultDataHasilUji
                                              .value.imgDepan ==
                                          ""
                                  ? const AssetImage(
                                      'assets/images/no_image.png')
                                  : MemoryImage(
                                      const Base64Decoder().convert(
                                          hasilUjiController.resultDataHasilUji
                                              .value.imgDepan!),
                                    ),
                              fit: hasilUjiController.resultDataHasilUji.value
                                              .imgDepan ==
                                          null ||
                                      hasilUjiController.resultDataHasilUji
                                              .value.imgDepan ==
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
                          width: MediaQuery.of(context).size.width * .43,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: hasilUjiController.resultDataHasilUji.value
                                              .imgBelakang ==
                                          null ||
                                      hasilUjiController.resultDataHasilUji
                                              .value.imgBelakang ==
                                          ""
                                  ? const AssetImage(
                                      'assets/images/no_image.png')
                                  : MemoryImage(
                                      const Base64Decoder().convert(
                                          hasilUjiController.resultDataHasilUji
                                              .value.imgBelakang!),
                                    ),
                              fit: hasilUjiController.resultDataHasilUji.value
                                              .imgBelakang ==
                                          null ||
                                      hasilUjiController.resultDataHasilUji
                                              .value.imgBelakang ==
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
                              image: hasilUjiController.resultDataHasilUji.value
                                              .imgKanan ==
                                          null ||
                                      hasilUjiController.resultDataHasilUji
                                              .value.imgKanan ==
                                          ""
                                  ? const AssetImage(
                                      'assets/images/no_image.png')
                                  : MemoryImage(
                                      const Base64Decoder().convert(
                                          hasilUjiController.resultDataHasilUji
                                              .value.imgKanan!),
                                    ),
                              fit: hasilUjiController.resultDataHasilUji.value
                                              .imgKanan ==
                                          null ||
                                      hasilUjiController.resultDataHasilUji
                                              .value.imgKanan ==
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
                          width: MediaQuery.of(context).size.width * .43,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: hasilUjiController.resultDataHasilUji.value
                                              .imgKiri ==
                                          null ||
                                      hasilUjiController.resultDataHasilUji
                                              .value.imgKiri ==
                                          ""
                                  ? const AssetImage(
                                      'assets/images/no_image.png')
                                  : MemoryImage(
                                      const Base64Decoder().convert(
                                          hasilUjiController.resultDataHasilUji
                                              .value.imgKiri!),
                                    ),
                              fit: hasilUjiController.resultDataHasilUji.value
                                              .imgKiri ==
                                          null ||
                                      hasilUjiController.resultDataHasilUji
                                              .value.imgKiri ==
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
      style:
          TextStyle(color: nama == 'TIDAK LULUS' ? Colors.red : Colors.black),
    );
  }
}
