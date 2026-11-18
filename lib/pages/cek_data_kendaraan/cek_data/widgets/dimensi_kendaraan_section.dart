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
  final String jbb;
  final String jbi;
  final String konfSumbu;
  final String kelasJalan;

  const DimensiKendaraanSection({
    super.key,
    required this.panjang,
    required this.lebar,
    required this.tinggi,
    required this.dimPanjang,
    required this.dimLebar,
    required this.dimTinggi,
    required this.jbb,
    required this.jbi,
    required this.konfSumbu,
    required this.kelasJalan,
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
        const TextHeader(nama: 'Batas Dimensi Kendaraan'),
        const Gap(10),
        DetailInfoRow(label: 'JBB', value: jbb),
        DetailInfoRow(label: 'JBI', value: jbi),
        DetailInfoRow(label: 'Konf. Sumbu', value: konfSumbu),
        DetailInfoRow(label: 'Kelas Jalan', value: kelasJalan),
      ],
    );
  }
}
