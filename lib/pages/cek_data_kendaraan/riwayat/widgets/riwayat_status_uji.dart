import 'package:flutter/material.dart';

class RiwayatStatusUji extends StatelessWidget {
  final String title;
  final bool isPassed;
  final List<String> reasons;

  const RiwayatStatusUji({
    super.key,
    required this.title,
    required this.isPassed,
    this.reasons = const [],
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final statusColor = isPassed ? Colors.green.shade600 : colors.error;
    final filteredReasons = reasons
        .map((item) => item.trim())
        .where((item) => item.isNotEmpty && item.toLowerCase() != 'null')
        .toSet()
        .toList();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        color: colors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              Icon(
                isPassed ? Icons.check_circle_rounded : Icons.cancel_rounded,
                color: statusColor,
                size: 25,
              ),
            ],
          ),
          if (!isPassed) ...[
            const SizedBox(height: 12),
            Divider(
              height: 1,
              color: colors.outlineVariant.withValues(alpha: 0.6),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                filteredReasons.isEmpty
                    ? 'Keterangan tidak lulus belum tersedia.'
                    : 'Keterangan',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: colors.onSurfaceVariant,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
            if (filteredReasons.isNotEmpty) ...[
              const SizedBox(height: 8),
              ...filteredReasons.map(
                (reason) => Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Icon(
                          Icons.circle,
                          size: 6,
                          color: colors.error,
                        ),
                      ),
                      const SizedBox(width: 9),
                      Expanded(
                        child: Text(
                          reason,
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    height: 1.45,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ],
      ),
    );
  }
}
