import 'package:get/get.dart';
import 'package:jombang/controllers/search_bar_controller.dart';
import 'package:jombang/models/hasil_uji_model.dart';
import 'package:jombang/models/tidak_lulus_model.dart';
import 'package:jombang/networks/api_request.dart';

class HasilUjiController extends GetxController {
  final searchTextFieldController =
      Get.find<SearchBarController>().searchTextFieldController;
  var isLoadingHasilUji = false.obs;
  var resultDataHasilUji = DataHasilUji().obs;
  RxInt idHasilUji = 0.obs;
  var keteranganTl = <DataTl>[].obs;
  var responseMessage = 'error'.obs;

  void getHasilUjiKendaraan() async {
    try {
      isLoadingHasilUji(true);
      String valueSearch = searchTextFieldController.text.toString();
      var result = await RemoteDataSource.getHasilUji(valueSearch);
      idHasilUji.value = result!.data!.idHasilUji!;
      resultDataHasilUji.value = result.data!;
      var resultTl =
          await RemoteDataSource.getKeteranganTidakLulus(idHasilUji.value);
      responseMessage.value = resultTl!.status!;
      keteranganTl.assignAll(resultTl.data!);
    } catch (error) {
      print(error);
      isLoadingHasilUji(false);
    } finally {
      isLoadingHasilUji(false);
    }
  }
}
