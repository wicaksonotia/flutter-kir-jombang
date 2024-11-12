import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jombang/utils/colors.dart';
import 'package:jombang/utils/containers/box_container.dart';
import 'package:jombang/utils/widgets/text_field_widget.dart';
import 'package:jombang/controllers/search_bar_controller.dart';

class SearchBarContainer extends GetWidget<SearchBarController> {
  const SearchBarContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchBarController());

    return Obx(
      () => Row(
        children: [
          // TEXT FIELD SEARCH
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 7,
                  ),
                ],
              ),
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

          Container(
            height: 50,
            width: 50,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              color: MyColors.orange,
            ),
            child: IconButton(
              onPressed: () {
                controller.getDetailDataKendaraan();
              },
              icon: const Icon(Icons.search),
              color: Colors.white,
            ),
          ),
        ],
      ),

      // Container(
      //   margin: const EdgeInsets.only(top: 20, right: 10, bottom: 20),
      //   decoration: BoxDecoration(
      //     boxShadow: [
      //       BoxShadow(
      //         color: Colors.grey.withOpacity(0.3),
      //         spreadRadius: 2,
      //         blurRadius: 7,
      //       ),
      //     ],
      //   ),
      //   child: TextFieldWidget(
      //     hint: "Ketik No Uji untuk cek data",
      //     prefixIcon: Icons.search,
      //     controller: controller.searchTextFieldController,
      //     filled: true,
      //     suffixIcon: controller.isEmptyValue.value ? null : Icons.clear,
      //     onTapSuffixIcon: () {
      //       controller.searchTextFieldController.clear();
      //       controller.isEmptyValue.value = true;
      //     },
      //     onChanged: (value) {
      //       value.isEmpty
      //           ? controller.isEmptyValue.value = true
      //           : controller.isEmptyValue.value = false;
      //     },
      //   ),
      // ),
      // BoxContainer(
      //   height: 40,
      //   width: 40,
      //   margin: const EdgeInsets.only(left: 5),
      //   radius: 7,
      //   backgroundColor: MyColors.orange,
      //   shadow: false,
      //   child: IconButton(
      //     onPressed: () {
      //       controller.getDetailDataKendaraan();
      //     },
      //     icon: const Icon(Icons.search),
      //     color: Colors.white,
      //   ),
      // ),
      //     Container(
      //   margin: EdgeInsets.only(bottom: 20),
      //   decoration: BoxDecoration(
      //     color: Colors.white,
      //     borderRadius: BorderRadius.circular(25.0),
      //     boxShadow: [
      //       BoxShadow(
      //         offset: Offset(0, 5),
      //         blurRadius: 10.0,
      //         color: Colors.black.withOpacity(0.5),
      //       ),
      //     ],
      //   ),
      //   child: TextField(
      //     style: TextStyle(
      //       fontSize: 25.0,
      //       color: Colors.blueAccent,
      //     ),
      //     decoration: InputDecoration(
      //       contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      //       prefixIcon: const Icon(Icons.search),
      //       // suffixIcon: controller.isEmptyValue.value ? null : Icon(Icons.clear),
      //       suffixIcon: IconButton(
      //         icon: Icon(
      //           controller.isEmptyValue.value ? null : Icons.clear,
      //           color: MyColors.primary,
      //           size: 25,
      //         ),
      //         onPressed: () {
      //           controller.searchTextFieldController.clear();
      //           controller.isEmptyValue.value = true;
      //         },
      //       ),

      //       hintText: "Search services",
      //       border: OutlineInputBorder(
      //         borderSide: BorderSide(color: Colors.white, width: 32.0),
      //         borderRadius: BorderRadius.circular(25.0),
      //       ),
      //       focusedBorder: OutlineInputBorder(
      //         borderSide: BorderSide(color: Colors.white, width: 32.0),
      //         borderRadius: BorderRadius.circular(25.0),
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
