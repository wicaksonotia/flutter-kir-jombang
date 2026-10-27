import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import 'package:jombang/controllers/detail_riwayat_controller.dart';
import 'package:jombang/models/riwayat_detail_model.dart';
import 'package:jombang/pages/cek_data_kendaraan/riwayat/widgets/riwayat_foto_kendaraan.dart';
import 'package:jombang/pages/cek_data_kendaraan/riwayat/widgets/riwayat_hasil_uji.dart';
import 'package:jombang/pages/cek_data_kendaraan/riwayat/widgets/riwayat_header.dart';
import 'package:jombang/pages/cek_data_kendaraan/riwayat/widgets/riwayat_identitas.dart';
import 'package:jombang/utils/colors.dart';

class DetailRiwayat extends GetView<DetailRiwayatController> {
  const DetailRiwayat({super.key});

  static const Color _backgroundColor = Color(0xFFF4F7FB);
  static const Color _textColor = Color(0xFF172B4D);
  static const Color _mutedColor = Color(0xFF718096);

  String _value(dynamic value) {
    if (value == null) return '';

    final result = value.toString().trim();

    if (result.isEmpty || result.toLowerCase() == 'null') {
      return '';
    }

    return result;
  }

  Future<void> _refresh() async {
    final int? idHasilUji = controller.currentIdHasilUji;
    final String? noUji = controller.currentNoUji;

    if (idHasilUji == null ||
        idHasilUji < 1 ||
        noUji == null ||
        noUji.trim().isEmpty) {
      return;
    }

    await controller.getDetailDataKendaraan(
      idHasilUji: idHasilUji,
      noUji: noUji,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        scrolledUnderElevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: MyColors.primary,
        leadingWidth: 64,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: IconButton(
            tooltip: 'Kembali',
            onPressed: () {
              if (Navigator.of(context).canPop()) {
                Navigator.of(context).pop();
              } else {
                Get.back();
              }
            },
            icon: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.14),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.15),
                ),
              ),
              child: const Icon(
                Icons.arrow_back_rounded,
                size: 21,
                color: Colors.white,
              ),
            ),
          ),
        ),
        titleSpacing: 4,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Detail Riwayat Uji',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.3,
                color: Colors.white,
              ),
            ),
            Gap(3),
            Text(
              'Informasi kendaraan dan hasil pengujian',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w400,
                color: Color(0xFFDCE8FF),
              ),
            ),
          ],
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        final DataDetailRiwayat data = controller.resultData.value;

        return RefreshIndicator(
          color: MyColors.primary,
          backgroundColor: Colors.white,
          onRefresh: _refresh,
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics(),
            ),
            padding: const EdgeInsets.fromLTRB(16, 18, 16, 30),
            children: [
              // Ringkasan kendaraan
              RiwayatHeader(
                noUji: _value(data.noUji),
                noKendaraan: _value(data.noKendaraan),
                merk: _value(data.merk),
                tipe: _value(data.tipe),
              ),

              const Gap(26),

              // Identitas kendaraan, pemilik, dan registrasi
              const _SectionHeading(
                title: 'Informasi Kendaraan',
                subtitle: 'Identitas dan data registrasi kendaraan',
                icon: Icons.directions_car_rounded,
              ),

              const Gap(12),

              RiwayatIdentitas(data: data),

              const Gap(24),

              // Hasil pengujian
              const _SectionHeading(
                title: 'Hasil Pengujian',
                subtitle: 'Rincian pemeriksaan kendaraan',
                icon: Icons.fact_check_rounded,
              ),

              const Gap(12),

              RiwayatHasilUji(
                data: data,
                controller: controller,
              ),

              const Gap(24),

              // Foto kendaraan
              const _SectionHeading(
                title: 'Dokumentasi Kendaraan',
                subtitle: 'Foto kendaraan dari beberapa sisi',
                icon: Icons.photo_library_outlined,
              ),

              const Gap(12),

              RiwayatFotoKendaraan(
                depan: _value(data.imgDepan),
                belakang: _value(data.imgBelakang),
                kanan: _value(data.imgKanan),
                kiri: _value(data.imgKiri),
              ),

              const Gap(24),

              Center(
                child: Column(
                  children: [
                    Icon(
                      Icons.verified_user_outlined,
                      size: 19,
                      color: _mutedColor.withValues(alpha: 0.8),
                    ),
                    const Gap(6),
                    const Text(
                      'Data hasil pengujian kendaraan',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 11,
                        color: _mutedColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class _SectionHeading extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const _SectionHeading({
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: MyColors.primary.withValues(alpha: 0.09),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Icon(
            icon,
            color: MyColors.primary,
            size: 21,
          ),
        ),
        const Gap(12),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF172B4D),
                    letterSpacing: -0.2,
                  ),
                ),
                const Gap(4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    height: 1.4,
                    color: Color(0xFF718096),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
