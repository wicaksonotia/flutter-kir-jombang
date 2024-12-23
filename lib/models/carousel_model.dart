import 'dart:convert';
import 'dart:typed_data';

class CarouselModel {
  Uint8List? gambar;

  CarouselModel({this.gambar});

  CarouselModel.fromJson(Map<String, dynamic> json) {
    Uint8List decodePhoto;
    decodePhoto = const Base64Decoder().convert('${json['gambar']}');
    gambar = decodePhoto;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['gambar'] = gambar;
    return data;
  }
}
