import 'package:flutter/material.dart';
import 'package:jombang/controllers/detail_riwayat_controller.dart';
import 'package:jombang/pages/cek_data_kendaraan/text_left.dart';
import 'package:jombang/pages/cek_data_kendaraan/text_right.dart';

class Lampu extends StatelessWidget {
  const Lampu({
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
            const TextLeft(nama: 'Lampu'),
            const Spacer(),
            TextRight(
              nama: controller.resultData.value.ptgsLampu ?? '-',
            )
          ],
        ),
        Row(
          children: [
            const Icon(
              Icons.arrow_right,
              color: Colors.grey,
            ),
            const TextLeft(nama: 'Kuat Pancar Lampu Utama Kanan'),
            const Spacer(),
            TextRight(
              nama: controller.resultData.value.ktlampKanan!.isEmpty
                  ? '0 cd'
                  : '${controller.resultData.value.ktlampKanan} cd',
            )
          ],
        ),
        Row(
          children: [
            const Icon(
              Icons.arrow_right,
              color: Colors.grey,
            ),
            const TextLeft(nama: 'Sudut Penyimpangan Kanan'),
            const Spacer(),
            TextRight(
              nama: controller.resultData.value.devKanan!.isEmpty
                  ? '0 degree'
                  : '${controller.resultData.value.devKanan} degree',
            )
          ],
        ),
        Row(
          children: [
            const Icon(
              Icons.arrow_right,
              color: Colors.grey,
            ),
            const TextLeft(nama: 'Kuat Pancar Lampu Utama Kiri'),
            const Spacer(),
            TextRight(
              nama: controller.resultData.value.ktlampKiri!.isEmpty
                  ? '0 cd'
                  : '${controller.resultData.value.ktlampKiri} cd',
            )
          ],
        ),
        Row(
          children: [
            const Icon(
              Icons.arrow_right,
              color: Colors.grey,
            ),
            const TextLeft(nama: 'Sudut Penyimpangan Kiri'),
            const Spacer(),
            TextRight(
              nama: controller.resultData.value.devKiri!.isEmpty
                  ? '0 degree'
                  : '${controller.resultData.value.devKiri} degree',
            )
          ],
        ),
      ],
    );
  }
}
