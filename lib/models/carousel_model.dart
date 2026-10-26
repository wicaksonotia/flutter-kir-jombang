import 'dart:convert';
import 'dart:typed_data';

class CarouselModel {
  final Uint8List? gambar;
  final bool status;

  const CarouselModel({
    this.gambar,
    this.status = false,
  });

  factory CarouselModel.fromJson(Map<String, dynamic> json) {
    Uint8List? imageBytes;
    final rawImage = json['gambar'];

    if (rawImage is String && rawImage.trim().isNotEmpty) {
      try {
        var base64Image = rawImage.trim();

        // Mendukung Base64 biasa maupun data URI.
        if (base64Image.contains('base64,')) {
          base64Image = base64Image.split('base64,').last;
        }

        // Hilangkan whitespace yang mungkin ikut dalam respons.
        base64Image = base64Image.replaceAll(RegExp(r'\s+'), '');

        imageBytes = base64Decode(base64Image);
      } on FormatException {
        imageBytes = null;
      }
    }

    return CarouselModel(
      gambar: imageBytes,
      status: json['status'] == true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'gambar': gambar == null ? null : base64Encode(gambar!),
      'status': status,
    };
  }
}
