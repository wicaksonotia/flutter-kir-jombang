import 'package:flutter/material.dart';
import 'package:jombang/controllers/detail_riwayat_controller.dart';
import 'package:jombang/pages/cek_data_kendaraan/riwayat/text_left.dart';
import 'package:jombang/pages/cek_data_kendaraan/riwayat/text_right.dart';

class PitliftTidakLulus extends StatelessWidget {
  const PitliftTidakLulus({
    super.key,
    required this.controller,
  });

  final DetailRiwayatController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const TextLeft(nama: 'Bawah Kendaraan'),
            const Spacer(),
            TextRight(
              nama: controller.resultData.value.ptgsPrauji ?? '-',
            )
          ],
        ),
        ListView.builder(
          itemCount: controller.keteranganTlPitlift.length,
          shrinkWrap: true,
          itemBuilder: (context, index) => Row(
            children: [
              const Icon(
                Icons.arrow_right,
                color: Colors.red,
              ),
              Expanded(
                child: TextLeft(
                  nama: controller.keteranganTlPitlift[index].keterangan!,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
