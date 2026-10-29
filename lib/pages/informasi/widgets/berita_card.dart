import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:jombang/pages/informasi/informasi_detail_page.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:jombang/utils/colors.dart';

class BeritaCard extends StatelessWidget {
  const BeritaCard({
    super.key,
    required this.id,
    required this.judul,
    required this.berita,
    required this.tanggal,
    required this.gambar,
  });

  final String id;
  final String judul;
  final String berita;
  final String tanggal;
  final String gambar;

  String? get youtubeId {
    final text = '$berita $gambar';

    final patterns = [
      RegExp(
        r'(?:youtube\.com/watch\?(?:.*&)?v=|youtu\.be/)([a-zA-Z0-9_-]{11})',
        caseSensitive: false,
      ),
      RegExp(
        r'youtube\.com/(?:embed|shorts|live)/([a-zA-Z0-9_-]{11})',
        caseSensitive: false,
      ),
    ];

    for (final pattern in patterns) {
      final match = pattern.firstMatch(text);
      if (match != null) return match.group(1);
    }

    return null;
  }

  static final Dio _dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  static final Map<String, Future<String?>> _youtubeTitleCache = {};

  Future<String?> _fetchYoutubeTitle(String videoId) {
    return _youtubeTitleCache.putIfAbsent(videoId, () async {
      try {
        final response = await _dio.get(
          'https://www.youtube.com/oembed',
          queryParameters: {
            'url': 'https://www.youtube.com/watch?v=$videoId',
            'format': 'json',
          },
        );

        final data = response.data;

        if (data is Map && data['title'] is String) {
          final title = (data['title'] as String).trim();

          if (title.isNotEmpty) {
            return title;
          }
        }
      } catch (_) {
        // Judul gagal dimuat akan ditampilkan sebagai pesan error.
      }

      return null;
    });
  }

  Uint8List? _decodeImage(String value) {
    if (value.trim().isEmpty) return null;

    try {
      var data = value.trim();

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

  Future<void> _openContent() async {
    final videoId = youtubeId;

    if (videoId != null) {
      final uri = Uri.parse(
        'https://www.youtube.com/watch?v=$videoId',
      );

      try {
        final opened = await launchUrl(
          uri,
          mode: LaunchMode.externalApplication,
        );

        if (!opened) {
          await launchUrl(
            uri,
            mode: LaunchMode.platformDefault,
          );
        }
      } catch (_) {
        try {
          await launchUrl(
            uri,
            mode: LaunchMode.platformDefault,
          );
        } catch (_) {
          // Gagal membuka YouTube.
        }
      }

      return;
    }

    Get.to(
      () => InformasiDetailPage(
        judul: judul,
        berita: berita,
        tanggal: tanggal,
        gambar: gambar,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final videoId = youtubeId;
    final imageBytes = _decodeImage(gambar);

    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(22),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: _openContent,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            border: Border.all(
              color: const Color(0xFFE9EEF5),
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF172B4D).withValues(alpha: 0.035),
                blurRadius: 18,
                offset: const Offset(0, 7),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                height: 160,
                child: videoId != null
                    ? Image.network(
                        'https://img.youtube.com/vi/$videoId/hqdefault.jpg',
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) =>
                            const _BeritaImagePlaceholder(),
                      )
                    : imageBytes != null
                        ? Image.memory(
                            imageBytes,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) =>
                                const _BeritaImagePlaceholder(),
                          )
                        : const _BeritaImagePlaceholder(),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(
                    16,
                    15,
                    16,
                    14,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (videoId != null)
                        FutureBuilder<String?>(
                          future: _fetchYoutubeTitle(videoId),
                          builder: (context, snapshot) {
                            String title;

                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              title = 'Memuat judul YouTube...';
                            } else if (snapshot.data == null ||
                                snapshot.data!.isEmpty) {
                              title = 'Judul YouTube tidak tersedia';
                            } else {
                              title = snapshot.data!;
                            }

                            return Text(
                              title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 15,
                                height: 1.35,
                                fontWeight: FontWeight.w700,
                                letterSpacing: -0.2,
                                color: Color(0xFF172B4D),
                              ),
                            );
                          },
                        )
                      else
                        Text(
                          judul.trim().isEmpty
                              ? 'Informasi tanpa judul'
                              : judul.trim(),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 15,
                            height: 1.35,
                            fontWeight: FontWeight.w700,
                            letterSpacing: -0.2,
                            color: Color(0xFF172B4D),
                          ),
                        ),
                      const Gap(8),
                      Expanded(
                        child: Text(
                          videoId != null
                              ? 'Tonton video selengkapnya di YouTube.'
                              : berita.trim().isEmpty
                                  ? 'Belum ada ringkasan informasi.'
                                  : berita.trim(),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 12,
                            height: 1.55,
                            color: Color(0xFF718096),
                          ),
                        ),
                      ),
                      const Gap(8),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            videoId != null
                                ? 'Tonton di YouTube'
                                : 'Baca selengkapnya',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: MyColors.primary,
                            ),
                          ),
                          const Gap(5),
                          Icon(
                            videoId != null
                                ? Icons.open_in_new_rounded
                                : Icons.arrow_forward_rounded,
                            size: 15,
                            color: MyColors.primary,
                          ),
                        ],
                      ),
                      if (videoId == null) ...[
                        const Gap(8),
                        Text(
                          _formatTanggal(),
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF718096),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BeritaImagePlaceholder extends StatelessWidget {
  const _BeritaImagePlaceholder();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFEAF2FF),
      alignment: Alignment.center,
      child: const Icon(
        Icons.newspaper_rounded,
        size: 42,
        color: Color(0xFF8BA9D5),
      ),
    );
  }
}
