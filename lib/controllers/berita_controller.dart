import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:jombang/models/berita_model.dart';
import 'package:jombang/networks/api_request.dart';

class BeritaController extends GetxController {
  final resultData = <BeritaModel>[].obs;
  final isLoading = false.obs;
  final hasError = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      isLoading.value = true;
      hasError.value = false;

      final result = await RemoteDataSource.getBerita();

      if (result == null) {
        resultData.clear();
        hasError.value = true;
        return;
      }

      resultData.assignAll(result);
    } catch (error, stackTrace) {
      hasError.value = true;

      debugPrint('Gagal memuat berita: $error');
      debugPrintStack(stackTrace: stackTrace);
    } finally {
      isLoading.value = false;
    }
  }
}
