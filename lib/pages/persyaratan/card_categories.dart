import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:jombang/controllers/detail_persyaratan_controller.dart';
import 'package:jombang/controllers/jenis_uji_controller.dart';
import 'package:jombang/utils/containers/box_container.dart';
import 'package:jombang/utils/sizes.dart';

class CardCategories extends StatelessWidget {
  CardCategories({
    super.key,
    required this.hexString,
    required this.jenisUjiController,
    required this.index,
  });

  final String hexString;
  final JenisUjiController jenisUjiController;
  final int index;
  final DetailPersyaratanController detailPersyaratanController =
      Get.put(DetailPersyaratanController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => InkWell(
        onTap: () {
          // context.goNamed('detailpersyaratan', queryParameters: {
          //   'nama': jenisUjiController.jenisUjiItem[index].nama
          // });
          detailPersyaratanController.persyaratanHeader.value =
              jenisUjiController.jenisUjiItem[index].nama!;
          detailPersyaratanController
              .fetchData(jenisUjiController.jenisUjiItem[index].nama!);
          context.goNamed('detailpersyaratan');
        },
        child: BoxContainer(
          margin: const EdgeInsets.only(bottom: 10),
          radius: 15,
          shadow: false,
          backgroundColor: Color(int.parse("0xff$hexString")),
          child: Stack(
            children: [
              Positioned(
                top: -10,
                right: -70,
                child: Container(
                  height: 170,
                  width: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white.withOpacity(0.2),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const BoxContainer(
                      radius: 50,
                      height: 50,
                      width: 50,
                      backgroundColor: Colors.white,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            jenisUjiController.jenisUjiItem[index].nama!,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: MySizes.fontSizeLg),
                          ),
                          Text(
                            jenisUjiController.jenisUjiItem[index].keterangan!,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: MySizes.fontSizeMd),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
