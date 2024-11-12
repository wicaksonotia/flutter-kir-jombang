class TidakLulusModel {
  String? status;
  String? statusMessage;
  List<DataTl>? data;

  TidakLulusModel({this.status, this.statusMessage, this.data});

  TidakLulusModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusMessage = json['status_message'];
    if (json['data'] != null) {
      data = <DataTl>[];
      json['data'].forEach((v) {
        data!.add(DataTl.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['status_message'] = statusMessage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataTl {
  String? kategoriTidakLulus;
  String? keterangan;

  DataTl({this.kategoriTidakLulus, this.keterangan});

  DataTl.fromJson(Map<String, dynamic> json) {
    kategoriTidakLulus = json['kategori_tidak_lulus'];
    keterangan = json['keterangan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['kategori_tidak_lulus'] = kategoriTidakLulus;
    data['keterangan'] = keterangan;
    return data;
  }
}
