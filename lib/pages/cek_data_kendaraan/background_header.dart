import 'package:flutter/material.dart';

import 'package:jombang/pages/cek_data_kendaraan/search_bar_container.dart';
import 'package:jombang/utils/colors.dart';

class BackgroundHeader extends StatelessWidget {
  final String menu;
  final String title;
  final VoidCallback? onBack;

  const BackgroundHeader({
    super.key,
    required this.menu,
    this.title = 'Cek Data Kendaraan',
    this.onBack,
  });

  void _handleBack(BuildContext context) {
    if (onBack != null) {
      onBack!();
      return;
    }

    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.paddingOf(context).top;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Latar belakang biru.
        Container(
          height: topPadding + 190,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                MyColors.primary,
                MyColors.primary.withValues(alpha: 0.88),
              ],
            ),
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(26),
            ),
          ),
        ),

        // Ornamen dekoratif.
        Positioned(
          top: topPadding - 45,
          left: -35,
          child: const _HeaderCircle(size: 150),
        ),
        Positioned(
          top: topPadding + 40,
          right: -35,
          child: const _HeaderCircle(size: 115),
        ),

        // Tombol kembali dan judul.
        Padding(
          padding: EdgeInsets.fromLTRB(
            12,
            topPadding + 4,
            16,
            0,
          ),
          child: Row(
            children: [
              Material(
                color: Colors.white.withValues(alpha: 0.14),
                borderRadius: BorderRadius.circular(13),
                child: InkWell(
                  onTap: () => _handleBack(context),
                  borderRadius: BorderRadius.circular(13),
                  child: const SizedBox(
                    width: 44,
                    height: 44,
                    child: Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.white,
                      size: 23,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.1,
                  ),
                ),
              ),
            ],
          ),
        ),

        // Kartu pencarian.
        Container(
          width: double.infinity,
          margin: EdgeInsets.fromLTRB(
            16,
            topPadding + 64,
            16,
            16,
          ),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: const Color(0xFFE9EDF4),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.07),
                blurRadius: 20,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Icon(
                    Icons.manage_search_rounded,
                    size: 22,
                    color: MyColors.primary,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Cari Kendaraan',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1E293B),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              const Text(
                'Masukkan data kendaraan untuk melihat informasi pengujian.',
                style: TextStyle(
                  fontSize: 12,
                  height: 1.5,
                  color: Color(0xFF64748B),
                ),
              ),
              const SizedBox(height: 16),
              SearchBarContainer(menu: menu),
            ],
          ),
        ),
      ],
    );
  }
}

class _HeaderCircle extends StatelessWidget {
  final double size;

  const _HeaderCircle({
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withValues(alpha: 0.08),
      ),
    );
  }
}
