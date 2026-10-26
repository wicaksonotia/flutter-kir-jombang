import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:jombang/controllers/detail_kendaraan_controller.dart';
import 'package:jombang/controllers/hasil_uji_controller.dart';
import 'package:jombang/controllers/riwayat_kendaraan_controller.dart';
import 'package:jombang/controllers/riwayat_pendaftaran_controller.dart';
import 'package:jombang/controllers/search_bar_controller.dart';
import 'package:jombang/utils/colors.dart';
import 'package:jombang/utils/widgets/text_field_widget.dart';

class SearchBarContainer extends StatelessWidget {
  final String menu;

  SearchBarContainer({
    super.key,
    required this.menu,
  });

  final SearchBarController searchBarController =
      Get.find<SearchBarController>();

  final DetailKendaraanController detailKendaraanController =
      Get.put(DetailKendaraanController());

  final HasilUjiController hasilUjiController = Get.put(HasilUjiController());

  final RiwayatKendaraanController riwayatKendaraanController =
      Get.put(RiwayatKendaraanController());

  final RiwayatPendaftaranController riwayatPendaftaranController =
      Get.put(RiwayatPendaftaranController());

  void _search() {
    if (menu == 'cekdata') {
      detailKendaraanController.getDetailDataKendaraan();
    } else if (menu == 'hasiluji') {
      hasilUjiController.getHasilUjiKendaraan();
    } else if (menu == 'riwayat') {
      riwayatKendaraanController.getDataRiwayat();
      riwayatPendaftaranController.getDataRiwayatRetribusi();
    }
  }

  Widget _buildField({
    required String hint,
    required TextEditingController controller,
    required IconData prefixIcon,
    IconData? suffixIcon,
    VoidCallback? onTapSuffixIcon,
    ValueChanged<String>? onChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextFieldWidget(
        hint: hint,
        prefixIcon: prefixIcon,
        controller: controller,
        filled: true,
        suffixIcon: suffixIcon,
        onTapSuffixIcon: onTapSuffixIcon,
        onChanged: onChanged,
      ),
    );
  }

  Widget _buildSearchButton({
    required VoidCallback onPressed,
    required bool fullWidth,
  }) {
    return SizedBox(
      height: 50,
      width: fullWidth ? double.infinity : 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: MyColors.orange,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: fullWidth
            ? const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.search),
                  SizedBox(width: 8),
                  Text(
                    'Cari Data Kendaraan',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              )
            : const Icon(Icons.search),
      ),
    );
  }

  Widget _buildCekDataForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildField(
          hint: 'Masukkan Nomor Uji',
          controller: searchBarController.searchTextFieldController,
          prefixIcon: Icons.directions_car_outlined,
          suffixIcon:
              searchBarController.isEmptyValue.value ? null : Icons.clear,
          onTapSuffixIcon: () {
            searchBarController.searchTextFieldController.clear();
            searchBarController.isEmptyValue.value = true;
          },
          onChanged: (value) {
            _formatUppercase(
              searchBarController.searchTextFieldController,
              value,
            );
            searchBarController.isEmptyValue.value = value.isEmpty;
          },
        ),
        const SizedBox(height: 12),
        _buildField(
          hint: '5 digit terakhir Nomor Mesin',
          controller: detailKendaraanController.noMesinController,
          prefixIcon: Icons.pin_outlined,
          suffixIcon: detailKendaraanController.isEmptyNoMesin.value
              ? null
              : Icons.clear,
          onTapSuffixIcon: () {
            detailKendaraanController.noMesinController.clear();
            detailKendaraanController.isEmptyNoMesin.value = true;
          },
          onChanged: (value) {
            _formatUppercase(
              detailKendaraanController.noMesinController,
              value,
            );

            detailKendaraanController.isEmptyNoMesin.value = value.isEmpty;
          },
        ),
        const SizedBox(height: 16),
        _buildSearchButton(
          onPressed: _search,
          fullWidth: true,
        ),
      ],
    );
  }

  Widget _buildOtherSearch() {
    return Row(
      children: [
        Expanded(
          child: _buildField(
            hint: 'Ketik No Uji untuk cek data',
            controller: searchBarController.searchTextFieldController,
            prefixIcon: Icons.search,
            suffixIcon:
                searchBarController.isEmptyValue.value ? null : Icons.clear,
            onTapSuffixIcon: () {
              searchBarController.searchTextFieldController.clear();
              searchBarController.isEmptyValue.value = true;
            },
            onChanged: (value) {
              searchBarController.isEmptyValue.value = value.isEmpty;
            },
          ),
        ),
        _buildSearchButton(
          onPressed: _search,
          fullWidth: false,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (menu == 'cekdata') {
          return _buildCekDataForm();
        }

        return _buildOtherSearch();
      },
    );
  }

  void _formatUppercase(
    TextEditingController controller,
    String value,
  ) {
    final uppercaseValue = value.toUpperCase();

    if (controller.text == uppercaseValue) return;

    controller.value = controller.value.copyWith(
      text: uppercaseValue,
      selection: TextSelection.collapsed(
        offset: uppercaseValue.length,
      ),
      composing: TextRange.empty,
    );
  }
}
