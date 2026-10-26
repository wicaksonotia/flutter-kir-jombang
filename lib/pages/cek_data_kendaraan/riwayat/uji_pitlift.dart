import 'package:flutter/material.dart';
import 'package:jombang/controllers/detail_riwayat_controller.dart';
import 'package:jombang/pages/cek_data_kendaraan/text_left.dart';
import 'package:jombang/pages/cek_data_kendaraan/text_right.dart';

class Pitlift extends StatelessWidget {
  const Pitlift({
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
            TextLeft(nama: 'Bawah Kendaraan'),
            Spacer(),
          ],
        ),
        Row(
          children: [
            Icon(
              Icons.arrow_right,
              color: Colors.grey,
            ),
            TextLeft(nama: 'Rangka dan Landasan'),
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
            TextLeft(nama: 'Sistem Kemudi'),
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
            TextLeft(nama: 'Sistem Suspensi'),
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
            TextLeft(nama: 'Sistem Rem'),
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
            TextLeft(nama: 'Mesin'),
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
            TextLeft(nama: 'Sistem Penerus Daya'),
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
            TextLeft(nama: 'Sistem Pembuangan'),
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
            TextLeft(nama: 'Sistem Bahan Bakar'),
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
            TextLeft(nama: 'Sistem Pendingin'),
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
