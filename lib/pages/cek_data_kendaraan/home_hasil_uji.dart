import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jombang/pages/cek_data_kendaraan/app_bar_header.dart';
import 'package:jombang/pages/cek_data_kendaraan/background_header.dart';
import 'package:jombang/pages/cek_data_kendaraan/result_hasil_uji.dart';

class HomeHasilUji extends StatefulWidget {
  const HomeHasilUji({super.key});

  @override
  _HomeHasilUjiState createState() => _HomeHasilUjiState();
}

class _HomeHasilUjiState extends State<HomeHasilUji> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppbarHeader(
          header: 'Cek Hasil Uji Kendaraan',
        ),
      ),
      backgroundColor: Colors.white,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Column(
          children: [
            BackgroundHeader(
              menu: 'HomeHasilUji',
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .79,
              child: const ResultHasilUji(),
            ),
          ],
        ),
      ),
    );
  }
}
