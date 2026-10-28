import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jombang/models/uji_hari_ini_model.dart';
import 'package:jombang/networks/api_request.dart';

class UjiHariIniController extends GetxController {
  final resultData = DataUjiHariIni().obs;
  final isLoading = true.obs;
  final hasError = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      isLoading(true);
      hasError(false);

      final result = await RemoteDataSource.getUjiHariIni();

      if (result == null || result.data == null) {
        hasError(true);
        return;
      }

      resultData.value = result.data!;
    } catch (error, stackTrace) {
      hasError(true);

      debugPrint('Gagal memuat data uji hari ini: $error');
      debugPrintStack(stackTrace: stackTrace);
    } finally {
      isLoading(false);
    }
  }
}
