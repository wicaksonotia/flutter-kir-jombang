import 'package:flutter/material.dart';
import 'package:sampang/controllers/detail_riwayat_controller.dart';
import 'package:sampang/pages/cek_data_kendaraan/text_left.dart';
import 'package:sampang/pages/cek_data_kendaraan/text_right.dart';

class Prauji extends StatelessWidget {
  const Prauji({
    super.key,
    required this.controller,
  });

  final DetailRiwayatController controller;

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            TextLeft(nama: 'Prauji'),
            Spacer(),
          ],
        ),
        Row(
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
        Row(
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
        Row(
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
        Row(
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
        Row(
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
        Row(
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
