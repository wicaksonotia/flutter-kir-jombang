class MenuModel {
  final String nama;
  final String directlink;
  final bool status;
  final int sorting;

  const MenuModel({
    required this.nama,
    required this.directlink,
    required this.status,
    required this.sorting,
  });

  factory MenuModel.fromJson(Map<String, dynamic> json) {
    return MenuModel(
      nama: json['nama']?.toString() ?? '',
      directlink: json['directlink']?.toString() ?? '',
      status: json['status'] == true,
      sorting: int.tryParse(json['sorting']?.toString() ?? '') ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nama': nama,
      'directlink': directlink,
      'status': status,
      'sorting': sorting,
    };
  }
}
