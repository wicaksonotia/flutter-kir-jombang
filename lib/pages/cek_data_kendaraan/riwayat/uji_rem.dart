import 'package:flutter/material.dart';
import 'package:jombang/controllers/detail_riwayat_controller.dart';
import 'package:jombang/pages/cek_data_kendaraan/text_left.dart';
import 'package:jombang/pages/cek_data_kendaraan/text_right.dart';

class Rem extends StatelessWidget {
  const Rem({
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
            const TextLeft(nama: 'Rem'),
            const Spacer(),
            TextRight(
              nama: controller.resultData.value.ptgsBreak ?? '-',
            )
          ],
        ),
        Row(
          children: [
            const Icon(
              Icons.arrow_right,
              color: Colors.grey,
            ),
            const TextLeft(nama: 'Gaya Pengereman Sumbu I'),
            const Spacer(),
            TextRight(
              nama: controller.resultData.value.selgaya1!.isEmpty
                  ? '0 Kg'
                  : '${controller.resultData.value.selgaya1} Kg',
            )
          ],
        ),
        Row(
          children: [
            const Icon(
              Icons.arrow_right,
              color: Colors.grey,
            ),
            const TextLeft(nama: 'Selisih Gaya Pengereman Sumbu I'),
            const Spacer(),
            TextRight(
              nama: controller.resultData.value.selremSb1!.isEmpty
                  ? '0 %'
                  : '${controller.resultData.value.selremSb1} %',
            )
          ],
        ),
        Row(
          children: [
            const Icon(
              Icons.arrow_right,
              color: Colors.grey,
            ),
            const TextLeft(nama: 'Gaya Pengereman Sumbu II'),
            const Spacer(),
            TextRight(
              nama: controller.resultData.value.selgaya2!.isEmpty
                  ? '0 Kg'
                  : '${controller.resultData.value.selgaya2} Kg',
            )
          ],
        ),
        Row(
          children: [
            const Icon(
              Icons.arrow_right,
              color: Colors.grey,
            ),
            const TextLeft(nama: 'Selisih Gaya Pengereman Sumbu II'),
            const Spacer(),
            TextRight(
              nama: controller.resultData.value.selremSb2!.isEmpty
                  ? '0 %'
                  : '${controller.resultData.value.selremSb2} %',
            )
          ],
        ),
        Row(
          children: [
            const Icon(
              Icons.arrow_right,
              color: Colors.grey,
            ),
            const TextLeft(nama: 'Gaya Pengereman Sumbu III'),
            const Spacer(),
            TextRight(
              nama: controller.resultData.value.selgaya3!.isEmpty
                  ? '0 Kg'
                  : '${controller.resultData.value.selgaya3} Kg',
            )
          ],
        ),
        Row(
          children: [
            const Icon(
              Icons.arrow_right,
              color: Colors.grey,
            ),
            const TextLeft(nama: 'Selisih Gaya Pengereman Sumbu III'),
            const Spacer(),
            TextRight(
              nama: controller.resultData.value.selremSb3!.isEmpty
                  ? '0 %'
                  : '${controller.resultData.value.selremSb3} %',
            )
          ],
        ),
        Row(
          children: [
            const Icon(
              Icons.arrow_right,
              color: Colors.grey,
            ),
            const TextLeft(nama: 'Gaya Pengereman Sumbu IV'),
            const Spacer(),
            TextRight(
              nama: controller.resultData.value.selgaya4!.isEmpty
                  ? '0 Kg'
                  : '${controller.resultData.value.selgaya4} Kg',
            )
          ],
        ),
        Row(
          children: [
            const Icon(
              Icons.arrow_right,
              color: Colors.grey,
            ),
            const TextLeft(nama: 'Selisih Gaya Pengereman Sumbu III'),
            const Spacer(),
            TextRight(
              nama: controller.resultData.value.selremSb4!.isEmpty
                  ? '0 %'
                  : '${controller.resultData.value.selremSb4} %',
            )
          ],
        ),
      ],
    );
  }
}
