import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sampang/models/riwayat_detail_model.dart';
import 'package:sampang/models/tidak_lulus_model.dart';
import 'package:sampang/networks/api_request.dart';

class DetailRiwayatController extends GetxController {
  var isLoading = false.obs;
  var resultData = DataDetailRiwayat().obs;
  var keteranganTlPrauji = <DataTl>[].obs;
  var keteranganTlPitlift = <DataTl>[].obs;
  var keteranganTlLampu = <DataTl>[].obs;
  var keteranganTlRem = <DataTl>[].obs;

  void getDetailDataKendaraan(idhasiluji) async {
    try {
      isLoading(true);
      var result = await RemoteDataSource.getDetailRiwayatKendaraan(idhasiluji);
      resultData.value = result!.data!;

      var resultTlPrauji =
          await RemoteDataSource.getKeteranganTidakLulus(idhasiluji, 'PRAUJI');
      keteranganTlPrauji.assignAll(resultTlPrauji!.data!);

      var resultTlPitlift =
          await RemoteDataSource.getKeteranganTidakLulus(idhasiluji, 'PITLIFT');
      keteranganTlPitlift.assignAll(resultTlPitlift!.data!);

      var resultTlLampu =
          await RemoteDataSource.getKeteranganTidakLulus(idhasiluji, 'LAMPU');
      keteranganTlLampu.assignAll(resultTlLampu!.data!);

      var resultTlRem =
          await RemoteDataSource.getKeteranganTidakLulus(idhasiluji, 'REM');
      keteranganTlRem.assignAll(resultTlRem!.data!);
      // print(resultData.value.toJson());
      // print(result?.toJson());
      // if (result?.status == 'ok') {
      // resultData.value = result!.data!;
      // print(resultData.value.toJson());
      // } else if (result?.status == 'error') {
      // print('error');
      // }
    } catch (error) {
      Get.snackbar('Notification', 'Data kendaraan belum terdaftar',
          icon: const Icon(Icons.error), snackPosition: SnackPosition.BOTTOM);
      isLoading(false);
    } finally {
      isLoading(false);
    }
  }
}
