import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:jombang/pages/cek_data_kendaraan/cek_data/widgets/detail_info_card.dart';
import 'package:jombang/pages/cek_data_kendaraan/cek_data/widgets/detail_info_row.dart';
import 'package:jombang/pages/cek_data_kendaraan/text_header.dart';

class DimensiKendaraanSection extends StatelessWidget {
  final String panjang;
  final String lebar;
  final String tinggi;
  final String dimPanjang;
  final String dimLebar;
  final String dimTinggi;

  const DimensiKendaraanSection({
    super.key,
    required this.panjang,
    required this.lebar,
    required this.tinggi,
    required this.dimPanjang,
    required this.dimLebar,
    required this.dimTinggi,
  });

  @override
  Widget build(BuildContext context) {
    return DetailInfoCard(
      title: 'Dimensi Kendaraan',
      children: [
        DetailInfoRow(label: 'Panjang', value: panjang),
        DetailInfoRow(label: 'Lebar', value: lebar),
        DetailInfoRow(label: 'Tinggi', value: tinggi),
        const Gap(12),
        const TextHeader(nama: 'Dimensi Bak Muatan'),
        const Gap(10),
        DetailInfoRow(label: 'Panjang', value: dimPanjang),
        DetailInfoRow(label: 'Lebar', value: dimLebar),
        DetailInfoRow(label: 'Tinggi', value: dimTinggi),
      ],
    );
  }
}
