import 'package:flutter/material.dart';
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
    } catch (error) {
      Get.snackbar('Error', "Silakan cek koneksi internet anda.",
          icon: const Icon(Icons.error), snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading(false);
    }
  }
}
