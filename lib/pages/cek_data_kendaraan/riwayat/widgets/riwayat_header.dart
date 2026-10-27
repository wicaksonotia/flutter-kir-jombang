import 'package:flutter/material.dart';
import 'package:jombang/utils/colors.dart';

class RiwayatHeader extends StatelessWidget {
  final String noUji;
  final String noKendaraan;
  final String merk;
  final String tipe;

  const RiwayatHeader({
    super.key,
    required this.noUji,
    required this.noKendaraan,
    required this.merk,
    required this.tipe,
  });

  String _value(String value) {
    final text = value.trim();

    if (text.isEmpty || text.toLowerCase() == 'null') {
      return '-';
    }

    return text;
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final vehicleName = [
      _value(merk),
      _value(tipe),
    ].where((value) => value != '-').join(' ');

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: colors.outlineVariant.withValues(alpha: 0.55),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  color: MyColors.primary.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(11),
                ),
                child: const Icon(
                  Icons.directions_car_outlined,
                  color: MyColors.primary,
                  size: 21,
                ),
              ),
              const SizedBox(width: 11),
              Expanded(
                child: Text(
                  vehicleName.isEmpty ? 'Detail Kendaraan' : vehicleName,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Divider(
            height: 1,
            color: colors.outlineVariant.withValues(alpha: 0.6),
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _HeaderValue(
                  label: 'NOMOR UJI',
                  value: _value(noUji),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _HeaderValue(
                  label: 'NOMOR KENDARAAN',
                  value: _value(noKendaraan),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _HeaderValue extends StatelessWidget {
  final String label;
  final String value;

  const _HeaderValue({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: colors.onSurfaceVariant,
                fontSize: 10,
                letterSpacing: 0.4,
                fontWeight: FontWeight.w600,
              ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: colors.onSurface,
                fontWeight: FontWeight.w700,
              ),
        ),
      ],
    );
  }
}
