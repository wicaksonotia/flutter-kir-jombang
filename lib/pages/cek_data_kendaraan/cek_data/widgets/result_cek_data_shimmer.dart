import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ResultCekDataShimmer extends StatelessWidget {
  const ResultCekDataShimmer({super.key});

  static const Color _baseColor = Color(0xFFE8EDF4);
  static const Color _highlightColor = Color(0xFFF8FAFC);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
      physics: const NeverScrollableScrollPhysics(),
      child: Shimmer.fromColors(
        baseColor: _baseColor,
        highlightColor: _highlightColor,
        period: const Duration(milliseconds: 1300),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Judul hasil pencarian.
            Row(
              children: [
                _placeholder(width: 21, height: 21, radius: 6),
                const SizedBox(width: 8),
                _placeholder(width: 150, height: 19, radius: 5),
              ],
            ),
            const SizedBox(height: 14),

            // Kartu identitas kendaraan.
            _ShimmerCard(
              titleWidth: 170,
              rowCount: 9,
            ),
            const SizedBox(height: 14),

            // Kartu dimensi kendaraan.
            _ShimmerCard(
              titleWidth: 145,
              rowCount: 6,
            ),
          ],
        ),
      ),
    );
  }

  static Widget _placeholder({
    required double width,
    required double height,
    double radius = 8,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: _baseColor,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}

class _ShimmerCard extends StatelessWidget {
  const _ShimmerCard({
    required this.titleWidth,
    required this.rowCount,
  });

  final double titleWidth;
  final int rowCount;

  static const Color _baseColor = Color(0xFFE8EDF4);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: _baseColor,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Judul section.
          Container(
            width: titleWidth,
            height: 17,
            decoration: BoxDecoration(
              color: _baseColor,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          const SizedBox(height: 18),

          // Baris label dan nilai.
          ...List.generate(rowCount, (index) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: index == rowCount - 1 ? 0 : 15,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      height: 12,
                      decoration: BoxDecoration(
                        color: _baseColor,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Container(
                    width: 8,
                    height: 12,
                    decoration: BoxDecoration(
                      color: _baseColor,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 5,
                    child: Container(
                      height: 12,
                      decoration: BoxDecoration(
                        color: _baseColor,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
