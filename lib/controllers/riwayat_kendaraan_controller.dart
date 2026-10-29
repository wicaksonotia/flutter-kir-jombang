import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:jombang/controllers/detail_kendaraan_controller.dart';
import 'package:jombang/controllers/search_bar_controller.dart';
import 'package:jombang/models/riwayat_model.dart';
import 'package:jombang/networks/api_request.dart';

class RiwayatKendaraanController extends GetxController {
  final SearchBarController searchBarController =
      Get.find<SearchBarController>();

  final DetailKendaraanController detailKendaraanController =
      Get.find<DetailKendaraanController>();

  TextEditingController get noUjiController =>
      searchBarController.searchTextFieldController;

  TextEditingController get noRangkaController =>
      detailKendaraanController.noRangkaController;

  final isLoadingRiwayat = false.obs;
  final resultData = <DataRiwayat>[].obs;
  final responseMessage = 'error'.obs;

  String? valueSearch;

  Future<void> getDataRiwayat() async {
    final noUji = noUjiController.text.trim().toUpperCase();
    final noRangka = noRangkaController.text.trim();

    if (noUji.isEmpty || noRangka.isEmpty) {
      _showNotification(
        'Nomor Uji dan 5 digit terakhir Nomor Rangka wajib diisi.',
      );
      return;
    }

    if (!RegExp(r'^\d{5}$').hasMatch(noRangka)) {
      _showNotification(
        'Nomor Rangka harus terdiri dari tepat 5 digit angka.',
      );
      return;
    }

    await getData(
      noUji: noUji,
      noRangka: noRangka,
    );
  }

  Future<void> getData({
    required String noUji,
    required String noRangka,
  }) async {
    if (isLoadingRiwayat.value) return;

    try {
      isLoadingRiwayat.value = true;

      final result = await RemoteDataSource.getRiwayatKendaraan(
        noUji: noUji.trim().toUpperCase(),
        noRangka: noRangka.trim(),
      );

      if (result == null) {
        responseMessage.value = 'error';
        resultData.clear();
        _showNotification('Data riwayat kendaraan tidak ditemukan.');
        return;
      }

      responseMessage.value = result.status ?? 'error';
      resultData.assignAll(result.data ?? []);
      valueSearch = noUji;

      if (resultData.isEmpty) {
        _showNotification('Riwayat uji kendaraan tidak ditemukan.');
      }
    } catch (error) {
      resultData.clear();
      responseMessage.value = 'error';

      _showNotification(
        'Gagal mengambil riwayat kendaraan. Periksa koneksi internet.',
      );
    } finally {
      isLoadingRiwayat.value = false;
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
