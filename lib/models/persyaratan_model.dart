class PersyaratanModel {
  String? persyaratan;

  PersyaratanModel({this.persyaratan});

  PersyaratanModel.fromJson(Map<String, dynamic> json) {
    persyaratan = json['persyaratan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['persyaratan'] = persyaratan;
    return data;
  }
}
