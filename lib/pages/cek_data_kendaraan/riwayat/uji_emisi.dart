import 'package:flutter/material.dart';
import 'package:sampang/controllers/detail_riwayat_controller.dart';
import 'package:sampang/pages/cek_data_kendaraan/text_left.dart';
import 'package:sampang/pages/cek_data_kendaraan/text_right.dart';

class Emisi extends StatelessWidget {
  const Emisi({
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
            TextLeft(nama: 'Emisi'),
            Spacer(),
          ],
        ),
        Row(
          children: [
            const Icon(
              Icons.arrow_right,
              color: Colors.grey,
            ),
            const TextLeft(nama: 'Diesel'),
            const Spacer(),
            TextRight(
              nama: controller.resultData.value.emsDiesel!.isEmpty
                  ? '-'
                  : '${controller.resultData.value.emsDiesel} %',
            )
          ],
        ),
        Row(
          children: [
            const Icon(
              Icons.arrow_right,
              color: Colors.grey,
            ),
            const TextLeft(nama: 'Mesin HC'),
            const Spacer(),
            TextRight(
              nama: controller.resultData.value.emsMesinHc!.isEmpty
                  ? '0 ppm'
                  : '${controller.resultData.value.emsMesinHc} ppm',
            )
          ],
        ),
        Row(
          children: [
            const Icon(
              Icons.arrow_right,
              color: Colors.grey,
            ),
            const TextLeft(nama: 'Mesin CO'),
            const Spacer(),
            TextRight(
              nama: controller.resultData.value.emsMesinCo!.isEmpty
                  ? '0 ppm'
                  : '${controller.resultData.value.emsMesinCo} ppm',
            )
          ],
        ),
      ],
    );
  }
}
