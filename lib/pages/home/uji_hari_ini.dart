import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:jombang/controllers/uji_hari_ini_controller.dart';
import 'package:jombang/pages/home/widgets/uji_hari_ini_shimmer.dart';
import 'package:jombang/utils/colors.dart';

class UjiHariIni extends StatelessWidget {
  const UjiHariIni({
    super.key,
    required this.ujiHariIniController,
  });

  final UjiHariIniController ujiHariIniController;

  static const Color _ink = Color(0xFF1B2F4A);
  static const Color _muted = Color(0xFF8290A3);
  static const Color _line = Color(0xFFEBEFF5);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (ujiHariIniController.isLoading.value) {
        return const UjiHariIniShimmer();
      }

      if (ujiHariIniController.hasError.value) {
        return _ErrorState(
          onRetry: () => ujiHariIniController.fetchData(),
        );
      }

      final data = ujiHariIniController.resultData.value;

      final statistics = <_Statistic>[
        _Statistic(
          title: 'Uji pertama',
          value: data.ujiPertama,
          icon: Icons.add_road_rounded,
        ),
        _Statistic(
          title: 'Uji berkala',
          value: data.ujiBerkala,
          icon: Icons.verified_rounded,
        ),
        _Statistic(
          title: 'Numpang uji',
          value: data.numpangMasuk,
          icon: Icons.move_to_inbox_rounded,
        ),
        _Statistic(
          title: 'Mutasi masuk',
          value: data.mutasiMasuk,
          icon: Icons.swap_horiz_rounded,
        ),
      ];

      final total = statistics.fold<int>(
        0,
        (sum, item) => sum + _parseNumber(item.value),
      );

      return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: _line),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF18365B).withValues(alpha: 0.035),
              blurRadius: 22,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Ringkasan utama
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 18),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 7,
                              height: 7,
                              decoration: BoxDecoration(
                                color: const Color(0xFF27A47B),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            const SizedBox(width: 7),
                            const Text(
                              'RINGKASAN HARI INI',
                              style: TextStyle(
                                fontSize: 10,
                                letterSpacing: 1.15,
                                fontWeight: FontWeight.w700,
                                color: _muted,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          _formatNumber(total),
                          style: const TextStyle(
                            fontSize: 36,
                            height: 1.05,
                            letterSpacing: -1.2,
                            fontWeight: FontWeight.w800,
                            color: _ink,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'Total kendaraan terlayani',
                          style: TextStyle(
                            fontSize: 12,
                            color: _muted,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 54,
                    height: 54,
                    decoration: BoxDecoration(
                      color: MyColors.primary.withValues(alpha: 0.08),
                      borderRadius: BorderRadius.circular(17),
                    ),
                    child: Icon(
                      Icons.fact_check_rounded,
                      size: 28,
                      color: MyColors.primary,
                    ),
                  ),
                ],
              ),
            ),

            // Garis pemisah
            const Divider(height: 1, thickness: 1, color: _line),

            // Statistik kategori 2 x 2
            Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(child: _StatisticItem(item: statistics[0])),
                      const SizedBox(width: 14),
                      Expanded(child: _StatisticItem(item: statistics[1])),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Divider(
                      height: 1,
                      thickness: 1,
                      color: _line,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(child: _StatisticItem(item: statistics[2])),
                      const SizedBox(width: 14),
                      Expanded(child: _StatisticItem(item: statistics[3])),
                    ],
                  ),
                ],
              ),
            ),

            // Footer
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 12,
              ),
              decoration: const BoxDecoration(
                color: Color(0xFFF8FAFD),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(22),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline_rounded,
                    size: 15,
                    color: MyColors.primary,
                  ),
                  const SizedBox(width: 7),
                  const Expanded(
                    child: Text(
                      'Data pengujian kendaraan hari ini',
                      style: TextStyle(
                        fontSize: 10,
                        color: _muted,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_rounded,
                    size: 15,
                    color: MyColors.primary.withValues(alpha: 0.7),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  static int _parseNumber(Object? value) {
    if (value is num) return value.round();

    final text = value?.toString().trim() ?? '';
    if (text.isEmpty) return 0;

    return int.tryParse(text.replaceAll('.', '').replaceAll(',', '')) ??
        int.tryParse(text) ??
        0;
  }

  static String _formatNumber(int value) {
    final text = value.toString();
    return text.replaceAllMapped(
      RegExp(r'\B(?=(\d{3})+(?!\d))'),
      (_) => '.',
    );
  }
}

class _Statistic {
  const _Statistic({
    required this.title,
    required this.value,
    required this.icon,
  });

  final String title;
  final Object? value;
  final IconData icon;
}

class _StatisticItem extends StatelessWidget {
  const _StatisticItem({required this.item});

  final _Statistic item;

  @override
  Widget build(BuildContext context) {
    final rawValue = item.value;
    final parsedValue = rawValue is num
        ? rawValue.round()
        : int.tryParse(rawValue?.toString() ?? '');

    final displayValue = parsedValue == null
        ? (rawValue?.toString() ?? '0')
        : _formatValue(parsedValue);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 34,
          height: 34,
          decoration: BoxDecoration(
            color: MyColors.primary.withValues(alpha: 0.07),
            borderRadius: BorderRadius.circular(11),
          ),
          child: Icon(
            item.icon,
            size: 18,
            color: MyColors.primary,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 11,
                  height: 1.3,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF75849A),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                displayValue,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 21,
                  height: 1.1,
                  letterSpacing: -0.5,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF1B2F4A),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _formatValue(int value) {
    return value.toString().replaceAllMapped(
          RegExp(r'\B(?=(\d{3})+(?!\d))'),
          (_) => '.',
        );
  }
}

class _ErrorState extends StatelessWidget {
  const _ErrorState({required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: const Color(0xFFEBEFF5)),
      ),
      child: Column(
        children: [
          Icon(
            Icons.cloud_off_rounded,
            size: 32,
            color: MyColors.primary.withValues(alpha: 0.65),
          ),
          const SizedBox(height: 10),
          const Text(
            'Data belum tersedia',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1B2F4A),
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            'Periksa koneksi internet dan coba muat ulang data.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              height: 1.5,
              color: Color(0xFF8290A3),
            ),
          ),
          const SizedBox(height: 14),
          OutlinedButton.icon(
            onPressed: onRetry,
            icon: const Icon(Icons.refresh_rounded, size: 17),
            label: const Text('Coba lagi'),
            style: OutlinedButton.styleFrom(
              foregroundColor: MyColors.primary,
              side: BorderSide(
                color: MyColors.primary.withValues(alpha: 0.3),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
