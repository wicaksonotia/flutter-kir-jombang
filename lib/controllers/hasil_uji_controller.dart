import 'package:flutter/material.dart';
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

      if (result!.status == 'ok') {
        idHasilUji.value = result.data!.idHasilUji!;
        resultDataHasilUji.value = result.data!;

        var resultTl = await RemoteDataSource.getKeteranganTidakLulus(
            idHasilUji.value, 'all');
        responseMessage.value = resultTl!.status!;
        keteranganTl.assignAll(resultTl.data!);
      } else if (result.status == 'error') {
        Get.snackbar('Notification', 'Data kendaraan belum terdaftar.',
            icon: const Icon(Icons.error), snackPosition: SnackPosition.BOTTOM);
      }
    } catch (error) {
      Get.snackbar('Error', "Silakan cek koneksi internet anda.",
          icon: const Icon(Icons.error), snackPosition: SnackPosition.BOTTOM);
      isLoadingHasilUji(false);
    } finally {
      isLoadingHasilUji(false);
    }
  }
}
