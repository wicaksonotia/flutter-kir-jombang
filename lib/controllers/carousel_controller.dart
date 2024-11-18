import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jombang/networks/api_request.dart';
import 'package:jombang/models/carousel_model.dart';

class CarouselBannerController extends GetxController {
  var carouselItems = <CarouselModel>[].obs;
  var isLoading = true.obs;
  RxInt indexSlider = 0.obs;

  @override
  void onInit() {
    fetchCarousel();
    super.onInit();
  }

  void fetchCarousel() async {
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
