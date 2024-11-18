import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:intl/intl.dart';
// import 'package:jombang/models/pendaftaran_model.dart';
import 'package:jombang/networks/api_request.dart';

class PendaftaranController extends GetxController {
  TextEditingController nouji = TextEditingController();
  var selectedDate = DateTime.now().obs;
  XFile? pickedFile1;
  XFile? pickedFile2;
  XFile? pickedFile3;
  XFile? pickedFile4;
  var isLoading = false.obs;
  final formKey = GlobalKey<FormState>();
  // var resultData = DataPendaftaran().obs;

  void clearController() {
    nouji.clear();
    pickedFile1 = null;
    pickedFile2 = null;
    pickedFile3 = null;
    pickedFile4 = null;
    update();
  }

  void selectImage1(ImageSource imageSource) async {
    try {
      pickedFile1 = await ImagePicker().pickImage(source: imageSource);
      update();
      Get.back();
    } catch (error) {
      Get.snackbar('Error', error.toString(),
          icon: const Icon(Icons.error), snackPosition: SnackPosition.BOTTOM);
    }
  }

  void selectImage2(ImageSource imageSource) async {
    try {
      pickedFile2 = await ImagePicker().pickImage(source: imageSource);
      update();
      Get.back();
    } catch (error) {
      Get.snackbar('Error', error.toString(),
          icon: const Icon(Icons.error), snackPosition: SnackPosition.BOTTOM);
    }
  }

  void selectImage3(ImageSource imageSource) async {
    try {
      pickedFile3 = await ImagePicker().pickImage(source: imageSource);
      update();
      Get.back();
    } catch (error) {
      Get.snackbar('Error', error.toString(),
          icon: const Icon(Icons.error), snackPosition: SnackPosition.BOTTOM);
    }
  }

  void selectImage4(ImageSource imageSource) async {
    try {
      pickedFile4 = await ImagePicker().pickImage(source: imageSource);
      update();
      Get.back();
    } catch (error) {
      Get.snackbar('Error', error.toString(),
          icon: const Icon(Icons.error), snackPosition: SnackPosition.BOTTOM);
    }
  }

  void create() async {
    try {
      isLoading(true);
      if (formKey.currentState!.validate()) {
        if (pickedFile1 != null &&
            pickedFile2 != null &&
            pickedFile3 != null &&
            pickedFile4 != null) {
          Dio.FormData formData = Dio.FormData.fromMap({
            "nouji": nouji.text,
            // "tanggaluji": DateFormat('yyyy-mm-dd').format(selectedDate.value),
            "tanggaluji": selectedDate.value,
            "image_1": await Dio.MultipartFile.fromFile(pickedFile1!.path,
                filename: pickedFile1!.path.split('/').last),
            "image_2": await Dio.MultipartFile.fromFile(pickedFile2!.path,
                filename: pickedFile2!.path.split('/').last),
            // "image_3": await Dio.MultipartFile.fromFile(pickedFile3!.path,
            //     filename: pickedFile1!.path.split('/').last),
            // "image_4": await Dio.MultipartFile.fromFile(pickedFile4!.path,
            //     filename: pickedFile2!.path.split('/').last),
          });

          bool result = await RemoteDataSource.createRetribusi(formData);
          if (result) {
            clearController();
            Get.snackbar('Notification', 'Terimakasih',
                icon: const Icon(Icons.error),
                snackPosition: SnackPosition.BOTTOM);
          }
        } else {
          Get.snackbar('Notification', 'Mohon data dilengkapi.',
              icon: const Icon(Icons.error),
              snackPosition: SnackPosition.BOTTOM);
        }
      }
    } finally {
      isLoading(false);
    }
  }

  // void getDataRetribusi() async {
  //   try {
  //     isLoading(true);
  //     var result = await RemoteDataSource.getRetribusi(55682);
  //     if (result != null) {
  //       resultData.value = result.data!;
  //     }
  //   } finally {
  //     isLoading(false);
  //   }
  // }

  // PILIH TANGGAL UJI
  bool disableDate(DateTime day) {
    final List<int> disableWeekdays = [
      DateTime.sunday,
      DateTime.saturday,
    ];
    if ((day.isAfter(DateTime.now().subtract(const Duration(days: 2))) &&
            day.isBefore(DateTime.now().add(const Duration(days: 7)))) &&
        !disableWeekdays.contains(day.weekday)) {
      return true;
    }
    return false;
  }

  chooseDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: selectedDate.value,
        firstDate: DateTime(2024),
        lastDate: DateTime(2025),
        //initialEntryMode: DatePickerEntryMode.input,
        // initialDatePickerMode: DatePickerMode.year,
        helpText: 'Pilih Tanggal Uji',
        cancelText: 'Close',
        confirmText: 'Confirm',
        errorFormatText: 'Enter valid date',
        errorInvalidText: 'Enter valid date range',
        fieldLabelText: 'Pilih Tanggal Uji',
        fieldHintText: 'Month/Date/Year',
        selectableDayPredicate: disableDate);
    if (pickedDate != null && pickedDate != selectedDate.value) {
      selectedDate.value = pickedDate;
    }
  }
}
