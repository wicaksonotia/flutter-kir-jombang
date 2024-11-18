class PendaftaranModel {
  String? status;
  String? message;

  PendaftaranModel({this.status, this.message});

  PendaftaranModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}
