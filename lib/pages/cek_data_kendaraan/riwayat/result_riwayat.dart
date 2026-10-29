import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import 'package:jombang/controllers/riwayat_kendaraan_controller.dart';
import 'package:jombang/pages/cek_data_kendaraan/riwayat/card_riwayat.dart';
import 'package:jombang/pages/cek_data_kendaraan/riwayat/riwayat_shimmer.dart';

class ResultRiwayat extends StatelessWidget {
  ResultRiwayat({super.key});

  final RiwayatKendaraanController controller =
      Get.find<RiwayatKendaraanController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoadingRiwayat.value) {
        return const RiwayatShimmer();
      }

      final riwayat = controller.resultData;

      if (riwayat.isEmpty) {
        return const _EmptyRiwayat();
      }

      return ListView.separated(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 28),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        itemCount: riwayat.length,
        separatorBuilder: (_, __) => const SizedBox(height: 14),
        itemBuilder: (context, index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 350),
            child: SlideAnimation(
              verticalOffset: 18,
              child: FadeInAnimation(
                child: CardRiwayat(
                  controller: controller,
                  index: index,
                ),
              ),
            ),
          );
        },
      );
    });
  }
}

class _EmptyRiwayat extends StatelessWidget {
  const _EmptyRiwayat();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 32,
          vertical: 24,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 76,
              height: 76,
              decoration: BoxDecoration(
                color: colors.primary.withValues(alpha: 0.08),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.manage_search_rounded,
                size: 36,
                color: colors.primary,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Riwayat Uji Kendaraan',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.3,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              'Masukkan Nomor Uji dan 5 digit terakhir Nomor Rangka '
              'untuk melihat riwayat pengujian kendaraan.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colors.onSurfaceVariant,
                    height: 1.6,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
