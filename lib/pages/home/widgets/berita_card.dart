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

      if (!opened && context.mounted) {
        _showMessage(context, 'Tidak bisa membuka video YouTube.');
      }
    } catch (_) {
      if (context.mounted) {
        _showMessage(context, 'Gagal membuka video YouTube.');
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

  @override
  Widget build(BuildContext context) {
    final videoId = berita.youtubeId;
    final hasYoutube = videoId != null && videoId.trim().isNotEmpty;
    final title = berita.judul.trim().isNotEmpty
        ? berita.judul.trim()
        : (hasYoutube ? 'Video kegiatan Dishub' : 'Informasi Dishub');

    final summary = berita.berita.trim();

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
                  padding: const EdgeInsets.fromLTRB(12, 11, 12, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (_formatTanggal(berita.tanggal).isNotEmpty)
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
                                _formatTanggal(berita.tanggal),
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
                      Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 13,
                          height: 1.3,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF1B2F4A),
                        ),
                      ),
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
                      if (hasYoutube)
                        Row(
                          children: [
                            Icon(
                              Icons.play_circle_outline_rounded,
                              size: 16,
                              color: MyColors.primary,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              'Tonton video',
                              style: TextStyle(
                                color: MyColors.primary,
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
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

      return Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          Image.network(
            thumbnailUrl,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => _thumbnailPlaceholder(),
          ),
          Container(
            color: Colors.black.withValues(alpha: 0.12),
          ),
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.94),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.15),
                  blurRadius: 12,
                ),
              ],
            ),
            child: Icon(
              Icons.play_arrow_rounded,
              color: MyColors.primary,
              size: 30,
            ),
          ),
        ],
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
