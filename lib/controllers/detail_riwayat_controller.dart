import 'package:get/get.dart';
import 'package:jombang/models/riwayat_detail_model.dart';
import 'package:jombang/networks/api_request.dart';

class DetailRiwayatController extends GetxController {
  var isLoading = false.obs;
  var resultData = DataDetailRiwayat().obs;

  void getDetailDataKendaraan(idhasiluji) async {
    try {
      isLoading(true);
      var result = await RemoteDataSource.getDetailRiwayatKendaraan(idhasiluji);
      resultData.value = result!.data!;
      // print(resultData.value.toJson());
      // print(result?.toJson());
      // if (result?.status == 'ok') {
      // resultData.value = result!.data!;
      // print(resultData.value.toJson());
      // } else if (result?.status == 'error') {
      // print('error');
      // }
    } catch (error) {
      print(error);
      // Get.snackbar('Notification', 'Data kendaraan belum terdaftar',
      //     icon: const Icon(Icons.error), snackPosition: SnackPosition.BOTTOM);
      isLoading(false);
    } finally {
      isLoading(false);
    }
  }
}
