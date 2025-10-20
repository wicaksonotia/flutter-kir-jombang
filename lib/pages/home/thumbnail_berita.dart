import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;

class ThumbnailBerita extends StatefulWidget {
  const ThumbnailBerita({super.key});

  @override
  State<ThumbnailBerita> createState() => _ThumbnailBeritaState();
}

class _ThumbnailBeritaState extends State<ThumbnailBerita> {
  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  String? _thumbnailUrl;
  String? _title;

  // Ambil ID video dari YouTube
  String? _getYoutubeId(String url) {
    try {
      final Uri uri = Uri.parse(url);
      if (uri.host.contains('youtu.be')) {
        return uri.pathSegments.first;
      } else if (uri.host.contains('youtube.com')) {
        return uri.queryParameters['v'];
      }
    } catch (_) {}
    return null;
  }

  // Ambil data YouTube (thumbnail + title)
  Future<Map<String, String>> _getYoutubeData(String url) async {
    final id = _getYoutubeId(url);
    if (id == null) throw Exception('URL YouTube tidak valid');

    // Thumbnail langsung
    final thumb = 'https://img.youtube.com/vi/$id/hqdefault.jpg';

    // Ambil title via scraping
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var document = parser.parse(response.body);
      String? title = document.head!
          .getElementsByTagName('meta')
          .firstWhere((e) =>
              e.attributes['name'] == 'title' ||
              e.attributes['property'] == 'og:title')
          .attributes['content'];
      return {'thumbnail': thumb, 'title': title ?? 'Video YouTube'};
    } else {
      throw Exception('Gagal memuat data YouTube');
    }
  }

  // Ambil data TikTok (thumbnail + title)
  Future<Map<String, String>> _getTikTokData(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var document = parser.parse(response.body);

      String? thumb = document.head!
          .getElementsByTagName('meta')
          .where((e) => e.attributes['property'] == 'og:image')
          .map((e) => e.attributes['content'])
          .firstWhere((c) => c != null && c.isNotEmpty, orElse: () => null);

      String? title = document.head!
          .getElementsByTagName('meta')
          .where((e) => e.attributes['property'] == 'og:title')
          .map((e) => e.attributes['content'])
          .firstWhere((c) => c != null && c.isNotEmpty, orElse: () => null);

      return {'thumbnail': thumb ?? '', 'title': title ?? 'Video TikTok'};
    } else {
      throw Exception('Gagal memuat halaman TikTok');
    }
  }

  // Tentukan platform & ambil datanya
  Future<void> _fetchData() async {
    setState(() {
      _thumbnailUrl = null;
      _title = null;
    });

    final url =
        'https://www.youtube.com/watch?v=gBg0qyuK1EQ&list=RDgBg0qyuK1EQ&start_radio=1';

    try {
      Map<String, String>? data;
      if (url.contains('youtube.com') || url.contains('youtu.be')) {
        data = await _getYoutubeData(url);
      } else if (url.contains('tiktok.com')) {
        data = await _getTikTokData(url);
      } else {
        setState(() {
          _title = "URL tidak didukung";
        });
      }

      if (data != null) {
        setState(() {
          _thumbnailUrl = data?['thumbnail'];
          _title = data?['title'];
        });
      }
    } catch (e) {
      setState(() {
        _title = "Terjadi kesalahan: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return (_thumbnailUrl != null && _thumbnailUrl!.isNotEmpty)
        ? Column(
            children: [
              Image.network(_thumbnailUrl!),
              const SizedBox(height: 10),
              Text(
                _title ?? '',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          )
        : (_title != null
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  _title!,
                  style: const TextStyle(fontSize: 14, color: Colors.red),
                  textAlign: TextAlign.center,
                ),
              )
            : const SizedBox.shrink());
  }
}
