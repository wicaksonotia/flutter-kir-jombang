import 'package:flutter/material.dart';
import 'package:sampang/controllers/detail_riwayat_controller.dart';
import 'package:sampang/pages/cek_data_kendaraan/text_left.dart';

class RemTidakLulus extends StatelessWidget {
  const RemTidakLulus({
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
            TextLeft(nama: 'Rem'),
            Spacer(),
          ],
        ),
        ListView.builder(
          itemCount: controller.keteranganTlRem.length,
          shrinkWrap: true,
          itemBuilder: (context, index) => Row(
            children: [
              const Icon(
                Icons.arrow_right,
                color: Colors.red,
              ),
              Expanded(
                child: TextLeft(
                  nama: controller.keteranganTlRem[index].keterangan!,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
