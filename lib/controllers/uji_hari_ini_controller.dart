import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jombang/models/uji_hari_ini_model.dart';
import 'package:jombang/networks/api_request.dart';

class UjiHariIniController extends GetxController {
  var resultData = DataUjiHariIni().obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    try {
      isLoading(true);
      var result = await RemoteDataSource.getUjiHariIni();
      resultData.value = result!.data!;
    } catch (error) {
      Get.snackbar('Error', "Silakan cek koneksi internet anda.",
          icon: const Icon(Icons.error), snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading(false);
    }
  }
}
