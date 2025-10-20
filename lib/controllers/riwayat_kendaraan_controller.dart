import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sampang/controllers/search_bar_controller.dart';
import 'package:sampang/models/riwayat_model.dart';
import 'package:sampang/networks/api_request.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RiwayatKendaraanController extends GetxController {
  final searchTextFieldController =
      Get.find<SearchBarController>().searchTextFieldController;
  var isLoadingRiwayat = false.obs;
  var resultData = <DataRiwayat>[].obs;
  var responseMessage = 'error'.obs;
  String? valueSearch = '';
  bool? isLogin = false;

  @override
  void onInit() {
    super.onInit();
    cekIsLogin();
  }

  void getDataRiwayat() async {
    valueSearch = searchTextFieldController.text.toString();
    getData(valueSearch);
  }

  void getData(valueSearch) async {
    try {
      isLoadingRiwayat(true);
      // String valueSearch = 'CD021016982';
      var result = await RemoteDataSource.getRiwayatKendaraan(valueSearch!);
      responseMessage.value = result!.status!;
      resultData.assignAll(result.data!);
    } catch (error) {
      Get.snackbar('Error', "Silakan cek koneksi internet anda.",
          icon: const Icon(Icons.error), snackPosition: SnackPosition.BOTTOM);
      isLoadingRiwayat(false);
    } finally {
      isLoadingRiwayat(false);
    }
  }

  void cekIsLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    isLogin = prefs.getBool('statusLogin');
    if (isLogin == true) {
      valueSearch = prefs.getString('username');
      getData(valueSearch);
    }
  }
}
