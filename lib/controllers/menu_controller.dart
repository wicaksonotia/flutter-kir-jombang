import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jombang/models/menu_model.dart';
import 'package:jombang/networks/api_request.dart';

class HomeMenuController extends GetxController {
  final menuItem = <MenuModel>[].obs;
  final isLoading = false.obs;
  final hasError = false.obs;

  Future<void> fetchData() async {
    try {
      isLoading.value = true;
      hasError.value = false;

      final result = await RemoteDataSource.getMenu();

      if (result == null) {
        menuItem.clear();
        hasError.value = true;
        return;
      }

      final activeMenus = result.where((menu) => menu.status).toList()
        ..sort((a, b) => a.sorting.compareTo(b.sorting));

      menuItem.assignAll(activeMenus);
    } catch (error, stackTrace) {
      menuItem.clear();
      hasError.value = true;

      debugPrint('Gagal mengambil menu: $error');
      debugPrintStack(stackTrace: stackTrace);
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }
}
