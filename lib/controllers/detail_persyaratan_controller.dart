import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import 'package:jombang/models/persyaratan_detail_model.dart';
import 'package:jombang/networks/api_request.dart';

class DetailPersyaratanController extends GetxController {
  final persyaratanItem = <PersyaratanDetailModel>[].obs;

  final isLoading = false.obs;
  final errorMessage = ''.obs;

  final persyaratanHeader = 'Persyaratan Uji'.obs;
  final idJenisUji = 0.obs;

  @override
  void onInit() {
    super.onInit();
    _initialize();
  }

  void _initialize() {
    final arguments = Get.arguments;

    if (arguments is! Map) {
      errorMessage.value = 'Informasi jenis pengujian tidak tersedia.';
      return;
    }

    final rawId = arguments['id_jenis_uji'];
    final parsedId = int.tryParse(rawId?.toString() ?? '');
    final nama = arguments['nama']?.toString().trim() ?? '';

    if (parsedId == null || parsedId < 1) {
      errorMessage.value = 'ID jenis pengujian tidak valid.';
      return;
    }

    idJenisUji.value = parsedId;
    persyaratanHeader.value = nama.isNotEmpty ? nama : 'Persyaratan Uji';

    fetchData(parsedId);
  }

  Future<void> fetchData(int id) async {
    if (isLoading.value) return;

    if (id < 1) {
      errorMessage.value = 'ID jenis pengujian tidak valid.';
      return;
    }

    try {
      isLoading.value = true;
      errorMessage.value = '';
      persyaratanItem.clear();

      final result = await RemoteDataSource.getDetailPersyaratan(id);

      if (result == null) {
        errorMessage.value = 'Tidak ada respons dari server.';
        return;
      }

      persyaratanItem.assignAll(result);
    } catch (error, stackTrace) {
      debugPrint(
        '[DetailPersyaratanController] Error: $error',
      );
      debugPrintStack(stackTrace: stackTrace);

      errorMessage.value =
          'Gagal memuat persyaratan. Periksa koneksi lalu coba lagi.';
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> refreshData() async {
    final id = idJenisUji.value;

    if (id > 0) {
      await fetchData(id);
    }
  }
}
