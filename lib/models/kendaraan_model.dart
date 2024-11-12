class DetailKendaraanModel {
  String? status;
  String? message;
  DataDetaiilKendaraan? data;

  DetailKendaraanModel({this.status, this.message, this.data});

  DetailKendaraanModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null
        ? new DataDetaiilKendaraan.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class DataDetaiilKendaraan {
  String? noUji;
  String? noKendaraan;

  DataDetaiilKendaraan({this.noUji, this.noKendaraan});

  DataDetaiilKendaraan.fromJson(Map<String, dynamic> json) {
    noUji = json['no_uji'];
    noKendaraan = json['no_kendaraan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['no_uji'] = noUji;
    data['no_kendaraan'] = noKendaraan;
    return data;
  }
}
