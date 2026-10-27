import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class RiwayatShimmer extends StatelessWidget {
  const RiwayatShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
      itemCount: 4,
      separatorBuilder: (_, __) => const SizedBox(height: 14),
      itemBuilder: (context, index) {
        return _RiwayatSkeleton(
          baseColor: colors.surfaceContainerHighest,
          highlightColor: colors.surface,
        );
      },
    );
  }
}

class _RiwayatSkeleton extends StatelessWidget {
  const _RiwayatSkeleton({
    required this.baseColor,
    required this.highlightColor,
  });

  final Color baseColor;
  final Color highlightColor;

  Widget _line({
    required double width,
    required double height,
    double radius = 6,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: baseColor,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      period: const Duration(milliseconds: 1400),
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: baseColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: baseColor,
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    color: baseColor,
                    borderRadius: BorderRadius.circular(13),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _line(width: 135, height: 13),
                      const SizedBox(height: 8),
                      _line(width: 95, height: 10),
                    ],
                  ),
                ),
                _line(width: 64, height: 25, radius: 20),
              ],
            ),
            const SizedBox(height: 20),
            Divider(
              height: 1,
              color: baseColor,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _line(width: 75, height: 10),
                      const SizedBox(height: 8),
                      _line(width: 115, height: 13),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _line(width: 75, height: 10),
                      const SizedBox(height: 8),
                      _line(width: 100, height: 13),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            _line(width: double.infinity, height: 42, radius: 12),
          ],
        ),
      ),
    );
  }
}
