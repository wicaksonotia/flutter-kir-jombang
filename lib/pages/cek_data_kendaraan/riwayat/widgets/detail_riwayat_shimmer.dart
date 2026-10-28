import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';

class DetailRiwayatShimmer extends StatelessWidget {
  const DetailRiwayatShimmer({super.key});

  static const Color _baseColor = Color(0xFFE8EDF4);
  static const Color _highlightColor = Color(0xFFF8FAFC);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: _baseColor,
      highlightColor: _highlightColor,
      period: const Duration(milliseconds: 1300),
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 18, 16, 30),
        children: const [
          // Ringkasan kendaraan.
          _SkeletonCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _SkeletonLine(width: 120, height: 13),
                Gap(12),
                _SkeletonLine(width: 180, height: 22),
                Gap(10),
                _SkeletonLine(width: 145, height: 13),
                Gap(16),
                Row(
                  children: [
                    Expanded(
                      child: _SkeletonLine(height: 12),
                    ),
                    Gap(12),
                    Expanded(
                      child: _SkeletonLine(height: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Gap(26),

          _SkeletonHeading(
            titleWidth: 155,
            subtitleWidth: 205,
          ),

          Gap(12),

          // Identitas dan registrasi kendaraan.
          _SkeletonCard(
            child: _SkeletonRows(count: 9),
          ),

          Gap(24),

          _SkeletonHeading(
            titleWidth: 145,
            subtitleWidth: 190,
          ),

          Gap(12),

          // Rincian hasil pengujian.
          _SkeletonCard(
            child: _SkeletonRows(count: 7),
          ),

          Gap(24),

          _SkeletonHeading(
            titleWidth: 175,
            subtitleWidth: 210,
          ),

          Gap(12),

          // Dokumentasi kendaraan.
          _SkeletonPhotoGrid(),

          Gap(24),

          Center(
            child: Column(
              children: [
                _SkeletonLine(width: 19, height: 19, radius: 10),
                Gap(8),
                _SkeletonLine(width: 185, height: 11),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SkeletonCard extends StatelessWidget {
  const _SkeletonCard({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: _DetailRiwayatShimmerColors.base,
        ),
      ),
      child: child,
    );
  }
}

class _SkeletonHeading extends StatelessWidget {
  const _SkeletonHeading({
    required this.titleWidth,
    required this.subtitleWidth,
  });

  final double titleWidth;
  final double subtitleWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SkeletonLine(
          width: 42,
          height: 42,
          radius: 14,
        ),
        const Gap(12),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _SkeletonLine(
                  width: titleWidth,
                  height: 16,
                ),
                const Gap(7),
                _SkeletonLine(
                  width: subtitleWidth,
                  height: 11,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _SkeletonRows extends StatelessWidget {
  const _SkeletonRows({
    required this.count,
  });

  final int count;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(count, (index) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: index == count - 1 ? 0 : 17,
          ),
          child: Row(
            children: [
              const Expanded(
                flex: 4,
                child: _SkeletonLine(height: 12),
              ),
              const Gap(12),
              const _SkeletonLine(
                width: 5,
                height: 12,
                radius: 3,
              ),
              const Gap(12),
              Expanded(
                flex: 5,
                child: _SkeletonLine(
                  width: index.isEven ? 115 : 85,
                  height: 12,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class _SkeletonPhotoGrid extends StatelessWidget {
  const _SkeletonPhotoGrid();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 4,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.2,
      ),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: _DetailRiwayatShimmerColors.base,
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: _DetailRiwayatShimmerColors.base,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: _SkeletonLine(
                  width: 75,
                  height: 11,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _SkeletonLine extends StatelessWidget {
  const _SkeletonLine({
    this.width = double.infinity,
    required this.height,
    this.radius = 5,
  });

  final double width;
  final double height;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: _DetailRiwayatShimmerColors.base,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}

class _DetailRiwayatShimmerColors {
  static const Color base = Color(0xFFE8EDF4);
}
