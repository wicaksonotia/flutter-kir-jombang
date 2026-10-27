import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:jombang/models/riwayat_detail_model.dart';
import 'package:jombang/models/tidak_lulus_model.dart';
import 'package:jombang/networks/api_request.dart';

class DetailRiwayatController extends GetxController {
  final isLoading = false.obs;

  final resultData = DataDetailRiwayat().obs;

  final keteranganTlPrauji = <DataTl>[].obs;
  final keteranganTlPitlift = <DataTl>[].obs;
  final keteranganTlLampu = <DataTl>[].obs;
  final keteranganTlRem = <DataTl>[].obs;

  final errorMessage = ''.obs;

  int? currentIdHasilUji;
  String? currentNoUji;

  @override
  void onReady() {
    super.onReady();
    _initializeDetail();
  }

  void _initializeDetail() {
    final arguments = Get.arguments;

    if (arguments is! Map) {
      _setError(
        'Parameter detail pengujian tidak tersedia.',
      );
      return;
    }

    final rawId = arguments['idhasiluji'];
    final rawNoUji = arguments['no_uji'];

    final idHasilUji =
        rawId is int ? rawId : int.tryParse(rawId?.toString() ?? '');

    final noUji = rawNoUji?.toString().trim();

    if (idHasilUji == null ||
        idHasilUji < 1 ||
        noUji == null ||
        noUji.isEmpty) {
      _setError(
        'ID hasil uji atau nomor uji tidak valid.',
      );
      return;
    }

    getDetailDataKendaraan(
      idHasilUji: idHasilUji,
      noUji: noUji,
    );
  }

  Future<void> getDetailDataKendaraan({
    required int idHasilUji,
    required String noUji,
  }) async {
    if (isLoading.value) return;

    try {
      isLoading.value = true;
      errorMessage.value = '';

      currentIdHasilUji = idHasilUji;
      currentNoUji = noUji.trim();

      resultData.value = DataDetailRiwayat();

      keteranganTlPrauji.clear();
      keteranganTlPitlift.clear();
      keteranganTlLampu.clear();
      keteranganTlRem.clear();

      debugPrint(
        '[DetailRiwayat] Memuat detail: '
        'idhasiluji=$idHasilUji, no_uji=$currentNoUji',
      );

      final result = await RemoteDataSource.getDetailRiwayatKendaraan(
        idHasilUji: idHasilUji,
        noUji: currentNoUji!,
      );

      if (result == null) {
        _setError('Tidak ada respons dari server.');
        return;
      }

      if (result.status?.toLowerCase() != 'ok') {
        _setError(
          result.message ?? 'Data detail pengujian tidak ditemukan.',
        );
        return;
      }

      final detail = result.data;

      if (detail == null) {
        _setError('Data detail pengujian tidak ditemukan.');
        return;
      }

      resultData.value = detail;

      // Ambil keterangan tidak lulus untuk setiap tahap pengujian.
      final resultPrauji = await RemoteDataSource.getKeteranganTidakLulus(
        idHasilUji,
        'PRAUJI',
      );

      final resultPitlift = await RemoteDataSource.getKeteranganTidakLulus(
        idHasilUji,
        'PITLIFT',
      );

      final resultLampu = await RemoteDataSource.getKeteranganTidakLulus(
        idHasilUji,
        'LAMPU',
      );

      final resultRem = await RemoteDataSource.getKeteranganTidakLulus(
        idHasilUji,
        'REM',
      );

      keteranganTlPrauji.assignAll(
        resultPrauji?.data ?? <DataTl>[],
      );

      keteranganTlPitlift.assignAll(
        resultPitlift?.data ?? <DataTl>[],
      );

      keteranganTlLampu.assignAll(
        resultLampu?.data ?? <DataTl>[],
      );

      keteranganTlRem.assignAll(
        resultRem?.data ?? <DataTl>[],
      );

      debugPrint(
        '[DetailRiwayat] Detail berhasil dimuat.',
      );
    } catch (error, stackTrace) {
      debugPrint(
        '[DetailRiwayat] Error: $error',
      );
      debugPrintStack(
        stackTrace: stackTrace,
      );

      _setError(
        'Gagal mengambil detail pengujian. '
        'Silakan coba kembali.',
      );
    } finally {
      isLoading.value = false;
    }
  }

  void _setError(String message) {
    errorMessage.value = message;
    debugPrint('[DetailRiwayat] $message');
  }

  void clearError() {
    errorMessage.value = '';
  }
}
