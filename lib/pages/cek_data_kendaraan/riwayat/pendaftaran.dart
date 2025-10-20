import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sampang/controllers/detail_riwayat_controller.dart';
import 'package:sampang/pages/cek_data_kendaraan/text_header.dart';
import 'package:sampang/pages/cek_data_kendaraan/text_left.dart';
import 'package:sampang/pages/cek_data_kendaraan/text_right.dart';
import 'package:sampang/utils/containers/box_container.dart';

class Pendaftaran extends StatelessWidget {
  const Pendaftaran({
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
            nama: 'Pendaftaran',
          ),
          const Gap(10),
          Row(
            children: [
              const TextLeft(nama: 'Tanggal Daftar'),
              const Spacer(),
              TextRight(
                nama: controller.resultData.value.tglRetribusi ?? '-',
              )
            ],
          ),
          Row(
            children: [
              const TextLeft(nama: 'Tanggal Uji'),
              const Spacer(),
              TextRight(
                nama: controller.resultData.value.tglUji ?? '-',
              )
            ],
          ),
          Row(
            children: [
              const TextLeft(nama: 'Jenis Uji'),
              const Spacer(),
              TextRight(
                nama: controller.resultData.value.nmUji ?? '-',
              )
            ],
          ),
        ],
      ),
    );
  }
}
