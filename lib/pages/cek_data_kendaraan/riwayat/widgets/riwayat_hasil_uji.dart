import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jombang/controllers/detail_riwayat_controller.dart';
import 'package:jombang/models/riwayat_detail_model.dart';

import 'riwayat_section_card.dart';
import 'riwayat_status_uji.dart';

class RiwayatHasilUji extends StatelessWidget {
  final DataDetailRiwayat data;
  final DetailRiwayatController controller;

  const RiwayatHasilUji({
    super.key,
    required this.data,
    required this.controller,
  });

  List<String> _reasonTexts(Iterable<dynamic> items) {
    return items
        .map((item) {
          final value = item.keterangan;
          return value == null ? '' : value.toString().trim();
        })
        .where((value) => value.isNotEmpty && value.toLowerCase() != 'null')
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return RiwayatSectionCard(
      title: 'Hasil Pengujian',
      icon: Icons.fact_check_outlined,
      child: Column(
        children: [
          // Emisi selalu dianggap lulus sesuai aturan aplikasi.
          const RiwayatStatusUji(
            title: 'Uji emisi',
            isPassed: true,
          ),
          const SizedBox(height: 10),
          Obx(
            () => RiwayatStatusUji(
              title: 'Pra-uji',
              isPassed: data.lulusPrauji == true,
              reasons: _reasonTexts(controller.keteranganTlPrauji),
            ),
          ),
          const SizedBox(height: 10),
          Obx(
            () => RiwayatStatusUji(
              title: 'Pitlift',
              isPassed: data.lulusPitlift == true,
              reasons: _reasonTexts(controller.keteranganTlPitlift),
            ),
          ),
          const SizedBox(height: 10),
          Obx(
            () => RiwayatStatusUji(
              title: 'Uji lampu',
              isPassed: data.lulusLampu == true,
              reasons: _reasonTexts(controller.keteranganTlLampu),
            ),
          ),
          const SizedBox(height: 10),
          Obx(
            () => RiwayatStatusUji(
              title: 'Uji rem',
              isPassed: data.lulusBreak == true,
              reasons: _reasonTexts(controller.keteranganTlRem),
            ),
          ),
        ],
      ),
    );
  }
}
