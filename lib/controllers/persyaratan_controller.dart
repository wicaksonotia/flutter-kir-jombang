import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import 'package:jombang/models/persyaratan_model.dart';
import 'package:jombang/models/persyaratan_detail_model.dart';
import 'package:jombang/networks/api_request.dart';

class PersyaratanController extends GetxController {
  final jenisUjiItem = <PersyaratanModel>[].obs;
  final persyaratan = <PersyaratanDetailModel>[].obs;

  final isLoading = false.obs;
  final isLoadingPersyaratan = false.obs;
  final errorMessage = ''.obs;
  final errorPersyaratan = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    if (isLoading.value) return;

    try {
      isLoading.value = true;
      errorMessage.value = '';

      final result = await RemoteDataSource.getPersyaratan();

      if (result == null) {
        errorMessage.value = 'Tidak ada respons dari server.';
        return;
      }

      jenisUjiItem.assignAll(
        result.where((item) => item.status != false).toList()
          ..sort(
            (a, b) => (a.sorting ?? 0).compareTo(b.sorting ?? 0),
          ),
      );
    } catch (error, stackTrace) {
      debugPrint('[PersyaratanController] Error: $error');
      debugPrintStack(stackTrace: stackTrace);

      errorMessage.value =
          'Gagal memuat jenis pengujian. Silakan coba kembali.';
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchDataDetailPersyaratan(int idJenisUji) async {
    if (isLoadingPersyaratan.value) return;

    try {
      isLoadingPersyaratan.value = true;
      errorPersyaratan.value = '';

      final result = await RemoteDataSource.getDetailPersyaratan(idJenisUji);

      if (result == null) {
        errorPersyaratan.value = 'Tidak ada respons saat memuat persyaratan.';
        return;
      }

      persyaratan.assignAll(result);
    } catch (error, stackTrace) {
      debugPrint(
        '[PersyaratanController] Error persyaratan: $error',
      );
      debugPrintStack(stackTrace: stackTrace);

      errorPersyaratan.value =
          'Gagal memuat persyaratan. Silakan coba kembali.';
    } finally {
      isLoadingPersyaratan.value = false;
    }
  }
}
