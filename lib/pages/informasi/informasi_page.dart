import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import 'package:jombang/controllers/berita_controller.dart';
import 'package:jombang/pages/informasi/widgets/berita_card.dart';
import 'package:jombang/pages/informasi/widgets/berita_shimmer.dart';
import 'package:jombang/pages/persyaratan/background_header.dart';
import 'package:jombang/utils/colors.dart';
import 'package:jombang/utils/containers/app_bar_header.dart';

class InformasiPage extends StatefulWidget {
  const InformasiPage({super.key});

  @override
  State<InformasiPage> createState() => _InformasiPageState();
}

class _InformasiPageState extends State<InformasiPage> {
  late final BeritaController beritaController;

  @override
  void initState() {
    super.initState();

    beritaController = Get.isRegistered<BeritaController>()
        ? Get.find<BeritaController>()
        : Get.put(BeritaController());
  }

  Future<void> _refresh() async {
    // Sesuaikan jika method fetch pada BeritaController
    // memiliki nama berbeda.
    await beritaController.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FB),
      extendBodyBehindAppBar: true,
      appBar: const AppbarHeader(
        header: 'Informasi',
        subtitle: 'Berita dan informasi terbaru',
      ),
      body: Stack(
        children: [
          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: BackgroundHeader(),
          ),
          SafeArea(
            top: false,
            child: Column(
              children: [
                // Ruang untuk AppbarHeader dan background header.
                const SizedBox(height: 112),
                Expanded(
                  child: Obx(() {
                    final items = beritaController.resultData;

                    if (beritaController.isLoading.value && items.isEmpty) {
                      return const BeritaShimmer();
                    }

                    if (items.isEmpty) {
                      return RefreshIndicator(
                        color: MyColors.primary,
                        onRefresh: _refresh,
                        child: ListView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          padding: const EdgeInsets.all(24),
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.45,
                              child: const _InformasiEmptyState(),
                            ),
                          ],
                        ),
                      );
                    }

                    return RefreshIndicator(
                      color: MyColors.primary,
                      backgroundColor: Colors.white,
                      onRefresh: _refresh,
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          final columns = constraints.maxWidth >= 760 ? 2 : 1;

                          return GridView.builder(
                            padding: const EdgeInsets.fromLTRB(
                              20,
                              12,
                              20,
                              30,
                            ),
                            physics: const AlwaysScrollableScrollPhysics(
                              parent: BouncingScrollPhysics(),
                            ),
                            itemCount: items.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: columns,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                              mainAxisExtent: 335,
                            ),
                            itemBuilder: (context, index) {
                              final item = items[index];

                              return AnimationConfiguration.staggeredGrid(
                                position: index,
                                duration: const Duration(milliseconds: 350),
                                columnCount: columns,
                                child: SlideAnimation(
                                  verticalOffset: 24,
                                  child: FadeInAnimation(
                                    child: BeritaCard(
                                      id: item.id?.toString() ?? '',
                                      judul: item.judul,
                                      berita: item.berita,
                                      tanggal: item.tanggal,
                                      gambar: item.gambar ?? '',
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _InformasiEmptyState extends StatelessWidget {
  const _InformasiEmptyState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 76,
            height: 76,
            decoration: BoxDecoration(
              color: const Color(0xFFE5EEFF),
              borderRadius: BorderRadius.circular(24),
            ),
            child: const Icon(
              Icons.newspaper_rounded,
              size: 36,
              color: MyColors.primary,
            ),
          ),
          const Gap(18),
          const Text(
            'Belum ada informasi',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: Color(0xFF172B4D),
            ),
          ),
          const Gap(8),
          const Text(
            'Berita dan informasi terbaru akan ditampilkan di sini.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              height: 1.5,
              color: Color(0xFF718096),
            ),
          ),
        ],
      ),
    );
  }
}
