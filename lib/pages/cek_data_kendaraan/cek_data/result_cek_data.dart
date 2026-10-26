import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:jombang/controllers/detail_kendaraan_controller.dart';
import 'package:jombang/pages/cek_data_kendaraan/cek_data/widgets/dimensi_kendaraan_section.dart';
import 'package:jombang/pages/cek_data_kendaraan/cek_data/widgets/identitas_kendaraan_section.dart';
import 'package:jombang/utils/colors.dart';

class ResultCekData extends StatelessWidget {
  const ResultCekData({super.key});

  @override
  Widget build(BuildContext context) {
    final DetailKendaraanController controller =
        Get.put(DetailKendaraanController());

    return Obx(() {
      if (controller.isLoadingDetailKendaraan.value) {
        return const _LoadingState();
      }

      if (!controller.hasResult.value) {
        return const _EmptyState();
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

class _LoadingState extends StatelessWidget {
  const _LoadingState();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(
            color: MyColors.primary,
            strokeWidth: 3,
          ),
          SizedBox(height: 16),
          Text(
            'Sedang mencari data kendaraan...',
            style: TextStyle(
              fontSize: 13,
              color: Color(0xFF64748B),
            ),
          ),
        ],
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 28,
          vertical: 24,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 88,
              height: 88,
              decoration: BoxDecoration(
                color: MyColors.primary.withValues(alpha: 0.08),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.directions_car_outlined,
                size: 42,
                color: MyColors.primary,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Informasi Kendaraan',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Color(0xFF1E293B),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Masukkan Nomor Uji dan 5 digit terakhir Nomor Mesin, '
              'lalu tekan tombol cari untuk melihat detail kendaraan.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                height: 1.6,
                color: Color(0xFF64748B),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
