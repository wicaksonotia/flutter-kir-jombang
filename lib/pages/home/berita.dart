import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jombang/controllers/berita_controller.dart';
import 'package:jombang/models/berita_model.dart';
import 'package:jombang/utils/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class Berita extends StatelessWidget {
  const Berita({
    super.key,
    required this.beritaController,
  });

  final BeritaController beritaController;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (beritaController.isLoading.value &&
          beritaController.resultData.isEmpty) {
        return const SizedBox(
          height: 160,
          child: Center(child: CircularProgressIndicator()),
        );
      }

      if (beritaController.hasError.value &&
          beritaController.resultData.isEmpty) {
        return _buildMessage(
          'Berita gagal dimuat.',
          action: TextButton(
            onPressed: beritaController.fetchData,
            child: const Text('Coba lagi'),
          ),
        );
      }

      final items = beritaController.resultData;

      if (items.isEmpty) {
        return _buildMessage('Belum ada berita.');
      }

      return GridView.builder(
        padding: const EdgeInsets.all(10),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          mainAxisExtent: 270,
        ),
        itemBuilder: (context, index) {
          return _BeritaCard(berita: items[index]);
        },
      );
    });
  }

  Widget _buildMessage(String message, {Widget? action}) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(message, textAlign: TextAlign.center),
            if (action != null) action,
          ],
        ),
      ),
    );
  }
}

class _BeritaCard extends StatelessWidget {
  const _BeritaCard({required this.berita});

  final BeritaModel berita;

  Future<void> _openYoutube(BuildContext context) async {
    final videoId = berita.youtubeId;
    if (videoId == null) return;

    final uri = Uri.parse('https://www.youtube.com/watch?v=$videoId');

    try {
      final opened = await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );

      if (!opened && context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Tidak bisa membuka video YouTube.')),
        );
      }
    } catch (_) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Gagal membuka video YouTube.')),
        );
      }
    }
  }

  String _formatTanggal(String value) {
    final date = DateTime.tryParse(value);
    if (date == null) return '';

    // Format numerik tidak memerlukan inisialisasi locale.
    return DateFormat('dd-MM-yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    final videoId = berita.youtubeId;
    final imageBytes = berita.imageBytes;
    final hasYoutube = videoId != null;

    return Card(
      margin: EdgeInsets.zero,
      elevation: 2,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: InkWell(
        onTap: hasYoutube ? () => _openYoutube(context) : null,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildThumbnail(
                videoId: videoId,
                imageBytes: imageBytes,
              ),
              const SizedBox(height: 9),
              Row(
                children: [
                  const Icon(
                    Icons.calendar_month,
                    size: 14,
                    color: MyColors.green,
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Text(
                      _formatTanggal(berita.tanggal),
                      style: const TextStyle(
                        fontSize: 11,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Text(
                berita.judul.isNotEmpty
                    ? berita.judul
                    : (hasYoutube ? 'Video YouTube' : 'Berita'),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (!hasYoutube && berita.berita.trim().isNotEmpty) ...[
                const SizedBox(height: 5),
                Expanded(
                  child: Text(
                    berita.berita,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 11,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ] else
                const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildThumbnail({
    required String? videoId,
    required dynamic imageBytes,
  }) {
    if (videoId != null) {
      final thumbnailUrl = 'https://img.youtube.com/vi/$videoId/hqdefault.jpg';

      return SizedBox(
        width: double.infinity,
        height: 105,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned.fill(
              child: Image.network(
                thumbnailUrl,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => _placeholder(),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Colors.black54,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 30,
              ),
            ),
          ],
        ),
      );
    }

    if (imageBytes != null && imageBytes.isNotEmpty) {
      return SizedBox(
        width: double.infinity,
        height: 105,
        child: Image.memory(
          imageBytes,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => _placeholder(),
        ),
      );
    }

    return _placeholder();
  }

  Widget _placeholder() {
    return Container(
      width: double.infinity,
      height: 105,
      color: Colors.grey.shade200,
      alignment: Alignment.center,
      child: const Icon(
        Icons.article_outlined,
        size: 34,
        color: Colors.grey,
      ),
    );
  }
}
