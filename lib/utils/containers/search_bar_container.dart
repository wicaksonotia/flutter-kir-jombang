import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jombang/utils/widgets/text_field_widget.dart';
import 'package:jombang/controllers/search_bar_controller.dart';

class SearchBarContainer extends GetWidget<SearchBarController> {
  const SearchBarContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchBarController());

    return Obx(
      () => Container(
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.all(10),
        child: Expanded(
          child: TextFieldWidget(
            hint: "Ketik No Uji untuk cek data",
            prefixIcon: Icons.search,
            controller: controller.searchTextFieldController,
            filled: true,
            suffixIcon: controller.isEmptyValue.value ? null : Icons.clear,
            onTapSuffixIcon: () {
              controller.searchTextFieldController.clear();
              controller.isEmptyValue.value = true;
            },
            onChanged: (value) {
              value.isEmpty
                  ? controller.isEmptyValue.value = true
                  : controller.isEmptyValue.value = false;
            },
          ),
        ),
      ),
    );
  }
}
