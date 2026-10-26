import 'dart:convert';
import 'dart:typed_data';

class BeritaModel {
  final int? id;
  final String judul;
  final String berita;
  final String tanggal;
  final String? gambar;
  final bool status;

  const BeritaModel({
    this.id,
    this.judul = '',
    this.berita = '',
    this.tanggal = '',
    this.gambar,
    this.status = false,
  });

  factory BeritaModel.fromJson(Map<String, dynamic> json) {
    return BeritaModel(
      id: int.tryParse(json['id']?.toString() ?? ''),
      judul: json['judul']?.toString() ?? '',
      berita: json['berita']?.toString() ?? '',
      tanggal: json['tanggal']?.toString() ?? '',
      gambar: json['gambar']?.toString(),
      status: json['status'] == true,
    );
  }

  Uint8List? get imageBytes {
    final value = gambar?.trim();

    if (value == null || value.isEmpty) return null;

    try {
      var base64Image = value;

      if (base64Image.contains('base64,')) {
        base64Image = base64Image.split('base64,').last;
      }

      base64Image = base64Image.replaceAll(RegExp(r'\s+'), '');

      return base64Decode(base64Image);
    } on FormatException {
      return null;
    }
  }

  String? get youtubeId {
    // Isi field berita bisa berupa URL YouTube.
    final value = berita.trim();

    if (value.isEmpty) return null;

    final uri = Uri.tryParse(value);
    if (uri == null) return null;

    final host = uri.host.toLowerCase();
    final isYouTube = host == 'youtube.com' ||
        host.endsWith('.youtube.com') ||
        host == 'youtu.be' ||
        host.endsWith('.youtu.be');

    if (!isYouTube) return null;

    if (host == 'youtu.be' || host.endsWith('.youtu.be')) {
      return uri.pathSegments.isNotEmpty
          ? _validVideoId(uri.pathSegments.first)
          : null;
    }

    if (uri.path == '/watch') {
      return _validVideoId(uri.queryParameters['v']);
    }

    if (uri.pathSegments.length >= 2 &&
        ['embed', 'shorts', 'live'].contains(uri.pathSegments.first)) {
      return _validVideoId(uri.pathSegments[1]);
    }

    return null;
  }

  String? _validVideoId(String? value) {
    if (value == null || !RegExp(r'^[a-zA-Z0-9_-]{11}$').hasMatch(value)) {
      return null;
    }

    return value;
  }

  bool get isYoutube => youtubeId != null;

  String get displayText => isYoutube ? '' : berita;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'judul': judul,
      'berita': berita,
      'tanggal': tanggal,
      'gambar': gambar,
      'status': status,
    };
  }
}
