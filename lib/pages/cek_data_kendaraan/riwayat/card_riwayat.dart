import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:jombang/controllers/riwayat_kendaraan_controller.dart';
import 'package:jombang/utils/colors.dart';

class CardRiwayat extends StatelessWidget {
  const CardRiwayat({
    super.key,
    required this.controller,
    required this.index,
  });

  final RiwayatKendaraanController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Obx(() {
      final item = controller.resultData[index];
      final isLulus = item.statusLulus?.toUpperCase() == 'LULUS';

      final statusColor =
          isLulus ? const Color(0xFF16845B) : const Color(0xFFD94848);

      final statusBackground =
          isLulus ? const Color(0xFFE8F6EF) : const Color(0xFFFFEEEE);

      return Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            final idHasilUji = item.idHasilUji;
            final noUji = item.noUji?.trim();

            if (idHasilUji == null || noUji == null || noUji.isEmpty) {
              Get.snackbar(
                'Informasi',
                'ID hasil pengujian atau nomor uji tidak tersedia.',
                snackPosition: SnackPosition.BOTTOM,
              );
              return;
            }

            Get.toNamed(
              '/detailriwayat',
              arguments: {
                'idhasiluji': idHasilUji,
                'no_uji': noUji,
              },
            );
          },
          child: Ink(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: theme.colorScheme.outlineVariant.withValues(
                  alpha: 0.55,
                ),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.025),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Jenis pengujian dan status
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: MyColors.primary.withValues(alpha: 0.09),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.fact_check_outlined,
                          color: MyColors.primary,
                          size: 21,
                        ),
                      ),
                      const SizedBox(width: 11),
                      Expanded(
                        child: Text(
                          item.nmUji ?? 'Pengujian Kendaraan',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w800,
                            fontSize: 14,
                            height: 1.3,
                            letterSpacing: -0.2,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 9,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: statusBackground,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              isLulus
                                  ? Icons.check_circle_rounded
                                  : Icons.cancel_rounded,
                              size: 13,
                              color: statusColor,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              item.statusLulus ?? '-',
                              style: TextStyle(
                                color: statusColor,
                                fontSize: 10,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 13),

                  // Informasi tanggal
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 11,
                      vertical: 9,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F8FC),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.calendar_month_outlined,
                          size: 17,
                          color: MyColors.primary,
                        ),
                        const SizedBox(width: 9),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'TANGGAL PENGUJIAN',
                                style: theme.textTheme.labelSmall?.copyWith(
                                  color: theme.colorScheme.onSurfaceVariant,
                                  fontSize: 9,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.65,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                item.tglUji ?? '-',
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 13,
                          color: MyColors.primary,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
