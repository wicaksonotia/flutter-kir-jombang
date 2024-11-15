import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jombang/models/pendaftaran_model.dart';
import 'package:jombang/networks/api_request.dart';

class PendaftaranController extends GetxController {
  TextEditingController name = TextEditingController();
  XFile? pickedFile1;
  XFile? pickedFile2;
  var isLoading = false.obs;
  final formKey = GlobalKey<FormState>();
  var resultData = DataPendaftaran().obs;

  void selectImage1(ImageSource imageSource) async {
    try {
      pickedFile1 = await ImagePicker().pickImage(source: imageSource);
      update();
    } finally {
      // if (Get.isBottomSheetOpen ?? true) Get.back();
    }
  }

  void selectImage2(ImageSource imageSource) async {
    try {
      pickedFile2 = await ImagePicker().pickImage(source: imageSource);
      update();
    } finally {
      // if (Get.isBottomSheetOpen ?? true) Get.back();
    }
  }

  void create() async {
    try {
      isLoading(true);
      if (formKey.currentState!.validate()) {
        // if (pickedFile1 != null) {
        Dio.FormData formData = Dio.FormData.fromMap({
          "name": name.text,
          // "image_1": await Dio.MultipartFile.fromFile(pickedFile1!.path,
          //     filename: pickedFile1!.path.split('/').last),
          // "image_2": await Dio.MultipartFile.fromFile(pickedFile2!.path,
          //     filename: pickedFile2!.path.split('/').last)
        });

        bool result = await RemoteDataSource.createRetribusi(formData);
        if (result) clearController();
        // } else {}
      }
    } finally {
      isLoading(false);
    }
  }

  void getDataRetribusi() async {
    try {
      isLoading(true);
      var result = await RemoteDataSource.getRetribusi(55682);
      if (result != null) {
        resultData.value = result.data!;
      }
    } finally {
      isLoading(false);
    }
  }

  void clearController() {
    name.clear();
    pickedFile1 = null;
    pickedFile2 = null;
    update();
  }
}
