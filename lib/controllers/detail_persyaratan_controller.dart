import 'package:get/get.dart';
import 'package:jombang/models/persyaratan_model.dart';
import 'package:jombang/utils/api_request.dart';

class DetailPersyaratanController extends GetxController {
  var persyaratanItem = <PersyaratanModel>[].obs;
  var isLoading = true.obs;
  RxString persyaratanHeader = 'UJI PERTAMA'.obs;

  void fetchData(jenisUji) async {
    try {
      isLoading(true);
      var result = await RemoteDataSource.getDetailPersyaratan(jenisUji);
      if (result != null) {
        persyaratanItem.assignAll(result);
      }
    } finally {
      isLoading(false);
    }
    update();
  }
}
