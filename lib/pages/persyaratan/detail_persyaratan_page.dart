import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import 'package:jombang/controllers/detail_persyaratan_controller.dart';
import 'package:jombang/pages/persyaratan/widgets/detail_persyaratan_item_card.dart';
import 'package:jombang/pages/persyaratan/widgets/detail_persyaratan_shimmer.dart';
import 'package:jombang/pages/persyaratan/widgets/detail_persyaratan_summary_card.dart';
import 'package:jombang/utils/colors.dart';
import 'package:jombang/utils/containers/app_bar_header.dart';

class DetailPersyaratanPage extends StatefulWidget {
  const DetailPersyaratanPage({super.key});

  @override
  State<DetailPersyaratanPage> createState() => _DetailPersyaratanPageState();
}

class _DetailPersyaratanPageState extends State<DetailPersyaratanPage> {
  late final DetailPersyaratanController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.find<DetailPersyaratanController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FB),
      appBar: AppbarHeader(
        header: 'Detail Persyaratan',
        subtitle: 'Dokumen yang perlu dibawa saat pengujian',
        dynamicHeader: controller.persyaratanHeader,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const DetailPersyaratanShimmer();
        }

        if (controller.errorMessage.value.isNotEmpty) {
          return _MessageState(
            icon: Icons.cloud_off_outlined,
            title: 'Persyaratan belum dapat ditampilkan',
            message: controller.errorMessage.value,
            onRetry: controller.refreshData,
          );
        }

        if (controller.persyaratanItem.isEmpty) {
          return const _MessageState(
            icon: Icons.checklist_rounded,
            title: 'Belum ada persyaratan',
            message:
                'Belum ada dokumen yang tercatat untuk jenis pengujian ini.',
          );
        }

        final items = controller.persyaratanItem;

        return RefreshIndicator(
          color: MyColors.primary,
          backgroundColor: Colors.white,
          onRefresh: controller.refreshData,
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics(),
            ),
            padding: const EdgeInsets.fromLTRB(20, 22, 20, 32),
            children: [
              DetailPersyaratanSummaryCard(total: items.length),
              const Gap(26),
              const Text(
                'Daftar dokumen',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.2,
                  color: Color(0xFF172B4D),
                ),
              ),
              const Gap(5),
              const Text(
                'Pastikan seluruh dokumen berikut sudah dipersiapkan.',
                style: TextStyle(
                  fontSize: 12,
                  height: 1.5,
                  color: Color(0xFF718096),
                ),
              ),
              const Gap(16),
              ...List.generate(items.length, (index) {
                final item = items[index];

                return Padding(
                  padding: const EdgeInsets.only(bottom: 11),
                  child: DetailPersyaratanItemCard(
                    index: index + 1,
                    title: item.persyaratan.trim().isEmpty
                        ? 'Nama persyaratan tidak tersedia'
                        : item.persyaratan,
                  ),
                );
              }),
              const Gap(8),
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: const Color(0xFFEAF2FF),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.info_outline_rounded,
                      size: 19,
                      color: Color(0xFF3268B2),
                    ),
                    Gap(10),
                    Expanded(
                      child: Text(
                        'Periksa kembali kelengkapan dokumen sebelum '
                        'datang ke lokasi pengujian.',
                        style: TextStyle(
                          fontSize: 12,
                          height: 1.55,
                          color: Color(0xFF36577F),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class _MessageState extends StatelessWidget {
  const _MessageState({
    required this.icon,
    required this.title,
    required this.message,
    this.onRetry,
  });

  final IconData icon;
  final String title;
  final String message;
  final Future<void> Function()? onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(28),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: const Color(0xFFEAF2FF),
                borderRadius: BorderRadius.circular(22),
              ),
              child: Icon(
                icon,
                size: 33,
                color: const Color(0xFF3973C5),
              ),
            ),
            const Gap(18),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Color(0xFF172B4D),
              ),
            ),
            const Gap(8),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 13,
                height: 1.55,
                color: Color(0xFF718096),
              ),
            ),
            if (onRetry != null) ...[
              const Gap(18),
              OutlinedButton.icon(
                onPressed: onRetry == null
                    ? null
                    : () {
                        onRetry!();
                      },
                icon: const Icon(Icons.refresh_rounded),
                label: const Text('Coba lagi'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
