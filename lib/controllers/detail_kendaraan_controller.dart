import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:jombang/controllers/search_bar_controller.dart';
import 'package:jombang/models/kendaraan_model.dart';
import 'package:jombang/networks/api_request.dart';

class DetailKendaraanController extends GetxController {
  late final TextEditingController searchTextFieldController;

  // Input 5 digit terakhir nomor mesin.
  final TextEditingController noMesinController = TextEditingController();

  final isLoadingDetailKendaraan = false.obs;
  final resultData = DataDetailKendaraan().obs;
  final hasResult = false.obs;

  String? valueSearch;
  final isEmptyNoMesin = true.obs;

  @override
  void onInit() {
    super.onInit();

    searchTextFieldController =
        Get.find<SearchBarController>().searchTextFieldController;
  }

  /// Mencari kendaraan dengan Nomor Uji dan
  /// 5 digit terakhir Nomor Mesin.
  Future<void> getDetailDataKendaraan() async {
    final noUji = searchTextFieldController.text.trim().toUpperCase();
    final noMesin = noMesinController.text.trim();

    // Kedua input wajib diisi.
    if (noUji.isEmpty || noMesin.isEmpty) {
      _showNotification(
        'Nomor Uji dan 5 digit terakhir Nomor Mesin wajib diisi.',
      );
      return;
    }

    // Nomor mesin harus tepat 5 digit angka.
    if (!RegExp(r'^\d{5}$').hasMatch(noMesin)) {
      _showNotification(
        'Nomor Mesin harus terdiri dari tepat 5 digit angka.',
      );
      return;
    }

    await getData(
      noUji: noUji,
      noMesin: noMesin,
    );
  }

  /// Mengambil detail kendaraan dari API.
  Future<void> getData({
    required String noUji,
    required String noMesin,
  }) async {
    if (isLoadingDetailKendaraan.value) return;

    try {
      isLoadingDetailKendaraan.value = true;
      hasResult.value = false;

      final result = await RemoteDataSource.getDetailKendaraan(
        noUji: noUji.trim().toUpperCase(),
        noMesin: noMesin.trim().toUpperCase(),
      );

      if (result != null && result.isSuccess && result.data != null) {
        resultData.value = result.data!;
        hasResult.value = true;
        valueSearch = noUji;
      } else {
        _showNotification(
          result?.message ?? 'Data kendaraan tidak ditemukan.',
        );
      }
    } catch (e) {
      _showNotification(
        'Gagal mengambil data kendaraan. Periksa koneksi internet.',
      );
    } finally {
      isLoadingDetailKendaraan.value = false;
    }
  }

  void _showNotification(String message) {
    Get.snackbar(
      'Informasi',
      message,
      icon: const Icon(Icons.info_outline),
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
    );
  }
}
