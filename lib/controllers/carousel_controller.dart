import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sampang/networks/api_request.dart';
import 'package:sampang/models/carousel_model.dart';

class CarouselBannerController extends GetxController {
  var carouselItems = <CarouselModel>[].obs;
  var isLoading = true.obs;
  RxInt indexSlider = 0.obs;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  void fetchData() async {
    try {
      isLoading(true);
      var result = await RemoteDataSource.getSlider();
      if (result != null) {
        carouselItems.assignAll(result);
      }
    } catch (error) {
      Get.snackbar('Error', "Silakan cek koneksi internet anda.",
          icon: const Icon(Icons.error), snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading(false);
    }
  }
}
