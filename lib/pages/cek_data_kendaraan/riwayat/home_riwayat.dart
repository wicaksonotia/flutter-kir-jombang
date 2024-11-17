import 'package:flutter/material.dart';
import 'package:jombang/pages/cek_data_kendaraan/app_bar_header.dart';
import 'package:jombang/pages/cek_data_kendaraan/background_header.dart';
import 'package:jombang/pages/cek_data_kendaraan/riwayat/result_riwayat.dart';

class HomeRiwayat extends StatefulWidget {
  const HomeRiwayat({super.key});

  @override
  State<HomeRiwayat> createState() => _HomeRiwayatState();
}

class _HomeRiwayatState extends State<HomeRiwayat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppbarHeader(
          header: 'Riwayat Kendaraan',
        ),
      ),
      backgroundColor: Colors.white,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Column(
          children: [
            BackgroundHeader(
              menu: 'riwayat',
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .79,
              child: const ResultRiwayat(),
            ),
          ],
        ),
      ),
    );
  }
}
