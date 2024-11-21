import 'package:flutter/material.dart';
import 'package:jombang/pages/pendaftaran/list_riwayat.dart';
import 'package:jombang/utils/containers/app_bar_header.dart';
import 'package:jombang/pages/persyaratan/background_header.dart';

class HomeRiwayatPendaftaran extends StatefulWidget {
  const HomeRiwayatPendaftaran({super.key});

  @override
  State<HomeRiwayatPendaftaran> createState() => _HomeRiwayatPendaftaranState();
}

class _HomeRiwayatPendaftaranState extends State<HomeRiwayatPendaftaran> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppbarHeader(
          header: 'Riwayat Transaksi Pendaftaran',
        ),
      ),
      backgroundColor: Colors.white,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Column(
          children: [
            const BackgroundHeader(),
            SizedBox(
              height: MediaQuery.of(context).size.height * .79,
              child: const ListRiwayatPendaftaran(),
            ),
          ],
        ),
      ),
    );
  }
}
