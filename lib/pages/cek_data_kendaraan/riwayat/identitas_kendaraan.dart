import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:jombang/controllers/detail_riwayat_controller.dart';
import 'package:jombang/pages/cek_data_kendaraan/riwayat/text_header.dart';
import 'package:jombang/pages/cek_data_kendaraan/riwayat/text_left.dart';
import 'package:jombang/pages/cek_data_kendaraan/riwayat/text_right.dart';
import 'package:jombang/utils/containers/box_container.dart';

class IdentitasKendaraan extends StatelessWidget {
  const IdentitasKendaraan({
    super.key,
    required this.controller,
  });

  final DetailRiwayatController controller;

  @override
  Widget build(BuildContext context) {
    return BoxContainer(
      padding: const EdgeInsets.all(10),
      radius: 5,
      showBorder: true,
      borderColor: Colors.grey.shade200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextHeader(
            nama: 'Identitas Kendaraan',
          ),
          const Gap(10),
          Row(
            children: [
              const TextLeft(nama: 'No Uji'),
              const Spacer(),
              TextRight(
                nama: controller.resultData.value.noUji ?? '-',
              )
            ],
          ),
          Row(
            children: [
              const TextLeft(nama: 'No Kendaraan'),
              const Spacer(),
              TextRight(
                nama: controller.resultData.value.noKendaraan ?? '-',
              )
            ],
          ),
          Row(
            children: [
              const TextLeft(nama: 'No. Chasis'),
              const Spacer(),
              TextRight(
                nama: controller.resultData.value.noChasis ?? '-',
              )
            ],
          ),
          Row(
            children: [
              const TextLeft(nama: 'No. Mesin'),
              const Spacer(),
              TextRight(
                nama: controller.resultData.value.noMesin ?? '-',
              )
            ],
          ),
        ],
      ),
    );
  }
}
