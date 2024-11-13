import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:jombang/controllers/detail_riwayat_controller.dart';
import 'package:jombang/pages/cek_data_kendaraan/riwayat/text_header.dart';
import 'package:jombang/pages/cek_data_kendaraan/riwayat/text_left.dart';
import 'package:jombang/pages/cek_data_kendaraan/riwayat/text_right.dart';
import 'package:jombang/utils/containers/box_container.dart';

class IdentitasPemilik extends StatelessWidget {
  const IdentitasPemilik({
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
            nama: 'Identitas Pemilik Kendaraan',
          ),
          const Gap(10),
          Row(
            children: [
              const TextLeft(nama: 'Nama'),
              const Spacer(),
              TextRight(
                nama: controller.resultData.value.pemilik ?? '-',
              )
            ],
          ),
          Row(
            children: [
              const TextLeft(nama: 'Alamat'),
              const Spacer(),
              TextRight(
                nama: controller.resultData.value.alamat ?? '-',
              )
            ],
          ),
        ],
      ),
    );
  }
}
