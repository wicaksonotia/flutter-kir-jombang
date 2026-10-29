import 'package:flutter/material.dart';

import 'package:jombang/utils/colors.dart';

class ResultCekDataEmpty extends StatelessWidget {
  const ResultCekDataEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 28,
          vertical: 24,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 88,
              height: 88,
              decoration: BoxDecoration(
                color: MyColors.primary.withValues(alpha: 0.08),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.directions_car_outlined,
                size: 42,
                color: MyColors.primary,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Informasi Kendaraan',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Color(0xFF1E293B),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Masukkan Nomor Uji dan 5 digit terakhir Nomor Rangka, '
              'lalu tekan tombol cari untuk melihat detail kendaraan.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                height: 1.6,
                color: Color(0xFF64748B),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
