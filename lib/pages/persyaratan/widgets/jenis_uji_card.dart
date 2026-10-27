import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:jombang/models/persyaratan_model.dart';
import 'package:jombang/utils/colors.dart';

class JenisUjiCard extends StatelessWidget {
  const JenisUjiCard({
    super.key,
    required this.item,
    required this.onTap,
  });

  final PersyaratanModel item;
  final VoidCallback onTap;

  Color _parseColor(String? hex) {
    final value = (hex ?? '').replaceAll('#', '').trim();

    if (value.isEmpty) return MyColors.primary;

    final normalized = value.length == 6 ? 'FF$value' : value;

    try {
      return Color(int.parse(normalized, radix: 16));
    } catch (_) {
      return MyColors.primary;
    }
  }

  @override
  Widget build(BuildContext context) {
    final accentColor = _parseColor(item.warna);

    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: const Color(0xFFE7EDF5),
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: accentColor.withValues(alpha: 0.11),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(
                  Icons.assignment_outlined,
                  color: accentColor,
                  size: 25,
                ),
              ),
              const Gap(14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.nama ?? 'Jenis pengujian',
                      style: const TextStyle(
                        color: Color(0xFF172B4D),
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Gap(5),
                    Text(
                      item.keterangan ?? 'Lihat persyaratan pengujian.',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Color(0xFF718096),
                        fontSize: 12,
                        height: 1.45,
                      ),
                    ),
                    const Gap(10),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Lihat persyaratan',
                          style: TextStyle(
                            color: accentColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Gap(5),
                        Icon(
                          Icons.arrow_forward_rounded,
                          size: 15,
                          color: accentColor,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
