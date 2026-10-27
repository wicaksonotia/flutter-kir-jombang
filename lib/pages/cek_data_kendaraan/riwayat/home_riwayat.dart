import 'package:flutter/material.dart';

import 'package:jombang/pages/cek_data_kendaraan/background_header.dart';
import 'package:jombang/pages/cek_data_kendaraan/riwayat/result_riwayat.dart';

class HomeRiwayat extends StatelessWidget {
  const HomeRiwayat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          const BackgroundHeader(
            menu: 'riwayat',
            title: 'Riwayat Uji Kendaraan',
          ),
          Expanded(
            child: SafeArea(
              top: false,
              child: ResultRiwayat(),
            ),
          ),
        ],
      ),
    );
  }
}
