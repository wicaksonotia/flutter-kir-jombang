import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:jombang/controllers/menu_controller.dart';
import 'package:jombang/utils/colors.dart';
import 'package:jombang/utils/containers/box_container.dart';
import 'package:jombang/utils/sizes.dart';

class Menu extends StatelessWidget {
  Menu({super.key});
  final HomeMenuController menuController = Get.put(HomeMenuController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (menuController.isLoading.value) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return GridView.builder(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          itemCount: menuController.menuItem.length,
          shrinkWrap: true,
          // physics: const BouncingScrollPhysics(),
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 5,
            crossAxisSpacing: 0,
          ),
          itemBuilder: (_, index) {
            return Column(
              children: [
                InkWell(
                  onTap: () {
                    // context.goNamed(menuController.menuItem[index].directlink!);
                    Get.toNamed(menuController.menuItem[index].directlink!);
                  },
                  child: Column(
                    children: [
                      BoxContainer(
                        radius: 15,
                        height: 45,
                        width: 45,
                        backgroundColor: MyColors.primary,
                        child: Icon(
                          (index != menuController.menuItem.length - 1)
                              ? Icons.add_business_rounded
                              : Icons.add_box,
                          color: Colors.white,
                        ),
                      ),
                      const Gap(3),
                      Text(
                        menuController.menuItem[index].nama!,
                        style: const TextStyle(fontSize: MySizes.fontSizeXsm),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        );
      }
    });
  }
}
