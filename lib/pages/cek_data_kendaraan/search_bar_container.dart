import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jombang/controllers/detail_kendaraan_controller.dart';
import 'package:jombang/controllers/hasil_uji_controller.dart';
import 'package:jombang/utils/colors.dart';
import 'package:jombang/utils/widgets/text_field_widget.dart';
import 'package:jombang/controllers/search_bar_controller.dart';

class SearchBarContainer extends StatelessWidget {
  String menu;
  SearchBarContainer({super.key, required this.menu});

  @override
  Widget build(BuildContext context) {
    final SearchBarController controller = Get.put(SearchBarController());
    final HasilUjiController hasilUjiController = Get.put(HasilUjiController());
    final DetailKendaraanController detailKendaraanController =
        Get.put(DetailKendaraanController());

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
                if (menu == 'cekdata') {
                  detailKendaraanController.getDetailDataKendaraan();
                }
                if (menu == 'hasiluji') {
                  hasilUjiController.getHasilUjiKendaraan();
                }
              },
              icon: const Icon(Icons.search),
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
