import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jombang/models/kendaraan_model.dart';
import 'package:jombang/networks/api_request.dart';

class SearchBarController extends GetxController {
  RxBool isEmptyValue = true.obs;
  final searchTextFieldController = TextEditingController();
  var isLoading = true.obs;
  var resultData = DataDetaiilKendaraan().obs;

  void getDetailDataKendaraan() async {
    try {
      isLoading(true);
      String valueSearch = searchTextFieldController.text.toString();
      var result = await RemoteDataSource.getDetailKendaraan(valueSearch);
      resultData.value = result!.data!;
      // print(result?.toJson());
      // if (result?.status == 'ok') {
      // resultData.value = result!.data!;
      // print(resultData.value.toJson());
      // } else if (result?.status == 'error') {
      // print('error');
      // }
    } catch (error) {
      print(error);
      // Get.snackbar('Notification', 'Data kendaraan belum terdaftar',
      //     icon: const Icon(Icons.error), snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading(false);
    }
  }
}
