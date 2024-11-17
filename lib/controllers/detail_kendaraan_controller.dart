import 'package:flutter/material.dart';
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
      // print(result.toJson());
      if (result!.status == 'ok') {
        resultData.value = result.data!;
      } else if (result.status == 'error') {
        Get.snackbar('Notification', 'Data kendaraan belum terdaftar.',
            icon: const Icon(Icons.error), snackPosition: SnackPosition.BOTTOM);
      }
    } catch (error) {
      Get.snackbar('Error', "Silakan cek koneksi internet anda.",
          icon: const Icon(Icons.error), snackPosition: SnackPosition.BOTTOM);
      isLoadingDetailKendaraan(false);
    } finally {
      isLoadingDetailKendaraan(false);
    }
  }
}
