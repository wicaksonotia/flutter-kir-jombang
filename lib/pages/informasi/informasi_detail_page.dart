import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:jombang/utils/colors.dart';
import 'package:jombang/utils/containers/app_bar_header.dart';

class InformasiDetailPage extends StatelessWidget {
  const InformasiDetailPage({
    super.key,
    required this.judul,
    required this.berita,
    required this.tanggal,
    required this.gambar,
  });

  final String judul;
  final String berita;
  final String tanggal;
  final String gambar;

  Uint8List? _decodeImage() {
    if (gambar.trim().isEmpty) return null;

    try {
      var data = gambar.trim();

      if (data.startsWith('data:')) {
        final separator = data.indexOf(',');
        if (separator == -1) return null;
        data = data.substring(separator + 1);
      }

      data = data.replaceAll(RegExp(r'\s+'), '');
      return base64Decode(base64.normalize(data));
    } catch (_) {
      return null;
    }
  }

  String _formatTanggal() {
    final date = DateTime.tryParse(tanggal);
    if (date == null) return 'Tanggal tidak tersedia';

    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'Mei',
      'Jun',
      'Jul',
      'Agu',
      'Sep',
      'Okt',
      'Nov',
      'Des',
    ];

    return '${date.day.toString().padLeft(2, '0')} '
        '${months[date.month - 1]} ${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    final imageBytes = _decodeImage();

    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FB),
      appBar: const AppbarHeader(
        header: 'Detail Berita',
        subtitle: 'Informasi lengkap',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(22),
            border: Border.all(
              color: const Color(0xFFE9EEF5),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (imageBytes != null)
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(22),
                  ),
                  child: Image.memory(
                    imageBytes,
                    width: double.infinity,
                    height: 220,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => const SizedBox.shrink(),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_month_rounded,
                          size: 17,
                          color: MyColors.primary,
                        ),
                        const SizedBox(width: 7),
                        Text(
                          _formatTanggal(),
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF718096),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      judul.trim().isEmpty
                          ? 'Informasi tanpa judul'
                          : judul.trim(),
                      style: const TextStyle(
                        fontSize: 21,
                        height: 1.4,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF172B4D),
                      ),
                    ),
                    const SizedBox(height: 18),
                    Text(
                      berita.trim().isEmpty
                          ? 'Belum ada isi informasi.'
                          : berita.trim(),
                      style: const TextStyle(
                        fontSize: 14,
                        height: 1.8,
                        color: Color(0xFF44546A),
                      ),
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
