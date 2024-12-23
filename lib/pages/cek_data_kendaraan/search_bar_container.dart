import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jombang/controllers/detail_kendaraan_controller.dart';
import 'package:jombang/controllers/hasil_uji_controller.dart';
import 'package:jombang/controllers/riwayat_kendaraan_controller.dart';
import 'package:jombang/controllers/riwayat_pendaftaran_controller.dart';
import 'package:jombang/utils/colors.dart';
import 'package:jombang/utils/widgets/text_field_widget.dart';
import 'package:jombang/controllers/search_bar_controller.dart';

class SearchBarContainer extends StatelessWidget {
  final String menu;
  SearchBarContainer({super.key, required this.menu});
  final SearchBarController searchBarController =
      Get.find<SearchBarController>();
  final DetailKendaraanController detailKendaraanController =
      Get.put(DetailKendaraanController());
  final HasilUjiController hasilUjiController = Get.put(HasilUjiController());
  final RiwayatKendaraanController riwayatKendaraanController =
      Get.put(RiwayatKendaraanController());
  final RiwayatPendaftaranController riwayatPendaftaranController =
      Get.put(RiwayatPendaftaranController());

  @override
  Widget build(BuildContext context) {
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
                controller: searchBarController.searchTextFieldController,
                filled: true,
                suffixIcon:
                    searchBarController.isEmptyValue.value ? null : Icons.clear,
                onTapSuffixIcon: () {
                  searchBarController.searchTextFieldController.clear();
                  searchBarController.isEmptyValue.value = true;
                },
                onChanged: (value) {
                  value.isEmpty
                      ? searchBarController.isEmptyValue.value = true
                      : searchBarController.isEmptyValue.value = false;
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
                if (menu == 'riwayat') {
                  riwayatKendaraanController.getDataRiwayat();
                  riwayatPendaftaranController.getDataRiwayatRetribusi();
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
