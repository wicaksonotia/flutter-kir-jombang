import 'package:flutter/material.dart';
import 'package:jombang/models/riwayat_detail_model.dart';

import 'riwayat_section_card.dart';

class RiwayatIdentitas extends StatelessWidget {
  final DataDetailRiwayat data;

  const RiwayatIdentitas({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RiwayatSectionCard(
          title: 'Identitas Kendaraan',
          icon: Icons.directions_car_outlined,
          child: Column(
            children: [
              RiwayatInfoRow(
                label: 'Nomor rangka',
                value: data.noChasis,
              ),
              RiwayatInfoRow(
                label: 'Nomor mesin',
                value: data.noMesin,
              ),
              RiwayatInfoRow(
                label: 'Merek',
                value: data.merk,
              ),
              RiwayatInfoRow(
                label: 'Tipe',
                value: data.tipe,
              ),
            ],
          ),
        ),
        const SizedBox(height: 14),
        RiwayatSectionCard(
          title: 'Identitas Pemilik',
          icon: Icons.person_outline_rounded,
          child: Column(
            children: [
              RiwayatInfoRow(
                label: 'Nama pemilik',
                value: data.pemilik,
              ),
              RiwayatInfoRow(
                label: 'Alamat',
                value: data.alamat,
              ),
            ],
          ),
        ),
        const SizedBox(height: 14),
        RiwayatSectionCard(
          title: 'Data Pengujian',
          icon: Icons.calendar_month_outlined,
          child: Column(
            children: [
              RiwayatInfoRow(
                label: 'Tanggal retribusi',
                value: data.tglRetribusi,
              ),
              RiwayatInfoRow(
                label: 'Tanggal uji',
                value: data.tglUji,
              ),
              RiwayatInfoRow(
                label: 'Masa berlaku uji',
                value: data.tglmati,
              ),
              RiwayatInfoRow(
                label: 'Jenis pengujian',
                value: data.nmUji,
              ),
              RiwayatInfoRow(
                label: 'Nama penguji',
                value: data.nmPenguji,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
