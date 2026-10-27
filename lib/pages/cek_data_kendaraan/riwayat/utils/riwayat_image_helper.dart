import 'dart:convert';
import 'dart:typed_data';

class RiwayatImageHelper {
  RiwayatImageHelper._();

  static Uint8List? decodeBase64(String? value) {
    if (value == null || value.trim().isEmpty) {
      return null;
    }

    try {
      var encoded = value.trim();

      // Mendukung format data:image/jpeg;base64,...
      if (encoded.contains(',')) {
        encoded = encoded.substring(encoded.indexOf(',') + 1);
      }

      encoded = encoded.replaceAll(RegExp(r'\s+'), '');

      if (encoded.isEmpty) return null;

      return base64Decode(base64.normalize(encoded));
    } catch (_) {
      return null;
    }
  }
}
