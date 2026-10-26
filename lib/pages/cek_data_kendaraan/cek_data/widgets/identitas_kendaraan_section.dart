import 'package:flutter/material.dart';
import 'package:jombang/pages/cek_data_kendaraan/cek_data/widgets/detail_info_card.dart';
import 'package:jombang/pages/cek_data_kendaraan/cek_data/widgets/detail_info_row.dart';

class IdentitasKendaraanSection extends StatelessWidget {
  final String noUji;
  final String noKendaraan;
  final String pemilik;
  final String jenisKendaraan;
  final String namaKomersil;
  final String merk;
  final String tipe;
  final String noChasis;
  final String noMesin;

  const IdentitasKendaraanSection({
    super.key,
    required this.noUji,
    required this.noKendaraan,
    required this.pemilik,
    required this.jenisKendaraan,
    required this.namaKomersil,
    required this.merk,
    required this.tipe,
    required this.noChasis,
    required this.noMesin,
  });

  @override
  Widget build(BuildContext context) {
    return DetailInfoCard(
      title: 'Identitas Kendaraan',
      children: [
        DetailInfoRow(label: 'No Uji', value: noUji),
        DetailInfoRow(label: 'No Kendaraan', value: noKendaraan),
        DetailInfoRow(label: 'Nama Pemilik', value: pemilik),
        DetailInfoRow(label: 'Jenis Kendaraan', value: jenisKendaraan),
        DetailInfoRow(label: 'Nama Komersil', value: namaKomersil),
        DetailInfoRow(label: 'Merk', value: merk),
        DetailInfoRow(label: 'Tipe', value: tipe),
        DetailInfoRow(label: 'No. Chasis', value: noChasis),
        DetailInfoRow(label: 'No. Mesin', value: noMesin),
      ],
    );
  }
}
