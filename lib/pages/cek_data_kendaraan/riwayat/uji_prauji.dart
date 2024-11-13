import 'package:flutter/material.dart';
import 'package:jombang/controllers/detail_riwayat_controller.dart';
import 'package:jombang/pages/cek_data_kendaraan/riwayat/text_left.dart';
import 'package:jombang/pages/cek_data_kendaraan/riwayat/text_right.dart';

class Prauji extends StatelessWidget {
  const Prauji({
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
            const TextLeft(nama: 'Prauji'),
            const Spacer(),
            TextRight(
              nama: controller.resultData.value.ptgsPrauji ?? '-',
            )
          ],
        ),
        const Row(
          children: [
            Icon(
              Icons.arrow_right,
              color: Colors.grey,
            ),
            TextLeft(nama: 'Identitas Kendaraan'),
            Spacer(),
            TextRight(
              nama: 'LULUS',
            )
          ],
        ),
        const Row(
          children: [
            Icon(
              Icons.arrow_right,
              color: Colors.grey,
            ),
            TextLeft(nama: 'Sistem Penerangan'),
            Spacer(),
            TextRight(
              nama: 'LULUS',
            )
          ],
        ),
        const Row(
          children: [
            Icon(
              Icons.arrow_right,
              color: Colors.grey,
            ),
            TextLeft(nama: 'Rumah dan Body'),
            Spacer(),
            TextRight(
              nama: 'LULUS',
            )
          ],
        ),
        const Row(
          children: [
            Icon(
              Icons.arrow_right,
              color: Colors.grey,
            ),
            TextLeft(nama: 'Roda-roda'),
            Spacer(),
            TextRight(
              nama: 'LULUS',
            )
          ],
        ),
        const Row(
          children: [
            Icon(
              Icons.arrow_right,
              color: Colors.grey,
            ),
            TextLeft(nama: 'Dimensi'),
            Spacer(),
            TextRight(
              nama: 'LULUS',
            )
          ],
        ),
        const Row(
          children: [
            Icon(
              Icons.arrow_right,
              color: Colors.grey,
            ),
            TextLeft(nama: 'Peralatan dan Perlengkapan'),
            Spacer(),
            TextRight(
              nama: 'LULUS',
            )
          ],
        ),
      ],
    );
  }
}
