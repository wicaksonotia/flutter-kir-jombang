import 'package:flutter/material.dart';
import 'package:jombang/controllers/detail_riwayat_controller.dart';
import 'package:jombang/pages/cek_data_kendaraan/text_left.dart';

class LampuTidakLulus extends StatelessWidget {
  const LampuTidakLulus({
    super.key,
    required this.controller,
  });

  final DetailRiwayatController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            TextLeft(nama: 'Lampu'),
            Spacer(),
          ],
        ),
        ListView.builder(
          itemCount: controller.keteranganTlLampu.length,
          shrinkWrap: true,
          itemBuilder: (context, index) => Row(
            children: [
              const Icon(
                Icons.arrow_right,
                color: Colors.red,
              ),
              Expanded(
                child: TextLeft(
                  nama: controller.keteranganTlLampu[index].keterangan!,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
