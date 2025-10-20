import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sampang/pages/cek_data_kendaraan/riwayat/result_riwayat_pendaftaran.dart';
import 'package:sampang/utils/colors.dart';
import 'package:sampang/utils/containers/app_bar_header.dart';
import 'package:sampang/pages/cek_data_kendaraan/background_header.dart';
import 'package:sampang/pages/cek_data_kendaraan/riwayat/result_riwayat.dart';

class HomeRiwayat extends StatelessWidget {
  const HomeRiwayat({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppbarHeader(
            header: 'Riwayat Uji Kendaraan',
          ),
        ),
        backgroundColor: Colors.white,
        body: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: Column(
            children: [
              const BackgroundHeader(
                menu: 'riwayat',
              ),
              const TabBar(
                indicatorColor: MyColors.primary,
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: MyColors.primary,
                dividerColor: Colors.transparent,
                tabs: [
                  Tab(icon: Text('UJI KENDARAAN')),
                  Tab(icon: Text('PENDAFTARAN UJI')),
                ],
              ),
              const Gap(10),
              SizedBox(
                height: MediaQuery.of(context).size.height * .73,
                // child: const ResultRiwayat(),
                child: TabBarView(
                  children: [
                    ResultRiwayat(),
                    ResultRiwayatPendaftaran(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
