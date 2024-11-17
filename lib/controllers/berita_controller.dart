import 'package:get/get.dart';
import 'package:jombang/models/berita_model.dart';
import 'package:jombang/networks/api_request.dart';

class BeritaController extends GetxController {
  var resultData = <BeritaModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  void fetchData() async {
    try {
      isLoading(true);
      var result = await RemoteDataSource.getBerita();
      if (result != null) {
        resultData.assignAll(result);
      }
    } finally {
      isLoading(false);
    }
  }
}
