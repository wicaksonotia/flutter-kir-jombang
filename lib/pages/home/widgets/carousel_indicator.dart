import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jombang/controllers/carousel_controller.dart';
import 'package:jombang/utils/colors.dart';

class CarouselIndicator extends StatelessWidget {
  const CarouselIndicator({
    super.key,
    required this.count,
    required this.carouselController,
  });

  final int count;
  final CarouselBannerController carouselController;

  @override
  Widget build(BuildContext context) {
    if (count <= 1) {
      return const SizedBox(height: 6);
    }

    return Obx(() {
      final selected = carouselController.indexSlider.value;

      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(count, (index) {
          final isSelected = selected == index;

          return AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeOut,
            width: isSelected ? 22 : 6,
            height: 6,
            margin: const EdgeInsets.symmetric(horizontal: 3),
            decoration: BoxDecoration(
              color: isSelected ? MyColors.primary : const Color(0xFFD6DEE9),
              borderRadius: BorderRadius.circular(20),
            ),
          );
        }),
      );
    });
  }
}
