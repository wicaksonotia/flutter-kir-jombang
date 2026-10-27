import 'package:flutter/material.dart';

import '../utils/riwayat_image_helper.dart';

class RiwayatFotoKendaraan extends StatelessWidget {
  final String? depan;
  final String? belakang;
  final String? kanan;
  final String? kiri;

  const RiwayatFotoKendaraan({
    super.key,
    this.depan,
    this.belakang,
    this.kanan,
    this.kiri,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Theme.of(context)
              .colorScheme
              .outlineVariant
              .withValues(alpha: 0.45),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.photo_library_outlined,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 10),
              Text(
                'Foto Kendaraan',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          LayoutBuilder(
            builder: (context, constraints) {
              final itemWidth = (constraints.maxWidth - 10) / 2;

              return Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  _PhotoTile(
                    label: 'Depan',
                    image: depan,
                    width: itemWidth,
                  ),
                  _PhotoTile(
                    label: 'Belakang',
                    image: belakang,
                    width: itemWidth,
                  ),
                  _PhotoTile(
                    label: 'Kanan',
                    image: kanan,
                    width: itemWidth,
                  ),
                  _PhotoTile(
                    label: 'Kiri',
                    image: kiri,
                    width: itemWidth,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _PhotoTile extends StatelessWidget {
  final String label;
  final String? image;
  final double width;

  const _PhotoTile({
    required this.label,
    required this.image,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final bytes = RiwayatImageHelper.decodeBase64(image);

    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(13),
            child: AspectRatio(
              aspectRatio: 4 / 3,
              child: bytes == null
                  ? _Placeholder(colors: colors)
                  : Image.memory(
                      bytes,
                      fit: BoxFit.cover,
                      gaplessPlayback: true,
                      errorBuilder: (_, __, ___) =>
                          _Placeholder(colors: colors),
                    ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
        ],
      ),
    );
  }
}

class _Placeholder extends StatelessWidget {
  final ColorScheme colors;

  const _Placeholder({required this.colors});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colors.surfaceContainerHighest.withValues(alpha: 0.55),
      alignment: Alignment.center,
      child: Icon(
        Icons.directions_car_outlined,
        size: 36,
        color: colors.onSurfaceVariant.withValues(alpha: 0.45),
      ),
    );
  }
}
