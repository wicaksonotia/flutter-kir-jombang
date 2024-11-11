class MenuModel {
  String? nama;
  String? directlink;

  MenuModel({this.nama, this.directlink});

  MenuModel.fromJson(Map<String, dynamic> json) {
    nama = json['nama'];
    directlink = json['directlink'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nama'] = nama;
    data['directlink'] = directlink;
    return data;
  }
}
