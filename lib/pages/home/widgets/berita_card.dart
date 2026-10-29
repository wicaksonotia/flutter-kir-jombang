import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jombang/models/berita_model.dart';
import 'package:jombang/utils/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class BeritaCard extends StatelessWidget {
  const BeritaCard({
    super.key,
    required this.berita,
  });

  final BeritaModel berita;

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
        // Judul YouTube gagal dimuat.
      }

      return null;
    });
  }

  Future<void> _openYoutube(BuildContext context) async {
    final videoId = berita.youtubeId;
    if (videoId == null || videoId.trim().isEmpty) return;

    final uri = Uri.parse(
      'https://www.youtube.com/watch?v=${videoId.trim()}',
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
        if (context.mounted) {
          _showMessage(
            context,
            'Tidak bisa membuka video YouTube.',
          );
        }
      }
    }
  }

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  String _formatTanggal(String value) {
    final date = DateTime.tryParse(value);
    if (date == null) return '';

    const bulan = [
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
        '${bulan[date.month - 1]} ${date.year}';
  }

  Widget _buildTitle(bool hasYoutube, String? videoId) {
    if (hasYoutube && videoId != null) {
      return FutureBuilder<String?>(
        future: _fetchYoutubeTitle(videoId.trim()),
        builder: (context, snapshot) {
          final youtubeTitle = snapshot.data;

          final title = snapshot.connectionState == ConnectionState.waiting
              ? 'Memuat judul YouTube...'
              : youtubeTitle != null && youtubeTitle.isNotEmpty
                  ? youtubeTitle
                  : 'Judul YouTube tidak tersedia';

          return Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 13,
              height: 1.3,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1B2F4A),
            ),
          );
        },
      );
    }

    final title = berita.judul.trim().isNotEmpty
        ? berita.judul.trim()
        : 'Informasi Dishub';

    return Text(
      title,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        fontSize: 13,
        height: 1.3,
        fontWeight: FontWeight.w700,
        color: Color(0xFF1B2F4A),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final videoId = berita.youtubeId;
    final hasYoutube = videoId != null && videoId.trim().isNotEmpty;
    final summary = berita.berita.trim();
    final tanggal = _formatTanggal(berita.tanggal);

    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: hasYoutube ? () => _openYoutube(context) : null,
        borderRadius: BorderRadius.circular(18),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: const Color(0xFFE8EDF4),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 5,
                child: SizedBox(
                  width: double.infinity,
                  child: _buildThumbnail(videoId),
                ),
              ),
              Expanded(
                flex: 6,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(
                    12,
                    11,
                    12,
                    10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (tanggal.isNotEmpty)
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_today_rounded,
                              size: 12,
                              color: MyColors.primary,
                            ),
                            const SizedBox(width: 5),
                            Expanded(
                              child: Text(
                                tanggal,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 10,
                                  color: Color(0xFF75849A),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      const SizedBox(height: 7),
                      _buildTitle(hasYoutube, videoId),
                      if (!hasYoutube && summary.isNotEmpty) ...[
                        const SizedBox(height: 5),
                        Expanded(
                          child: Text(
                            summary,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 11,
                              height: 1.4,
                              color: Color(0xFF738197),
                            ),
                          ),
                        ),
                      ] else
                        const Spacer(),
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

  Widget _buildThumbnail(String? videoId) {
    if (videoId != null && videoId.trim().isNotEmpty) {
      final thumbnailUrl =
          'https://img.youtube.com/vi/${videoId.trim()}/hqdefault.jpg';

      return Image.network(
        thumbnailUrl,
        fit: BoxFit.cover,
        width: double.infinity,
        errorBuilder: (_, __, ___) => _thumbnailPlaceholder(),
      );
    }

    final imageBytes = berita.imageBytes;

    if (imageBytes != null && imageBytes.isNotEmpty) {
      return Image.memory(
        imageBytes,
        fit: BoxFit.cover,
        width: double.infinity,
        errorBuilder: (_, __, ___) => _thumbnailPlaceholder(),
      );
    }

    return _thumbnailPlaceholder();
  }

  Widget _thumbnailPlaceholder() {
    return Container(
      color: const Color(0xFFEDF2F8),
      alignment: Alignment.center,
      child: Icon(
        Icons.image_outlined,
        size: 34,
        color: MyColors.primary.withValues(alpha: 0.55),
      ),
    );
  }
}
