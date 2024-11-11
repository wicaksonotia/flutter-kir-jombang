import 'package:get/get.dart';
import 'package:jombang/models/jenis_uji_model.dart';
import 'package:jombang/models/persyaratan_model.dart';
import 'package:jombang/utils/api_request.dart';

class JenisUjiController extends GetxController {
  var jenisUjiItem = <JenisUjiModel>[].obs;
  var isLoading = true.obs;
  var jenisUji = 'UJI PERTAMA'.obs;
  var persyaratan = <PersyaratanModel>[].obs;

  @override
  void onInit() {
    fetchData();
    fetchDataDetailPersyaratan();
    super.onInit();
  }

  void fetchData() async {
    try {
      isLoading(true);
      var result = await RemoteDataSource.getJenisUji();
      if (result != null) {
        jenisUjiItem.assignAll(result);
      }
    } finally {
      isLoading(false);
    }
  }

  void fetchDataDetailPersyaratan() async {
    try {
      isLoading(true);
      var result = await RemoteDataSource.getDetailPersyaratan(jenisUji.value);
      if (result != null) {
        persyaratan.assignAll(result);
      }
    } finally {
      isLoading(false);
    }
  }
}
