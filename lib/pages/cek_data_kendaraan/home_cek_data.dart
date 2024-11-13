import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jombang/controllers/search_bar_controller.dart';
import 'package:jombang/pages/cek_data_kendaraan/app_bar_header.dart';
import 'package:jombang/pages/cek_data_kendaraan/background_header.dart';
import 'package:jombang/pages/cek_data_kendaraan/result_cek_data.dart';

class HomeCekData extends StatefulWidget {
  const HomeCekData({super.key});

  @override
  _HomeCekDataState createState() => _HomeCekDataState();
}

class _HomeCekDataState extends State<HomeCekData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppbarHeader(
          header: 'Cek Data Kendaraan',
        ),
      ),
      backgroundColor: Colors.white,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Column(
          children: [
            BackgroundHeader(
              menu: 'cekdata',
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .79,
              child: const ResultCekData(),
            ),
          ],
        ),
      ),
    );
  }
}
