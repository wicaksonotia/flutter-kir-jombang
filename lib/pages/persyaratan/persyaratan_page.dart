import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import 'package:jombang/controllers/detail_persyaratan_controller.dart';
import 'package:jombang/controllers/persyaratan_controller.dart';
import 'package:jombang/pages/persyaratan/widgets/jenis_uji_card.dart';
import 'package:jombang/pages/persyaratan/widgets/persyaratan_app_bar.dart';
import 'package:jombang/pages/persyaratan/widgets/persyaratan_empty_state.dart';
import 'package:jombang/pages/persyaratan/widgets/persyaratan_section_heading.dart';
import 'package:jombang/utils/colors.dart';

class PersyaratanPage extends StatefulWidget {
  const PersyaratanPage({super.key});

  @override
  State<PersyaratanPage> createState() => _PersyaratanPageState();
}

class _PersyaratanPageState extends State<PersyaratanPage> {
  late final PersyaratanController controller;

  @override
  void initState() {
    super.initState();

    controller = Get.isRegistered<PersyaratanController>()
        ? Get.find<PersyaratanController>()
        : Get.put(PersyaratanController());
  }

  Future<void> _refresh() async {
    await controller.fetchData();
  }

  void _openDetail(int index) {
    final item = controller.jenisUjiItem[index];
    final nama = item.nama?.trim() ?? '';

    if (nama.isEmpty) return;

    final detailController = Get.isRegistered<DetailPersyaratanController>()
        ? Get.find<DetailPersyaratanController>()
        : Get.put(DetailPersyaratanController());

    detailController.persyaratanHeader.value = nama;

    Get.toNamed('/detailpersyaratan')?.then((_) {
      // Tidak perlu mengubah daftar kategori saat kembali.
    });

    // Muat persyaratan sesuai kategori yang dipilih.
    detailController.fetchData(nama);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FB),
      appBar: const PersyaratanAppBar(),
      body: SafeArea(
        top: false,
        child: RefreshIndicator(
          color: MyColors.primary,
          backgroundColor: Colors.white,
          onRefresh: _refresh,
          child: Obx(() {
            if (controller.isLoading.value && controller.jenisUjiItem.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (controller.jenisUjiItem.isEmpty) {
              return ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(20),
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.55,
                    child: PersyaratanEmptyState(
                      title: 'Persyaratan belum tersedia',
                      message: 'Data jenis pengujian belum dapat ditampilkan. '
                          'Periksa koneksi internet, lalu coba lagi.',
                      onRetry: _refresh,
                    ),
                  ),
                ],
              );
            }

            final items = controller.jenisUjiItem
                .where((item) => item.status != false)
                .toList()
              ..sort(
                (a, b) => (a.sorting ?? 0).compareTo(b.sorting ?? 0),
              );

            return ListView(
              physics: const AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics(),
              ),
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 32),
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        MyColors.primary,
                        MyColors.primary.withValues(alpha: 0.82),
                      ],
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Siapkan sebelum berangkat',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                height: 1.3,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const Gap(8),
                            Text(
                              'Pilih jenis pengujian untuk melihat '
                              'dokumen yang wajib dibawa.',
                              style: TextStyle(
                                color: Colors.white.withValues(alpha: 0.88),
                                fontSize: 12,
                                height: 1.55,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Gap(12),
                      Container(
                        width: 54,
                        height: 54,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(17),
                        ),
                        child: const Icon(
                          Icons.fact_check_outlined,
                          color: Colors.white,
                          size: 29,
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(28),
                const PersyaratanSectionHeading(
                  title: 'Jenis Pengujian',
                  subtitle: 'Pilih sesuai keperluan pengujian kendaraan Anda.',
                ),
                const Gap(16),
                if (items.isEmpty)
                  const Padding(
                    padding: EdgeInsets.only(top: 36),
                    child: PersyaratanEmptyState(
                      title: 'Belum ada jenis pengujian',
                      message:
                          'Jenis pengujian yang tersedia akan muncul di sini.',
                    ),
                  )
                else
                  ...List.generate(items.length, (index) {
                    final item = items[index];

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: JenisUjiCard(
                        item: item,
                        onTap: () {
                          final originalIndex =
                              controller.jenisUjiItem.indexOf(item);
                          _openDetail(originalIndex);
                        },
                      ),
                    );
                  }),
                const Gap(8),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.info_outline_rounded,
                      size: 17,
                      color: Color(0xFF718096),
                    ),
                    Gap(8),
                    Expanded(
                      child: Text(
                        'Pastikan dokumen yang dibawa sesuai dengan '
                        'jenis pengujian yang dipilih.',
                        style: TextStyle(
                          fontSize: 11,
                          height: 1.5,
                          color: Color(0xFF718096),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
