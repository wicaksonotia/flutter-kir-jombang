import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jombang/models/carousel_model.dart';
import 'package:jombang/networks/api_request.dart';

class CarouselBannerController extends GetxController {
  final carouselItems = <CarouselModel>[].obs;
  final isLoading = false.obs;
  final hasError = false.obs;
  final indexSlider = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      isLoading.value = true;
      hasError.value = false;

      final result = await RemoteDataSource.getSlider();

      if (result == null) {
        carouselItems.clear();
        hasError.value = true;
        return;
      }

      carouselItems.assignAll(result);
      indexSlider.value = 0;
    } catch (error, stackTrace) {
      carouselItems.clear();
      indexSlider.value = 0;
      hasError.value = true;

      debugPrint('Gagal memuat slider: $error');
      debugPrintStack(stackTrace: stackTrace);
    } finally {
      isLoading.value = false;
    }
  }

  void changePage(int index) {
    indexSlider.value = index;
  }
}
