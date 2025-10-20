import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sampang/controllers/search_bar_controller.dart';
import 'package:sampang/models/pendaftaran_model.dart';
import 'package:sampang/networks/api_request.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RiwayatPendaftaranController extends GetxController {
  final searchTextFieldController =
      Get.find<SearchBarController>().searchTextFieldController;
  var isLoadingListRetribusi = false.obs;
  var resultDataListRetribusi = <DataRetribusi>[].obs;
  String? valueSearch = '';
  bool? isLogin = false;

  @override
  void onInit() {
    super.onInit();
    cekIsLogin();
  }

  void getDataRiwayatRetribusi() async {
    valueSearch = searchTextFieldController.text.toString();
    getData(valueSearch);
  }

  void getData(valueSearch) async {
    try {
      isLoadingListRetribusi(true);
      var result = await RemoteDataSource.getPendaftaran(valueSearch);
      resultDataListRetribusi.assignAll(result!.data!);
    } catch (error) {
      Get.snackbar('Error', "Silakan cek koneksi internet anda.",
          icon: const Icon(Icons.error), snackPosition: SnackPosition.BOTTOM);
      isLoadingListRetribusi(false);
    } finally {
      isLoadingListRetribusi(false);
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
