class CarouselModel {
  String? gambar;

  CarouselModel({this.gambar});

  CarouselModel.fromJson(Map<String, dynamic> json) {
    gambar = json['gambar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['gambar'] = gambar;
    return data;
  }
}
