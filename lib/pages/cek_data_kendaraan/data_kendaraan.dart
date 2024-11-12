import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jombang/controllers/search_bar_controller.dart';

class DataKendaraan extends GetWidget<SearchBarController> {
  const DataKendaraan({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchBarController());

    return Obx(
      () => Text(controller.resultData.value.noUji ?? '-'),
    );
  }
}
