import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:jombang/controllers/detail_kendaraan_controller.dart';
import 'package:jombang/pages/cek_data_kendaraan/cek_data/widgets/dimensi_kendaraan_section.dart';
import 'package:jombang/pages/cek_data_kendaraan/cek_data/widgets/identitas_kendaraan_section.dart';
import 'package:jombang/pages/cek_data_kendaraan/cek_data/widgets/result_cek_data_empty.dart';
import 'package:jombang/pages/cek_data_kendaraan/cek_data/widgets/result_cek_data_shimmer.dart';
import 'package:jombang/utils/colors.dart';

class ResultCekData extends StatelessWidget {
  const ResultCekData({super.key});

  @override
  Widget build(BuildContext context) {
    final DetailKendaraanController controller =
        Get.isRegistered<DetailKendaraanController>()
            ? Get.find<DetailKendaraanController>()
            : Get.put(DetailKendaraanController());

    return Obx(() {
      if (controller.isLoadingDetailKendaraan.value) {
        return const ResultCekDataShimmer();
      }

      if (!controller.hasResult.value) {
        return const ResultCekDataEmpty();
      }

      final data = controller.resultData.value;

      return SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 14),
              child: Row(
                children: [
                  Icon(
                    Icons.fact_check_outlined,
                    size: 21,
                    color: MyColors.primary,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Hasil Pencarian',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1E293B),
                    ),
                  ),
                ],
              ),
            ),
            IdentitasKendaraanSection(
              noUji: data.noUji ?? '-',
              noKendaraan: data.noKendaraan ?? '-',
              pemilik: data.pemilik ?? '-',
              jenisKendaraan: data.jnsKend ?? '-',
              namaKomersil: data.namaKomersil ?? '-',
              merk: data.merk ?? '-',
              tipe: data.tipe ?? '-',
              noChasis: data.noChasis ?? '-',
              noMesin: data.noMesin ?? '-',
            ),
            const SizedBox(height: 14),
            DimensiKendaraanSection(
              panjang: data.panjang ?? '-',
              lebar: data.lebar ?? '-',
              tinggi: data.tinggi ?? '-',
              dimPanjang: data.dimpanjang ?? '-',
              dimLebar: data.dimlebar ?? '-',
              dimTinggi: data.dimtinggi ?? '-',
            ),
          ],
        ),
      );
    });
  }
}
