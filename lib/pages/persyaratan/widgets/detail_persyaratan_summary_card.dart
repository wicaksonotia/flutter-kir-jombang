import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:jombang/utils/colors.dart';

class DetailPersyaratanSummaryCard extends StatelessWidget {
  const DetailPersyaratanSummaryCard({
    super.key,
    required this.total,
  });

  final int total;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: const Color(0xFFE7EDF5)),
      ),
      child: Row(
        children: [
          Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              color: MyColors.primary.withValues(alpha: 0.09),
              borderRadius: BorderRadius.circular(17),
            ),
            child: Icon(
              Icons.fact_check_outlined,
              color: MyColors.primary,
              size: 28,
            ),
          ),
          const Gap(15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Persyaratan dokumen',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF172B4D),
                  ),
                ),
                const Gap(5),
                Text(
                  '$total dokumen yang perlu dipersiapkan',
                  style: const TextStyle(
                    fontSize: 12,
                    height: 1.4,
                    color: Color(0xFF718096),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
