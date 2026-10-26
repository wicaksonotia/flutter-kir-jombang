import 'package:flutter/material.dart';

import 'package:jombang/pages/cek_data_kendaraan/background_header.dart';
import 'package:jombang/pages/cek_data_kendaraan/cek_data/result_cek_data.dart';

class HomeCekData extends StatelessWidget {
  const HomeCekData({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFF5F7FB),
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          BackgroundHeader(
            menu: 'cekdata',
            title: 'Cek Data Kendaraan',
          ),
          Expanded(
            child: SafeArea(
              top: false,
              child: ResultCekData(),
            ),
          ),
        ],
      ),
    );
  }
}
