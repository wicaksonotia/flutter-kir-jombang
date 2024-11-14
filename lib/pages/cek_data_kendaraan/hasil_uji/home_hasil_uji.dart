import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jombang/pages/cek_data_kendaraan/app_bar_header.dart';
import 'package:jombang/pages/cek_data_kendaraan/background_header.dart';
import 'package:jombang/pages/cek_data_kendaraan/hasil_uji/result_hasil_uji.dart';

class HomeHasilUji extends StatefulWidget {
  const HomeHasilUji({super.key});

  @override
  State<HomeHasilUji> createState() => _HomeHasilUjiState();
}

class _HomeHasilUjiState extends State<HomeHasilUji> {
  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(interceptor);
  }

  @override
  void dispose() {
    super.dispose();
    BackButtonInterceptor.remove(interceptor);
  }

  bool interceptor(bool btnEvent, RouteInfo info) {
    context.goNamed('home');
    return true;
  }

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
              menu: 'hasiluji',
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
