import 'package:get/get.dart';
import 'package:jombang/controllers/search_bar_controller.dart';
import 'package:jombang/models/riwayat_model.dart';
import 'package:jombang/networks/api_request.dart';

class RiwayatKendaraanController extends GetxController {
  final searchTextFieldController =
      Get.find<SearchBarController>().searchTextFieldController;
  var isLoadingRiwayat = false.obs;
  var resultData = <DataRiwayat>[].obs;
  var responseMessage = 'error'.obs;

  void getDataRiwayat() async {
    try {
      isLoadingRiwayat(true);
      String valueSearch = searchTextFieldController.text.toString();
      // String valueSearch = 'CD021016982';
      var result = await RemoteDataSource.getRiwayatKendaraan(valueSearch);
      responseMessage.value = result!.status!;
      resultData.assignAll(result.data!);
    } catch (error) {
      print(error);
      isLoadingRiwayat(false);
    } finally {
      isLoadingRiwayat(false);
    }
  }
}
