import 'package:get/get.dart';
import 'package:jombang/controllers/search_bar_controller.dart';
import 'package:jombang/models/kendaraan_model.dart';
import 'package:jombang/networks/api_request.dart';

class DetailKendaraanController extends GetxController {
  final searchTextFieldController =
      Get.find<SearchBarController>().searchTextFieldController;
  var isLoadingDetailKendaraan = false.obs;
  var resultData = DataDetailKendaraan().obs;

  void getDetailDataKendaraan() async {
    try {
      isLoadingDetailKendaraan(true);
      String valueSearch = searchTextFieldController.text.toString();
      var result = await RemoteDataSource.getDetailKendaraan(valueSearch);
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
      isLoadingDetailKendaraan(false);
    } finally {
      isLoadingDetailKendaraan(false);
    }
  }
}
