import 'package:flutter/material.dart';
import 'package:jombang/pages/cek_data_kendaraan/text_left.dart';
import 'package:jombang/pages/cek_data_kendaraan/text_right.dart';

class DetailInfoRow extends StatelessWidget {
  final String label;
  final String value;

  const DetailInfoRow({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: TextLeft(nama: label),
          ),
          const SizedBox(width: 12),
          Expanded(
            flex: 6,
            child: Align(
              alignment: Alignment.centerRight,
              child: TextRight(nama: value.isEmpty ? '-' : value),
            ),
          ),
        ],
      ),
    );
  }
}
